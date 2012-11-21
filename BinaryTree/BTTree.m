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
- (NSString *)iterateInOrder:(BTNode *)currentNode;
- (NSString *)iteratePreOrder:(BTNode *)currentNode;
- (NSString *)iteratePostOrder:(BTNode *)currentNode;
- (BOOL)nodeExists:(BTNode *)node withValue:(NSInteger)value;
- (BOOL)deleteNode:(BTNode *)node withValue:(NSInteger)value andParent:(BTNode *)parent;
- (void)deleteAndMoveNode:(BTNode *)node;
- (NSInteger)treeHeightWithNode:(BTNode *)node;
- (void)balanceTreeWithNode:(BTNode *)node;

@end

@implementation BTTree

- (void)addNodeWithValue:(NSInteger)value
{
    self.rootNode = [self addNodeWithValue:value withNode:self.rootNode];
    [self balanceTreeWithNode:self.rootNode];
    _treeHeight = [self treeHeightWithNode:self.rootNode];
}

- (NSString *)iterateInOrder
{
    if (self.rootNode != nil) {
        return [self iterateInOrder:self.rootNode];
    }
    return  @"";
}

- (NSString *)iteratePreOrder
{
    if (self.rootNode != nil) {
        return [self iteratePreOrder:self.rootNode];
    }
    return  @"";
}

- (NSString *)iteratePostOrder
{
    if (self.rootNode != nil) {
        return [self iteratePostOrder:self.rootNode];
    }
    return  @"";
}

- (BOOL)nodeExistsWithValue:(NSInteger)value
{
    if (self.rootNode == nil) {
        return false;
    } else {
        return [self nodeExists:self.rootNode withValue:value];
    }
}

- (BOOL)deleteNodeWithValue:(NSInteger)value
{
    if (![self nodeExistsWithValue:value]) {
        return NO;
    } else {
        return [self deleteNode:self.rootNode withValue:value andParent:nil];
    }
    
    [self balanceTreeWithNode:self.rootNode];
}



#pragma mark - Private Methods
- (BTNode *)addNodeWithValue:(NSInteger)value withNode:(BTNode *)node
{
    if (node == nil) {
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

- (NSString *)iterateInOrder:(BTNode *)currentNode
{
    NSMutableString *iteratedListString;
    iteratedListString = [NSMutableString string];
    
    if (currentNode != nil) {
        [iteratedListString appendString:[self iterateInOrder:currentNode.leftNode]];
        [iteratedListString appendFormat:@"%d\n", currentNode.value];
        [iteratedListString appendString:[self iterateInOrder:currentNode.rightNode]];
    }
    return iteratedListString;
}

- (NSString *)iteratePreOrder:(BTNode *)currentNode
{
    NSMutableString *iteratedListString;
    iteratedListString = [NSMutableString string];
    
    if (currentNode != nil) {
        [iteratedListString appendFormat:@"%d\n", currentNode.value];
        [iteratedListString appendString:[self iterateInOrder:currentNode.leftNode]];
        [iteratedListString appendString:[self iterateInOrder:currentNode.rightNode]];
    }
    return iteratedListString;
}

- (NSString *)iteratePostOrder:(BTNode *)currentNode
{
    NSMutableString *iteratedListString;
    iteratedListString = [NSMutableString string];
    
    if (currentNode != nil) {
        [iteratedListString appendString:[self iterateInOrder:currentNode.leftNode]];
        [iteratedListString appendString:[self iterateInOrder:currentNode.rightNode]];
        [iteratedListString appendFormat:@"%d\n", currentNode.value];
    }
    return iteratedListString;
}

- (BOOL)nodeExists:(BTNode *)node withValue:(NSInteger)value
{
    if (node == nil) {
        return false;
    } else if (node.value == value) {
        return true;
    } else if (node.value <= value) {
        return [self nodeExists:node.rightNode withValue:value];
    } else {
        return [self nodeExists:node.leftNode withValue:value];
    }
}

- (BOOL)deleteNode:(BTNode *)node withValue:(NSInteger)value andParent:(BTNode *)parent
{
    if (node.value == value) {
        [self deleteAndMoveNode:node];
        return YES;
    } else if (node.value <= value) {
        return [self deleteNode:node.rightNode withValue:value andParent:node];
    } else {
        return [self deleteNode:node.leftNode withValue:value andParent:node];
    }
}

- (void)deleteAndMoveNode:(BTNode *)node
{
    
}

- (NSInteger)treeHeightWithNode:(BTNode *)node
{
    NSInteger leftHeight;
    NSInteger rightHeight;
    
    if (!node) {
        return 0;
    }
    
    leftHeight = [self treeHeightWithNode:node.leftNode];
    rightHeight = [self treeHeightWithNode:node.rightNode];
    
    if (rightHeight > leftHeight) {
        return rightHeight + 1;
    } else {
        return leftHeight + 1;
    }
}

- (void)balanceTreeWithNode:(BTNode *)node
{
    BTNode *currentNode;
    NSInteger leftHeight = [self treeHeightWithNode:self.rootNode.leftNode];
    NSInteger rightHeight = [self treeHeightWithNode:self.rootNode.rightNode];
    
    if (leftHeight >= rightHeight + 2) {
        currentNode = node.leftNode;
        node.leftNode = nil;
        self.rootNode = currentNode;
        currentNode.rightNode = node;
       //[self balanceTreeWithNode:node];
    }
    
    if (rightHeight >= leftHeight + 2) {
        currentNode = node.rightNode;
        node.rightNode = nil;
        self.rootNode = currentNode;
        currentNode.leftNode = node;
        //[self balanceTreeWithNode:node];
    }
}

@end
