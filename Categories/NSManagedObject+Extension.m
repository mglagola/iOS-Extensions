//
//  NSManagedObject+Create.m
//  iOS-Extensions
//
//  Created by Mark Glagola on 11/26/13.
//  Copyright (c) 2013 Mark Glagola. All rights reserved.
//

#import "NSManagedObject+Extension.h"

@implementation NSManagedObject (Extension)

#pragma mark - Create Methods
+ (instancetype) MG_createEntityWithContext:(NSManagedObjectContext*)context {
    return [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([self class]) inManagedObjectContext:context];
}

#pragma mark - Find methods
+ (NSArray*) MG_findEntitiesWithPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray*)sortDescriptors fetchLimit:(NSUInteger)fetchLimit context:(NSManagedObjectContext *)context {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass([self class])];
    request.predicate = predicate;
    request.sortDescriptors = sortDescriptors;
    request.fetchLimit = fetchLimit;
    return [context executeFetchRequest:request error:NULL];
}


+ (NSArray*) MG_findEntitiesWithPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray*)sortDescriptors context:(NSManagedObjectContext *)context {
    return [self MG_findEntitiesWithPredicate:predicate sortDescriptors:sortDescriptors fetchLimit:0 context:context];
}

+ (NSArray*) MG_findEntitiesWithPredicate:(NSPredicate *)predicate sortBy:(NSString*)sortBy ascending:(BOOL)ascending context:(NSManagedObjectContext *)context {
    if (!sortBy)
        return [self MG_findEntitiesWithPredicate:predicate sortDescriptors:nil context:context];
    
    NSSortDescriptor *ageDescriptor = [NSSortDescriptor sortDescriptorWithKey:sortBy ascending:ascending];
    return [self MG_findEntitiesWithPredicate:predicate sortDescriptors:@[ageDescriptor] context:context];
}

+ (NSArray*) MG_findEntitiesWithPredicate:(NSPredicate*)predicate context:(NSManagedObjectContext*)context {
    return [self MG_findEntitiesWithPredicate:predicate sortDescriptors:nil context:context];
}

+ (NSArray*) MG_findAllEntitiesSortedBy:(NSString*)sortBy ascending:(BOOL)ascending context:(NSManagedObjectContext*)context {
    return [self MG_findEntitiesWithPredicate:nil sortBy:sortBy ascending:ascending context:context];
}

+ (NSArray*) MG_findAllEntitiesInContext:(NSManagedObjectContext*)context {
    return [self MG_findEntitiesWithPredicate:nil context:context];
}


+ (instancetype) MG_findEntityWithPredicate:(NSPredicate*)predicate context:(NSManagedObjectContext*)context {
    return [[self MG_findEntitiesWithPredicate:predicate context:context] lastObject];
}


#pragma mark - Delete methods
+ (void) MG_deleteEntitiesWithPredicate:(NSPredicate*)predicate context:(NSManagedObjectContext*)context {
    NSArray *entites = [self MG_findEntitiesWithPredicate:predicate context:context];
    [entites enumerateObjectsUsingBlock:^(NSManagedObject *entity, NSUInteger idx, BOOL *stop) {
        [context deleteObject:entity];
    }];
}

@end
    
