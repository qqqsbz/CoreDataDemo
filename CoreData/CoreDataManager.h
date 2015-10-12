//
//  CoreDataManager.h
//  CoreData
//
//  Created by coder on 15/10/12.
//  Copyright (c) 2015年 coder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataManager : NSObject

+ (NSManagedObjectContext *)shareCoreDataManager;

+ (void)coreDataManagerSaveWithError:(NSError **)error;

+ (void)coreDataManagerUpdateWithError:(NSError **)error;

+ (id)coreDataManagerQueryForEntityName:(NSString *)entityName fetchLimit:(NSInteger)fetchLimit fetchOffset:(NSInteger)fetchOffset predicate:(NSPredicate *)predicate error:(NSError **)error;

+ (NSInteger)coreDataManagerCountForEntityName:(NSString *)entityName predicate:(NSPredicate *)predicate error:(NSError **)error;

+ (void)coreDataManagerDelete:(NSManagedObject *)object error:(NSError **)error;

+ (NSManagedObject *)coreDataManagerQueryOneForEntityName:(NSString *)entityName predicate:(NSPredicate *)predicate error:(NSError **)error;

@end
