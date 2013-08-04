//
//  UIDevice+isIPAD.m
//  Portfolio
//
//  Created by Mark Glagola on 4/26/13.
//  Copyright (c) 2013 Mark Glagola. All rights reserved.
//

#import "UIDevice+Version.h"

@implementation UIDevice (Version)

+ (BOOL) isIPAD {
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}

+ (float) currentVersion {
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

+ (BOOL) isBelowiOS7 {
    return [self currentVersion] < 7.0;
}

@end
