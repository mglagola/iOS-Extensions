//
//  NSString+KeyPath.m
//  
//
//  Created by Mark Glagola on 6/22/13.
//  Copyright (c) 2013 Mark Glagola. All rights reserved.
//

#import "NSString+KeyPath.h"

@implementation NSString (KeyPath)

- (BOOL) MG_isKeyPath {
    return [self rangeOfString:@"."].location != NSNotFound;
}

@end
