//
//  LCNetworkEngine.m
//  Pods
//
//  Created by linhua on 15/11/16.
//
//

#import "LCNetworkEngine.h"
#import "LCRequestSerializer.h"
#import "AFHTTPRequestOperationManager+AutoRetry.h"
#import "NSDictionary_JSONExtensions.h"

@implementation LCNetworkEngine

+ (instancetype )sharedEngine {
    static LCNetworkEngine *_engine = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _engine = [[LCNetworkEngine alloc] init];
        _engine.requestSerializer = [LCRequestSerializer serializer];
    });
    
    return _engine;
}

- (id)init
{
    self = [super init];
    if (!self) {
        return nil;
    }
    self.operationQueue.maxConcurrentOperationCount = 3;
    self.responseSerializer = [AFHTTPResponseSerializer serializer];
    return self;
}

// 取消单个操作
- (void)cancelOperation:(AFHTTPRequestOperation *)operation
{
    [operation cancel];
}

// 取消queue中所有的操作
- (void)cancelAllOperations
{
    [self.operationQueue cancelAllOperations];
}

- (AFHTTPRequestOperation *)requestWithMethod:(HttpMethod )method
                                    URLString:(NSString *)URLString
                                   parameters:(NSDictionary *)parameters
                                 successBlock:(HTTPRequestSuccessBlock)success
                                  failedBlock:(HTTPRequestFailedBlock)failed
                                    autoRetry:(int)timesToRetry {
    LCRequestSerializer *serializer = [LCRequestSerializer serializer];

    NSMutableURLRequest *request = [serializer requestWithMethod:method == HttpMethodGet? @"GET":@"POST"
                                                       URLString:URLString
                                                      parameters:parameters
                                                           error:nil];
    
    NSLog(@"%@ %@",request.URL,parameters);
    AFHTTPRequestOperation *operation =
    [self HTTPRequestOperationWithRequest:request
                                  success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                      
                                      [self handlerResponseWithOperation:operation
                                                          responseObject:responseObject
                                                             resultBlock:^(id result) {
                                                                 success(operation,result);
                                                             } expiredBlock:^(BOOL expired, id errorInfo) {
                                                                 if ([errorInfo isKindOfClass:[NSError class]]) {
                                                                     failed(operation,errorInfo);
                                                                 }else if(!errorInfo){
                                                                     //将新的SID替换原来的SID将请求再次发出
                                                                     NSDictionary *newParams = parameters;
                                                                     if (parameters[@"sid"]) {
                                                                         NSMutableDictionary *mutDic = [NSMutableDictionary dictionary];
                                                                         [mutDic setObject:@"newsid" forKey:@"sid"];
                                                                         newParams = [NSDictionary dictionaryWithDictionary:mutDic];
                                                                     }
                                                                     
                                                                     [self requestWithMethod:method
                                                                                   URLString:URLString
                                                                                  parameters:parameters
                                                                                successBlock:success
                                                                                 failedBlock:failed
                                                                                   autoRetry:timesToRetry];
                                                                 }else{
                                                                     NSError *error = [NSError errorWithDomain:@"com.mochui.relogin"
                                                                                                          code:[[errorInfo objectForKey:@"code"] integerValue]
                                                                                                      userInfo:nil];
                                                                     failed(operation,error);
                                                                 }
                                                             }];
                                      
                                  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                      failed(operation,error);
                                  }
                              autoRetryOf:timesToRetry
                            retryInterval:1];
    [self.operationQueue addOperation:operation];
    return operation;

}

