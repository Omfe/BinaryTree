//
//  BTTree.m
//  BinaryTree
//
//  Created by Omar Gudino on 11/4/12.
//  Copyright (c) 2012 Omar Gudino. All rights reserved.
//

#import "BTTree.h"
#import "BTNode.h"

@interface BTTree ()

@property (strong, nonatomic) BTNode *rootNode;

- (BTNode *)addNodeWithValue:(NSInteger)value withNode:(BTNode *)node;
- (void)iterateInOrder:(BTNode *)currentNode;
- (void)iteratePreOrder:(BTNode *)currentNode;
- (void)iteratePostOrder:(BTNode *)currentNode;

@end

@implementation BTTree

- (void)addNodeWithValue:(NSInteger)value
{
    self.rootNode = [self addNodeWithValue:value withNode:self.rootNode];
}

- (void)iterateInOrder
{
    
}

- (void)iteratePreOrder
{
    
}

- (void)iteratePostOrder
{
    
}

#pragma mark - Private Methods
- (BTNode *)addNodeWithValue:(NSInteger)value withNode:(BTNode *)node
{
    BTNode *newNode;
    
    if (node == NULL) {
        return [[BTNode alloc] initWithValue:value];
    }
    
    newNode = [[BTNode alloc] initWithValue:value];
    if (node.value < value) {
        node.rightNode = [self addNodeWithValue:value withNode:newNode];
    } else {
        node.leftNode = [self addNodeWithValue:value withNode:newNode];
    }
    
    return nil;
}

- (void)iterateInOrder:(BTNode *)currentNode
{
    
}

- (void)iteratePreOrder:(BTNode *)currentNode
{
    
}

- (void)iteratePostOrder:(BTNode *)currentNode
{
    
}

@end
