//
// Created by ZengPu on 2019-07-07.
// Copyright (c) 2019 Zi Mu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>


@interface ERUIUtils : NSObject

+ (ERUIUtils *)sharedInstance;

- (void)printSize;

- (CGFloat)statusBarHeight;

@end