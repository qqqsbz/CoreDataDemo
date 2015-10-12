//
//  Subject.m
//  CoreData
//
//  Created by coder on 15/10/10.
//  Copyright (c) 2015年 coder. All rights reserved.
//

#import "Subject.h"
#import "Article.h"
@implementation Subject

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
    return @{@"articles":[Article class],@"children": [Subject class],@"parent":[Subject class]};
}

+ (NSValueTransformer *)childrenJSONTransformer
{
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[Subject class]];
}


@end
