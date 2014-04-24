//
//  UIViewController+Instantiate.m
//
//
//  Created by Mark Glagola on 11/26/13.
//  Copyright (c) 2014 Mark Glagola. All rights reserved.
//

#import "UIViewController+Instantiate.h"

@implementation UIViewController (Instantiate)

+ (instancetype) MG_instantiate {
    return [[[UIApplication sharedApplication] delegate].window.rootViewController.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([self class])];
}

+ (UINavigationController*) MG_instantiateWithNavigationController {
    UIViewController *controller = [self MG_instantiate];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
    return nav;
}

@end