- (AFHTTPRequestOperation *)requestWithMethod:(HttpMethod )method
                                    URLString:(NSString *)URLString
                                   parameters:(NSDictionary *)parameters
                    constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
                                 successBlock:(HTTPRequestSuccessBlock)success
                                  failedBlock:(HTTPRequestFailedBlock)failed
                                    autoRetry:(int)timesToRetry
{
    
    LCRequestSerializer *serializer = [LCRequestSerializer serializer];
    NSMutableURLRequest *request = [serializer multipartFormRequestWithMethod:method == HttpMethodGet? @"GET":@"POST"
                                                                    URLString:URLString
                                                                   parameters:parameters
                                                    constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                                                        block(formData);
                                                    } error:nil];
    
    NSLog(@"%@ %@",request.URL,parameters);
    
    AFHTTPRequestOperation *operation =
    [self HTTPRequestOperationWithRequest:request
                                  success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                      [self handlerResponseWithOperation:operation
                                                          responseObject:responseObject
                                                             resultBlock:^(id result) {
                                                                 success(operation,result);
                                                             } expiredBlock:^(BOOL expired, id errorInfo) {
                                                                 if ([errorInfo isKindOfClass:[NSError class]]) {
                                                                     failed(operation,errorInfo);
                                                                 }else if(!errorInfo){
                                                                     [self requestWithMethod:method
                                                                                   URLString:URLString
                                                                                  parameters:parameters
                                                                   constructingBodyWithBlock:block
                                                                                successBlock:success
                                                                                 failedBlock:failed
                                                                                   autoRetry:timesToRetry];
                                                                 }else{
                                                                     NSError *error = [NSError errorWithDomain:@"com.mochui.relogin"
                                                                                                          code:[[errorInfo objectForKey:@"code"] integerValue]
                                                                                                      userInfo:nil];
                                                                     failed(operation,error);
                                                                 }
                                                             }];
                                      
                                  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                      failed(operation,error);
                                  }
                              autoRetryOf:timesToRetry
                            retryInterval:0 ];
    [self.operationQueue addOperation:operation];
    return operation;
}


- (void)handlerResponseWithOperation:(AFHTTPRequestOperation *)operation
                      responseObject:(id)responseObject
                         resultBlock:(HandlerResultBlock)result
                        expiredBlock:(SessionExpiredBlock)expired
{
    NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
    NSLog(@"%@\n%@",operation.request.URL,string);
    NSDictionary *dic = [NSDictionary dictionaryWithJSONString:string error:nil];
    //    NSLog(@"%@\n %@",operation.request.URL,dic);
    NSNumber *codeValue = [dic objectForKey:@"code"];
    
    //登录超时
    if ((codeValue && [codeValue integerValue] == 4) || (codeValue && [codeValue integerValue] == 100015)){
        //如果本身是login请求，则将结果返回,否则断定为session超时
    #warning URL setting
        if ([[operation.request.URL absoluteString] rangeOfString:@"loginurl"].location != NSNotFound){
            result(dic);
        }else{
            [self reloginUsingBlock:^(BOOL isExpired, id errorInfo) {
                expired(isExpired,errorInfo);
            }];
        }
    }else{
        result(dic);
    }
}

- (void)reloginUsingBlock:(SessionExpiredBlock )isExpired {
    NSString *username = @"username";
    NSString *password = @"password";
    
    
    NSLog(@"reloginUsingBlock");
    NSDictionary *params = @{
                             @"mobile": username,
                             @"password": password,
                             };
    
    NSString *baseURLString = @"url";
    
    [self POST:[baseURLString stringByAppendingPathComponent:@"loginurl"]
    parameters:params
       success:^(AFHTTPRequestOperation *operation, id responseObject) {
           NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
           NSDictionary *dict = [NSDictionary dictionaryWithJSONString:string error:nil];
           NSNumber *codeValue = [dict objectForKey:@"code"];
           if (codeValue && [codeValue integerValue] == 0){
               //登录成功
               
               isExpired(YES,nil);
           }
           else{
               isExpired(YES,dict);
           }
       } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
           isExpired(YES,error);
       } autoRetry:0];
}

+ (NSArray *)cookiesForURL:(NSURL *)url {
    NSHTTPCookieStorage *sharedHTTPCookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    
    if ([sharedHTTPCookieStorage cookieAcceptPolicy] != NSHTTPCookieAcceptPolicyAlways) {
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookieAcceptPolicy:NSHTTPCookieAcceptPolicyAlways];
    }
    
    if (url == nil) {
        NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
        return cookies;
    }
    else {
        NSArray *cookies = [sharedHTTPCookieStorage cookiesForURL:url];
        return cookies;
    }
}

+ (NSString *)cookieValueForURL:(NSURL *)url forKey:(NSString *)key {
    NSArray *cookies = [LCNetworkEngine cookiesForURL:url];
    NSEnumerator    *enumerator = [cookies objectEnumerator];
    NSHTTPCookie    *cookie;
    while (cookie = [enumerator nextObject]) {
        if ([[cookie name] isEqualToString:key]) {
            return [NSString stringWithString:[[cookie value] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        }
    }
    return nil;
}

@end
