//
//  FGRouteAddress.m
//  FGeacherBoard
//
//  Created by Ferris on 2020/3/3.
//  Copyright © 2020 localOrganization. All rights reserved.
//

#import "FGRouteAddress.h"
NSString * const kFGAddressPrefix = @"QBAddressPrefix";
@implementation FGRouteAddress{
    NSString* _originURLString;
    NSMutableDictionary *_parameters;
}
- (instancetype)initWithString:(NSString *)URLString{
    if (self = [super initWithString:URLString]) {
        if (nil == URLString) {
            URLString = @"";
        }
        
        _originURLString = URLString;
    }
    
    return self;
}
-(id)objectForKeyedSubscript:(id<NSCopying>)key{
    id value = nil;
    if (_parameters == nil) {
        [self _parse];
    }
    value = _parameters[key];
    return value ? value : @"";
}
- (BOOL)_parse
{
    if (_parameters.count > 0 && _parameters != nil) {
        [_parameters removeAllObjects];
    }
    else {
        _parameters = [[NSMutableDictionary alloc] init];
    }
    
    if ([_originURLString length] <= 0) {
        return NO;
    }
    
    NSRange questionMarkRange = [_originURLString rangeOfString:@"?"];
    if (questionMarkRange.location == NSNotFound) {
        return NO;
    }
    
    NSString * prefix = [_originURLString substringToIndex:questionMarkRange.location];
    _parameters[kFGAddressPrefix] = prefix;
    NSString *parameters = [_originURLString substringFromIndex:questionMarkRange.location + 1];
    NSArray *parameterArray = [parameters componentsSeparatedByString:@"&"];
    for(NSString *parameter in parameterArray){
        @autoreleasepool {
            NSArray * kv = [parameter componentsSeparatedByString:@"="];
            if (kv.count == 2) {
                NSString * key = kv.firstObject;
                NSString * value = [kv.lastObject stringByRemovingPercentEncoding];
                if (key.length > 0 && value.length > 0) {
                    if (_parameters[key] == nil) {
                        _parameters[key] = value;
                    }
                }
            }
        }
    }
    
    return YES;
}
@end
