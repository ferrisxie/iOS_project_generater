//
//  FGRouteAddress.h
//  FGeacherBoard
//
//  Created by Ferris on 2020/3/3.
//  Copyright © 2020 localOrganization. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
extern NSString * const kFGAddressPrefix;

@interface FGRouteAddress : NSURL
- (id __nullable)objectForKeyedSubscript:(id<NSCopying> __nullable)key;
@end

NS_ASSUME_NONNULL_END
