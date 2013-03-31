//
//  UIView+Xib.m
//  
//
//  Created by Mark Glagola on 3/17/13.
//  Copyright (c) 2013 Mark Glagola. All rights reserved.
//

#import "UILabel+Font.h"

@implementation UILabel (Font)

- (NSString*) fontName {
    return self.font.fontName;
}

- (void) setFontName:(NSString *)fontName {
    self.font = [UIFont fontWithName:fontName size:self.fontSize];
}

- (CGFloat) fontSize {
    return self.font.pointSize;
}

- (void) setFontSize:(CGFloat)fontSize {
    self.font = [UIFont fontWithName:self.fontName size:fontSize];
}

@end
