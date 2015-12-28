//
//  NSOperationQueue+Completion.m
//  Pods
//
//  Created by linhua on 15/12/28.
//
//

#import "NSOperationQueue+Completion.h"

@implementation NSOperationQueue (Completion)

- (void)setCompletion:(NSOperationQueueCompletion)completion
{
    NSOperationQueueCompletion copiedCompletion = [completion copy];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self waitUntilAllOperationsAreFinished];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            copiedCompletion();
        });
    });
}

@end
