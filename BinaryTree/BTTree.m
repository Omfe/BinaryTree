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
    if (self.rootNode != NULL) {
        [self iterateInOrder:self.rootNode];
    }
}

- (void)iteratePreOrder
{
    if (self.rootNode != NULL) {
        [self iteratePreOrder:self.rootNode];
    }
}

- (void)iteratePostOrder
{
    if (self.rootNode != NULL) {
        [self iteratePostOrder:self.rootNode];
    }
}

- (Boolean)findNodeWithValue:(NSInteger)value
{
    if (self.rootNode == NULL) {
        return false;
    } else{
        return [self findNode:self.rootNode withValue:value];
    }
}

- (Boolean)findNode:(BTNode *)node withValue:(NSInteger)value
{
    if (node == NULL) {
        return false;
    } else if (node.value == value){
        return true;
    } else if (node.value <= value){
        return [self findNode:node.rightNode withValue:value];
    } else {
        return [self findNode:node.leftNode withValue:value];
    }
}

#pragma mark - Private Methods
- (BTNode *)addNodeWithValue:(NSInteger)value withNode:(BTNode *)node
{
    if (node == NULL) {
        return [[BTNode alloc] initWithValue:value];
    }
    
    if (node.value < value) {
        node.rightNode = [self addNodeWithValue:value withNode:node.rightNode];
        return node;
    } else {
        node.leftNode = [self addNodeWithValue:value withNode:node.leftNode];
        return node;
    }
    
}

- (void)iterateInOrder:(BTNode *)currentNode
{
    if (currentNode != NULL) {
        [self iterateInOrder:currentNode.leftNode];
        NSLog(@"%i", currentNode.value);
        [self iterateInOrder:currentNode.rightNode];
    }
}

- (void)iteratePreOrder:(BTNode *)currentNode
{
    if (currentNode != NULL) {
        NSLog(@"%i", currentNode.value);
        [self iteratePreOrder:currentNode.leftNode];
        [self iteratePreOrder:currentNode.rightNode];
    }
}

- (void)iteratePostOrder:(BTNode *)currentNode
{
    if (currentNode != NULL) {
        [self iteratePostOrder:currentNode.leftNode];
        [self iteratePostOrder:currentNode.rightNode];
        NSLog(@"%i", currentNode.value);
    }
}

@end
