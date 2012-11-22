//
//  BTNode.m
//  BinaryTree
//
//  Created by Omar Gudino on 11/1/12.
//  Copyright (c) 2012 Omar Gudino. All rights reserved.
//

#import "BTNode.h"

@implementation BTNode

- (id)initWithValue:(NSInteger)value andParentNode:(BTNode *)parentNode
{
    self = [super init];
    if (self) {
        self.value = value;
        self.parentNode = parentNode;
    }
    return self;
}


#pragma mark - NSCopying Methods
- (id)copyWithZone:(NSZone *)zone
{
    return self;
}


#pragma mark - PSTreeGraphModelNode Properties
- (id<PSTreeGraphModelNode>)parentModelNode
{
    return self.parentNode;
}

- (NSArray *)childModelNodes
{
    NSMutableArray *childNodes;
    
    childNodes = [NSMutableArray array];
    if (self.rightNode) {
        [childNodes addObject:self.rightNode];
    }
    if (self.leftNode) {
        [childNodes addObject:self.leftNode];
    }
    
    return childNodes;
}

@end
