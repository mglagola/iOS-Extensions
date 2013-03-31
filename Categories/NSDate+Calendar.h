//
//  NSDate+Calendar.h
//  
//
//  Created by Mark Glagola on 1/20/13.
//  Copyright (c) 2013 Mark Glagola. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Calendar)

- (NSString*) stringFromDateWithFormat:(NSString*)format;

- (NSDate*) firstDayOfMonth;
- (NSDate*) lastDayOfMonth;

- (NSMutableArray*) datesInCurrentMonth;

- (BOOL) isSameDayAs:(NSDate*)date;
- (BOOL) isSameMonthAs:(NSDate*)date;

@end
