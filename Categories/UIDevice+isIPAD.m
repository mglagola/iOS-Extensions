//
//  UIDevice+isIPAD.m
//  Portfolio
//
//  Created by Mark Glagola on 4/26/13.
//  Copyright (c) 2013 Mark Glagola. All rights reserved.
//

#import "UIDevice+isIPAD.h"

@implementation UIDevice (isIPAD)

+ (BOOL) isIPAD {
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}

@end
