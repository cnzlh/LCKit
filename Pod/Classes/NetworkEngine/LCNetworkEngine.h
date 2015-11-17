//
//  LCNetworkEngine.h
//  Pods
//
//  Created by linhua on 15/11/16.
//
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"

typedef void (^HTTPRequestSuccessBlock)(AFHTTPRequestOperation *operation,id responseObject);
typedef void (^HTTPRequestFailedBlock)(AFHTTPRequestOperation *operation, NSError *error);
typedef void (^SessionExpiredBlock)(BOOL isExpired, id errorInfo);
typedef void (^HandlerResultBlock)(id result);

typedef NS_ENUM(NSInteger, HttpMethod) {
    HttpMethodGet,
    HttpMethodPost
};

#define TimeOutSeconds      30

@interface LCNetworkEngine : AFHTTPRequestOperationManager

+ (instancetype )sharedEngine;

- (AFHTTPRequestOperation *)requestWithMethod:(HttpMethod )method
                                    URLString:(NSString *)URLString
                                   parameters:(NSDictionary *)parameters
                                 successBlock:(HTTPRequestSuccessBlock)success
                                  failedBlock:(HTTPRequestFailedBlock)failed
                                    autoRetry:(int)timesToRetry;


- (AFHTTPRequestOperation *)requestWithMethod:(HttpMethod )method
                                    URLString:(NSString *)URLString
                                   parameters:(NSDictionary *)parameters
                    constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
                                 successBlock:(HTTPRequestSuccessBlock)success
                                  failedBlock:(HTTPRequestFailedBlock)failed
                                    autoRetry:(int)timesToRetry;

- (void)cancelOperation:(AFHTTPRequestOperation *)operation;

- (void)cancelAllOperations;

/**
 *  获取cookies
 *
 *  @param url 指定url地址
 */
+ (NSArray *)cookiesForURL:(NSURL *)url;

+ (NSString *)cookieValueForURL:(NSURL *)url forKey:(NSString *)key;

@end
