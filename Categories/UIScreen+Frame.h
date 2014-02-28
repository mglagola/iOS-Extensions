//
//  UIScreen+Size.h
//  
//
//  Created by Mark Glagola on 3/26/13.
//  Copyright (c) 2013 Mark Glagola. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (Frame)

//assumes landscape always has bigger width than height
//fine for now, but if apple decides to go a different route, then it wont work..
+ (CGRect) MG_screenRect;

@end
