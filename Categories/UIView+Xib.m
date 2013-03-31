//
//  UIView+Xib.m
//  
//
//  Created by Mark Glagola on 3/17/13.
//  Copyright (c) 2013 Mark Glagola. All rights reserved.
//

#import "UIView+Xib.h"

@implementation UIView (Xib)

- (id) initWithNib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] objectAtIndex:0];
}

@end
