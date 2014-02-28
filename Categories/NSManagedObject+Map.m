//
//  NSManagedObject+Map.m
//  
//
//  Created by Mark Glagola on 6/22/13.
//  Copyright (c) 2013 Mark Glagola. All rights reserved.
//

#import "NSManagedObject+Map.h"
#import "NSString+KeyPath.h"

@implementation NSManagedObject (Map)

+ (instancetype) MG_objectWithPrimaryKey:(NSString*)primaryKey primaryValue:(id)primaryValue context:(NSManagedObjectContext*)context {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass([self class])];
    request.predicate = [NSPredicate predicateWithFormat:@"%K == %@",primaryKey, primaryValue];
    return [[context executeFetchRequest:request error:nil] lastObject];
}

+ (instancetype) MG_objectWithJSON:(id)json primaryKey:(NSString*)primaryKey map:(NSDictionary*)map context:(NSManagedObjectContext*)context {
    NSString *mapPrimaryKey  = [[map allKeysForObject:primaryKey] lastObject];
    id primaryValue = [mapPrimaryKey MG_isKeyPath] ? [json valueForKeyPath:mapPrimaryKey] : [json valueForKey:mapPrimaryKey];
    NSManagedObject *object = [self MG_objectWithPrimaryKey:primaryKey primaryValue:primaryValue context:context];
    
    if (!object) {
        object = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([self class]) inManagedObjectContext:context];
        [object setValue:primaryValue forKey:primaryKey];
    }
    
    [map enumerateKeysAndObjectsUsingBlock:^(id jsonKey, id coreDataKey, BOOL *stop) {
        id value = [jsonKey MG_isKeyPath] ? [json valueForKeyPath:jsonKey] : [json valueForKey:jsonKey];
        [object setValue:value forKey:coreDataKey];
    }];
    
    return object;
}

@end
