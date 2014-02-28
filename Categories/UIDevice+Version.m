//
//  UIDevice+isIPAD.m
//  Portfolio
//
//  Created by Mark Glagola on 4/26/13.
//  Copyright (c) 2013 Mark Glagola. All rights reserved.
//

#import "UIDevice+Version.h"

@implementation UIDevice (Version)

+ (BOOL) MG_isIPAD {
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}

+ (float) MG_currentVersion {
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

+ (BOOL) MG_isBelowiOS7 {
    return [self MG_currentVersion] < 7.0;
}

@end
