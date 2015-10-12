//
//  Subject.h
//  CoreData
//
//  Created by coder on 15/10/10.
//  Copyright (c) 2015年 coder. All rights reserved.
//

#import "Model.h"
@interface Subject : Model <MTLManagedObjectSerializing>

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *authorName;
@property (copy, nonatomic) NSString *digest;
@property (copy, nonatomic) NSString *cover;
@property (strong, nonatomic) NSArray *articles;
@property (strong, nonatomic) NSArray *children;
@property (strong, nonatomic) Subject *parent;
@end
