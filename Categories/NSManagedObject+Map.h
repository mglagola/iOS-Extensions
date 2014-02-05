//
//  NSManagedObject+Map.h
//  
//
//  Created by Mark Glagola on 6/22/13.
//  Copyright (c) 2013 Mark Glagola. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (Map)

+ (instancetype) objectWithPrimaryKey:(NSString*)primaryKey primaryValue:(id)primaryValue context:(NSManagedObjectContext*)context;

+ (instancetype) objectWithJSON:(id)json primaryKey:(NSString*)primaryKey map:(NSDictionary*)map context:(NSManagedObjectContext*)context;

@end
