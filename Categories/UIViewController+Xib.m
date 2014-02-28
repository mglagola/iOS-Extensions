//
//  UIViewController+Xib.m
//  
//
//  Created by Mark Glagola on 3/17/13.
//  Copyright (c) 2013 Mark Glagola. All rights reserved.
//

#import "UIViewController+Xib.h"

@implementation UIViewController (Xib)

- (id) MG_initWithNib {
    return [self initWithNibName:NSStringFromClass([self class]) bundle:nil];
}

@end
