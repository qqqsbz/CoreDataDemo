//
//  Model.m
//  CoreData
//
//  Created by coder on 15/10/10.
//  Copyright (c) 2015年 coder. All rights reserved.
//

#import "Model.h"

@implementation Model

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"modelId": @"id"};
}

- (void)setModelId:(NSString *)modelId
{
    if ([modelId isKindOfClass:[NSString class]]) {
        _modelId = [modelId copy];
    } else {
        _modelId = [modelId description];
    }
}

- (id)deriveModelWithTemplateModelClass:(Class)modelClass
{
    NSError *error = nil;
    NSDictionary *json = [MTLJSONAdapter JSONDictionaryFromModel:self];
    id model = [MTLJSONAdapter modelOfClass:modelClass fromJSONDictionary:json error:&error];
    if (error) {
        [[NSException exceptionWithName:NSInvalidArgumentException
                                 reason:[NSString stringWithFormat:@"Could not derive model for: %@", modelClass]
                               userInfo:error.userInfo] raise];
    }
    return  model;
}


@end
