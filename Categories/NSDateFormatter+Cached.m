//
//  NSDateFormatter+Cached.m
//  
//
//  Created by Mark Glagola on 8/28/13.
//  Copyright (c) 2013 Mark Glagola. All rights reserved.
//

#import "NSDateFormatter+Cached.h"

static NSString * const kDateFormatterCachedKey = @"CachedDateFormatter";

@implementation NSDateFormatter (Cached)

+ (instancetype) MG_dateFormatter {
    NSMutableDictionary *threadDict = [[NSThread currentThread] threadDictionary];
    NSDateFormatter *formatter = [threadDict objectForKey:kDateFormatterCachedKey];
    if (!formatter) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
        [threadDict setObject:formatter forKey:kDateFormatterCachedKey];
    }
    
    return formatter;
}

+ (instancetype) MG_dateFormatterWithDateFormat:(NSString*)dateFormat {
    NSDateFormatter *formatter = [self MG_dateFormatter];
    [formatter setDateFormat:dateFormat];
    return formatter;
}

@end
