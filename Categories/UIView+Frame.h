//
//  UIView+Frame.h
//  
//
//  Created by Mark Glagola on 3/19/13.
//  Copyright (c) 2013 Mark Glagola. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic, readonly) CGFloat bottom;
@property (nonatomic, readonly) CGFloat right;

@property (nonatomic) CGSize size;

@end
