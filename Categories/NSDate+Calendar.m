//
//  NSDate+Calendar.m
//  
//
//  Created by Mark Glagola on 1/20/13.
//  Copyright (c) 2013 Mark Glagola. All rights reserved.
//

#import "NSDate+Calendar.h"
#import "NSCalendar+Calendar.h"

@implementation NSDate (Calendar)

- (NSString*) stringFromDateWithFormat:(NSString*)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:self];
}

- (NSDate*) firstDayOfMonth {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *comps = [cal calendarComponentsFromDate:self];
    [comps setDay:1];
    return [cal dateFromComponents:comps];
}

- (NSDate*) lastDayOfMonth {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *comps = [cal calendarComponentsFromDate:self];
    [comps setDay:[cal rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:self].length];
    return [cal dateFromComponents:comps];
}

- (NSMutableArray*) datesInCurrentMonth; {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSMutableArray *datesThisMonth = [NSMutableArray array];
    NSRange rangeOfDaysThisMonth = [calendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:self];
    
    NSDateComponents *components = [calendar calendarComponentsFromDate:self];    
    for (NSInteger i = rangeOfDaysThisMonth.location; i < NSMaxRange(rangeOfDaysThisMonth); ++i) {
        [components setDay:i];
        NSDate *dayInMonth = [calendar dateFromComponents:components];
        [datesThisMonth addObject:dayInMonth];
    }
    return datesThisMonth;
}

- (BOOL) isSameDayAs:(NSDate*)date {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSUInteger components = NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit | NSEraCalendarUnit;
    NSDateComponents *selfComp = [cal components:components fromDate:self];
    NSDateComponents *dateComp = [cal components:components fromDate:date];
    return [selfComp day]   == [dateComp day] &&
            [selfComp month] == [dateComp month] &&
            [selfComp year]  == [dateComp year];    
}

- (BOOL) isSameMonthAs:(NSDate *)date {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSUInteger components = NSMonthCalendarUnit | NSYearCalendarUnit | NSEraCalendarUnit;
    NSDateComponents *selfComp = [cal components:components fromDate:self];
    NSDateComponents *dateComp = [cal components:components fromDate:date];
    return [selfComp month] == [dateComp month] &&
            [selfComp year] == [dateComp year];
}

@end
