//
//  UIScreen+Size.m
//  
//
//  Created by Mark Glagola on 3/26/13.
//  Copyright (c) 2013 Mark Glagola. All rights reserved.
//

#import "UIScreen+Frame.h"

@implementation UIScreen (Frame)

+ (CGFloat) biggerSide:(CGSize)size {
    return MAX(size.width, size.height);
}

+ (CGFloat) smallerSide:(CGSize)size {
    return MIN(size.width, size.height);
}

//assumes landscape always has bigger width than height
+ (CGRect) screenRect {
    CGRect appFrame = [[self mainScreen] bounds];
    BOOL isLandscape = UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation);
    CGRect screenSize = appFrame;
    
    if (isLandscape) {
        screenSize.size.width = [self biggerSide:appFrame.size];
        screenSize.size.height = [self smallerSide:appFrame.size];
    } else {
        screenSize.size.width = [self smallerSide:appFrame.size];
        screenSize.size.height = [self biggerSide:appFrame.size];
    }
    
    return screenSize;
}

@end
