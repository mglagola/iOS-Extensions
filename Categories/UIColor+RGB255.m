//
//  UIColor+RGB255.m
//  
//
//  Created by Mark Glagola on 8/4/13.
//  Copyright (c) 2013 Mark Glagola. All rights reserved.
//

#import "UIColor+RGB255.h"

@implementation UIColor (RGB255)

+ (UIColor*) MG_color255WithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    return [self colorWithRed:red/255. green:green/255. blue:blue/255. alpha:alpha];
}

@end
