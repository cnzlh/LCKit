//
//  LCRequestSerializer.m
//  Pods
//
//  Created by linhua on 15/11/16.
//
//

#import "LCRequestSerializer.h"
#import "LCNetworkEngine.h"

#define TIMEOUT_SECONDS_DEFAULT     15

@implementation LCRequestSerializer

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method URLString:(NSString *)URLString parameters:(id)parameters error:(NSError *__autoreleasing *)error
{
    NSMutableURLRequest *request = [super requestWithMethod:method URLString:URLString parameters:parameters error:error];
    request.timeoutInterval = TIMEOUT_SECONDS_DEFAULT;
    return request;
}

- (NSMutableURLRequest *)multipartFormRequestWithMethod:(NSString *)method URLString:(NSString *)URLString parameters:(NSDictionary *)parameters constructingBodyWithBlock:(void (^)(id<AFMultipartFormData> formData))block error:(NSError *__autoreleasing *)error
{
    NSMutableURLRequest *request = [super multipartFormRequestWithMethod:method
                                                               URLString:URLString
                                                              parameters:parameters
                                               constructingBodyWithBlock:block
                                                                   error:nil];
    
    request.timeoutInterval = TIMEOUT_SECONDS_DEFAULT;
    return request;
}


@end
