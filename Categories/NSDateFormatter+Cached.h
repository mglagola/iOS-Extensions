//
//  NSDateFormatter+Cached.h
//  
//
//  Created by Mark Glagola on 8/28/13.
//  Copyright (c) 2013 Mark Glagola. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (Cached)

+ (instancetype) MG_dateFormatter;

+ (instancetype) MG_dateFormatterWithDateFormat:(NSString*)dateFormat;

@end
