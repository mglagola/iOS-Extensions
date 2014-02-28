//
//  NSManagedObject+Create.h
//  iOS-Extensions
//
//  Created by Mark Glagola on 11/26/13.
//  Copyright (c) 2013 Mark Glagola. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (Extension)

+ (instancetype) MG_createEntityWithContext:(NSManagedObjectContext*)context;

+ (NSArray*) MG_findEntitiesWithPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray*)sortDescriptors fetchLimit:(NSUInteger)fetchLimit context:(NSManagedObjectContext *)context;
+ (NSArray*) MG_findEntitiesWithPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray*)sortDescriptors context:(NSManagedObjectContext *)context;
+ (NSArray*) MG_findEntitiesWithPredicate:(NSPredicate *)predicate sortBy:(NSString*)sortBy ascending:(BOOL)ascending context:(NSManagedObjectContext *)context;
+ (NSArray*) MG_findEntitiesWithPredicate:(NSPredicate*)predicate context:(NSManagedObjectContext*)context;

+ (NSArray*) MG_findAllEntitiesSortedBy:(NSString*)sortBy ascending:(BOOL)ascending context:(NSManagedObjectContext*)context;
+ (NSArray*) MG_findAllEntitiesInContext:(NSManagedObjectContext*)context;

+ (instancetype) MG_findEntityWithPredicate:(NSPredicate*)predicate context:(NSManagedObjectContext*)context;

+ (void) MG_deleteEntitiesWithPredicate:(NSPredicate*)predicate context:(NSManagedObjectContext*)context;

@end
