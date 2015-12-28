//
//  NSOperationQueue+Completion.h
//  Pods
//
//  Created by linhua on 15/12/28.
//
//

#import <Foundation/Foundation.h>

@interface NSOperationQueue (Completion)

typedef void (^NSOperationQueueCompletion) (void);

/**
 * Remarks:
 *
 * 1. Invokes completion handler just a single time when previously added operations are finished.
 * 2. Completion handler is called in a main thread.
 */

- (void)setCompletion:(NSOperationQueueCompletion)completion;

@end
