//
//  BTNode.m
//  BinaryTree
//
//  Created by Omar Gudino on 11/1/12.
//  Copyright (c) 2012 Omar Gudino. All rights reserved.
//

#import "BTNode.h"
#import "BTTree.h"

@class BTTree;

@implementation BTNode

- (id)initWithValue:(NSInteger)value
{
    self = [super init];
    if (self) {
        _value = value;
    }
    return self;
}

@end
