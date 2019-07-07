//
// Created by ZengPu on 2019-07-07.
// Copyright (c) 2019 Zi Mu. All rights reserved.
//

#import "ERUIUtils.h"


@implementation ERUIUtils

static ERUIUtils *sharedSingleton = nil;

+ (ERUIUtils *)sharedInstance {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedSingleton = (ERUIUtils *) [[super alloc] init];
    });
    return sharedSingleton;
}

- (void)printSize {
    CGRect screen = [[UIScreen mainScreen] bounds];
    NSLog(@"screen bounds: %@", NSStringFromCGRect(screen));
    CGFloat statusBarHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    NSLog(@"statusBarHeight: %f", statusBarHeight);


}

- (CGFloat)statusBarHeight {
    return [[UIApplication sharedApplication] statusBarFrame].size.height;
}


@end
