//
//  NSObject+Convience.m
//  FGeacherBoard
//
//  Created by Ferris on 2020/3/3.
//  Copyright © 2020 localOrganization. All rights reserved.
//

#import "NSObject+Convience.h"


@implementation NSObject (Convience)
- (void)performBlockInMainThread:(void (^)(void))block afterDelay:(NSTimeInterval)delay
{
    int64_t delta = (int64_t)(1.0e9 * delay);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delta), dispatch_get_main_queue(), block);
}

- (void)performBlockInBackground:(void(^)(void))block
{
    dispatch_async(dispatch_get_global_queue(0, 0), block);
}

- (void)runBlockInMainThreadFastestLoop:(void (^)(void))block
{
    if ([NSThread isMainThread] == YES) {
        block();
    } else {
        dispatch_async(dispatch_get_main_queue(), block);
    }
}
@end
