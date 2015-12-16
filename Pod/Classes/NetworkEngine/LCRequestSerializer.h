//
//  LCRequestSerializer.h
//  Pods
//
//  Created by linhua on 15/11/16.
//
//

#import <AFNetworking/AFNetworking.h>

@interface LCRequestSerializer : AFJSONRequestSerializer

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method URLString:(NSString *)URLString parameters:(id)parameters error:(NSError *__autoreleasing *)error;


- (NSMutableURLRequest *)multipartFormRequestWithMethod:(NSString *)method URLString:(NSString *)URLString parameters:(NSDictionary *)parameters constructingBodyWithBlock:(void (^)(id<AFMultipartFormData> formData))block error:(NSError *__autoreleasing *)error;

@end
