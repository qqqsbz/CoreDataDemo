//
//  CoreDataManager.m
//  CoreData
//
//  Created by coder on 15/10/12.
//  Copyright (c) 2015年 coder. All rights reserved.
//

#import "CoreDataManager.h"

@implementation CoreDataManager

+ (NSManagedObjectContext *)shareCoreDataManager
{
    static NSManagedObjectContext *managedObjectContext;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSError *error = nil;
        NSDictionary *options = nil;
        options = @{NSMigratePersistentStoresAutomaticallyOption: [NSNumber numberWithBool:YES],
                    NSInferMappingModelAutomaticallyOption: [NSNumber numberWithBool:YES]};
        
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"ArticleNew" withExtension:@"momd"];
        NSURL *storeURL = [[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject]URLByAppendingPathComponent:@"ArticleNew.sqlite"];
        
        NSManagedObjectModel *model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
        if (![coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error]) {
            NSLog(@"Fail to create NSManagedObjectContext: %@, %@", error, [error userInfo]);
            abort();
        }
        
        managedObjectContext = [[NSManagedObjectContext alloc] init];
        [managedObjectContext setPersistentStoreCoordinator:coordinator];
    });
    
    return managedObjectContext;
}

+ (void)coreDataManagerSaveWithError:(NSError *__autoreleasing *)error
{
    NSManagedObjectContext *context = [self shareCoreDataManager];
    if (context != nil) {
        if ([context hasChanges] && ![context save:error]) {
            NSLog(@"Fail to save NSManagedObjectContext");
        }
    }
}

+ (void)coreDataManagerUpdateWithError:(NSError *__autoreleasing *)error
{
    NSManagedObjectContext *context = [self shareCoreDataManager];
    if ([context hasChanges] && ![context save:error]) {
        [NSException raise:@"更新失败" format:@""];
    }
}

+ (id)coreDataManagerQueryForEntityName:(NSString *)entityName fetchLimit:(NSInteger)fetchLimit fetchOffset:(NSInteger)fetchOffset  predicate:(NSPredicate *)predicate error:(NSError *__autoreleasing *)error
{
    NSManagedObjectContext *context = [self shareCoreDataManager];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:entityName inManagedObjectContext:context];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    fetchRequest.entity      = entityDesc;
    fetchRequest.fetchLimit  = fetchLimit;
    fetchRequest.predicate   = predicate;
    fetchRequest.fetchOffset = fetchOffset;
    
    return [context executeFetchRequest:fetchRequest error:error];
}

+ (NSInteger)coreDataManagerCountForEntityName:(NSString *)entityName predicate:(NSPredicate *)predicate error:(NSError *__autoreleasing *)error
{
    NSManagedObjectContext *context = [self shareCoreDataManager];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:entityName inManagedObjectContext:context];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    fetchRequest.entity      = entityDesc;
    fetchRequest.predicate   = predicate;
    return [context countForFetchRequest:fetchRequest error:error];
}

+ (void)coreDataManagerDelete:(NSManagedObject *)object error:(NSError *__autoreleasing *)error
{
    NSManagedObjectContext *context = [self shareCoreDataManager];
    [context deleteObject:object];
    // 将结果同步到数据库
    [context save:error];
    if (!error) {
        [NSException raise:@"删除错误" format:@"%@",@"数据删除失败"];
    }
}

+ (NSManagedObject *)coreDataManagerQueryOneForEntityName:(NSString *)entityName predicate:(NSPredicate *)predicate error:(NSError *__autoreleasing *)error
{
    return [[self coreDataManagerQueryForEntityName:entityName fetchLimit:1 fetchOffset:0 predicate:predicate error:error] lastObject];
}

@end
