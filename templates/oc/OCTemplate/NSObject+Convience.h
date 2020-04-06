//
//  NSObject+Convience.h
//  FGeacherBoard
//
//  Created by Ferris on 2020/3/3.
//  Copyright © 2020 localOrganization. All rights reserved.
//




#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Convience)
- (void)performBlockInMainThread:(void (^)(void))block afterDelay:(NSTimeInterval)delay;

- (void)performBlockInBackground:(void(^)(void))block;

- (void)runBlockInMainThreadFastestLoop:(void (^)(void))block;


@end

NS_ASSUME_NONNULL_END
