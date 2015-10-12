//
//  Model.h
//  CoreData
//
//  Created by coder on 15/10/10.
//  Copyright (c) 2015年 coder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
@interface Model :MTLModel <MTLJSONSerializing>

@property(copy, nonatomic) NSString *modelId;

- (id)deriveModelWithTemplateModelClass:(Class)modelClass;

@end
