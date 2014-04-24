//
//  UIViewController+Instantiate.h
//
//
//  Created by Mark Glagola on 11/26/13.
//  Copyright (c) 2014 Mark Glagola. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Instantiate)

+ (instancetype) MG_instantiate;

+ (UINavigationController*) MG_instantiateWithNavigationController;

@end
