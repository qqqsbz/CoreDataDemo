//
//  ViewController.m
//  CoreData
//
//  Created by coder on 15/10/10.
//  Copyright (c) 2015年 coder. All rights reserved.
//

#import "ViewController.h"
#import "CoreDataManager.h"
#import "Article.h"
#import "Subject.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSError *error;
    //Article Subject  一对多的关系
    //添加  模拟通过http接收json数据
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
//    NSString *dateString = [formatter stringFromDate:[NSDate date]];
//    NSDictionary *data = [NSDictionary dictionaryWithObjects:@[@"10000",@"标题",@"摘要",@"类型",@"http://ugarden.qiniudn.com/resources/upload/penyou/launch-image",@"http://www.google.com",dateString,@"#FFFFFF",@{@"id":@"100001",@"title":@"100001",@"authorName":@"没有封面",@"digest":@"没有摘要",@"cover":@"http://ugarden.qiniudn.com/resources/upload/penyou/launch-image"}] forKeys:@[@"id",@"title",@"digest",@"type",@"cover",@"url",@"releaseTime",@"mainColor",@"subject"]];
//    Article *article = [MTLJSONAdapter modelOfClass:[Article class] fromJSONDictionary:data error:&error];
//    
//    NSManagedObjectContext *context = [CoreDataManager shareCoreDataManager];
//    NSManagedObject *managedObject = [MTLManagedObjectAdapter managedObjectFromModel:article insertingIntoContext:context error:&error];
//    if (managedObject) {
//        [CoreDataManager coreDataManagerSaveWithError:&error];
//        if (!error) {
//            NSLog(@"数据插入成功");
//        } else {
//            NSLog(@"数据插入失败: %@",error);
//        }
//    }
//    
    
    //查询
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"modelId = %@",@"10000"];
//    
//    NSArray *results = [CoreDataManager coreDataManagerQueryForEntityName:[Article managedObjectEntityName] fetchLimit:100 fetchOffset:0 predicate:predicate error:&error];
//    if (!error && results) {
//        for (Article *art in results) {
//            Subject *subject = art.subject;
//            NSLog(@"cover  %@",subject.title);
//        }
//    }
    
    
    //总共有多少条记录
//    NSInteger count = [CoreDataManager coreDataManagerCountForEntityName:[Article managedObjectEntityName] predicate:nil error:&error];
//    NSLog(@"count %ld",count);
//    
    
    
    //删除
//    NSError *deleteError = nil;
//    NSPredicate *deletePredicate = [NSPredicate predicateWithFormat:@"modelId = %@",@"10086"];
//    NSManagedObject *object = [CoreDataManager coreDataManagerQueryOneForEntityName:[Article managedObjectEntityName] predicate:deletePredicate error:&deleteError];
//    if (object) {
//        [CoreDataManager coreDataManagerDelete:object error:&deleteError];
//        if (!deleteError) {
//            NSLog(@"删除成功");
//        } else {
//            NSLog(@"删除失败");
//        }
//    }
    
    
    
    //更新
//    NSPredicate *updatePredicate = [NSPredicate predicateWithFormat:@"modelId = %@",@"100861"];
//    Article *art = [[CoreDataManager coreDataManagerQueryForEntityName:[Article managedObjectEntityName] fetchLimit:1 fetchOffset:0 predicate:updatePredicate error:&error] lastObject];
//    art.url = @"http://www.baidu.com";
//    [CoreDataManager coreDataManagerUpdateWithError:&error];
//    if (!error) {
//        NSLog(@"更新成功");
//    }
//    
    
    
    
    //查询某个主题下的所有文章
//    NSError *subjectError = nil;
//    NSPredicate *subjectPre = [NSPredicate predicateWithFormat:@"modelId = %@",@"100001"];
//    NSManagedObject *subjectObj = [CoreDataManager coreDataManagerQueryOneForEntityName:[Subject managedObjectEntityName] predicate:subjectPre error:&subjectError];
//    Subject *subject = [MTLManagedObjectAdapter modelOfClass:[Subject class] fromManagedObject:subjectObj error:&subjectError];
//    for (Article *art in subject.articles) {
//        NSLog(@"art releaseTime  %@",art.releaseTime);
//    }
    
    //删除某个主题及其文章
//    [CoreDataManager coreDataManagerDelete:subjectObj error:&subjectError];
//    if (!subjectError) {
//        NSLog(@"删除成功");
//    }
    
    
    //Subject自关联
    //添加子主题 父主题
    NSDictionary *parent = @{@"id":@"100001",@"title":@"100001",@"authorName":@"没有封面",@"digest":@"没有摘要",@"cover":@"http://ugarden.qiniudn.com/resources/upload/penyou/launch-image"};
    Subject *parentSubject = [MTLJSONAdapter modelOfClass:[Subject class] fromJSONDictionary:parent error:&error];
    NSManagedObject *parentObj = [MTLManagedObjectAdapter managedObjectFromModel:parentSubject insertingIntoContext:[CoreDataManager shareCoreDataManager] error:&error];
    
    
    NSDictionary *children = @{@"id":@"100100",@"title":@"子主题",@"authorName":@"没有封面",@"digest":@"没有摘要",@"cover":@"http://ugarden.qiniudn.com/resources/upload/penyou/launch-image"};
    Subject *childrenSubject = [MTLJSONAdapter modelOfClass:[Subject class] fromJSONDictionary:children error:&error];
    childrenSubject.parent = parentSubject;
    NSManagedObject *childrenObj = [MTLManagedObjectAdapter managedObjectFromModel:childrenSubject insertingIntoContext:[CoreDataManager shareCoreDataManager] error:&error];
    
    if (parentObj && childrenObj) {
        [CoreDataManager coreDataManagerSaveWithError:&error];
        if (!error) {
            NSLog(@"添加成功");
        }
    }
    
    //删除父主题及其下的所有子主题
//    NSPredicate *subjectPre = [NSPredicate predicateWithFormat:@"modelId = %@",@"100001"];
//    NSManagedObject *subjectObj = [CoreDataManager coreDataManagerQueryOneForEntityName:[Subject managedObjectEntityName] predicate:subjectPre error:&error];
//    [CoreDataManager coreDataManagerDelete:subjectObj error:&error];
//    if (!error) {
//        NSLog(@"删除成功");
//    }
    
    //查询主题下的所有子主题
//    NSManagedObject *subjectObj = [CoreDataManager coreDataManagerQueryOneForEntityName:[Subject managedObjectEntityName] predicate:[NSPredicate predicateWithFormat:@"modelId = %@",@"100001"] error:&error];
//    Subject *subject = [MTLManagedObjectAdapter modelOfClass:[Subject class] fromManagedObject:subjectObj error:&error];
//    if (!error) {
//        for (Subject *sub in subject.children) {
//            NSLog(@"modelId   %@",sub.modelId);
//        }
//    }
    
    //删除子主题
    NSManagedObject *subjectObj = [CoreDataManager coreDataManagerQueryOneForEntityName:[Subject managedObjectEntityName] predicate:[NSPredicate predicateWithFormat:@"modelId = %@",@"100100"] error:&error];
    [CoreDataManager coreDataManagerDelete:subjectObj error:&error];
    if (!error) {
        NSLog(@"删除子主题成功");
    }
    
}

- (NSInteger)addNumber:(NSInteger)number1 number2:(NSInteger)number2
{
    return number1 + number2;
}
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
