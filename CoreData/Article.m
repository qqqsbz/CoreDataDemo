//
//  Article.m
//  CoreData
//
//  Created by coder on 15/10/10.
//  Copyright (c) 2015年 coder. All rights reserved.
//

#import "Article.h"
#import "Subject.h"

@implementation Article

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

+ (NSValueTransformer *)subjectJSONTransformer
{
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[Subject class]];
}

+ (NSString *)managedObjectEntityName
{
    return NSStringFromClass(self);
}

+ (NSDictionary *)managedObjectKeysByPropertyKey
{
    return @{};
}

+ (NSSet *)propertyKeysForManagedObjectUniquing
{
    return [NSSet setWithObject:@"modelId"];
}

+ (NSDictionary *)relationshipModelClassesByPropertyKey
{
    return @{@"subject": [Subject class]};
}


@end
