//
//  Article.h
//  CoreData
//
//  Created by coder on 15/10/10.
//  Copyright (c) 2015年 coder. All rights reserved.
//

#import "Model.h"
@class Subject;

@interface Article : Model <MTLManagedObjectSerializing>

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *digest;
@property (copy, nonatomic) NSString *type;
@property (copy, nonatomic) NSString *cover;
@property (copy, nonatomic) NSString *url;
@property (copy, nonatomic) NSString *releaseTime;
@property (copy, nonatomic) NSString *mainColor;
@property (strong, nonatomic) Subject *subject;

@end
