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
- (Boolean) deleteNode:(BTNode *)node withValue:(NSInteger)value;
- (void) deleteAndMoveNode:(BTNode *)node;

@end

@implementation BTTree

- (void)addNodeWithValue:(NSInteger)value
{
    self.rootNode = [self addNodeWithValue:value withNode:self.rootNode];
}

- (NSString *)iterateInOrder
{
    if (self.rootNode != NULL) {
        [self iterateInOrder:self.rootNode];
    }
    return  self.iterateInOrder;
}

- (NSString *)iteratePreOrder
{
    if (self.rootNode != NULL) {
        [self iteratePreOrder:self.rootNode];
    }
}

- (NSString *)iteratePostOrder
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

- (Boolean)deleteNodeWithValue:(NSInteger)value
{
    if (![self findNodeWithValue:value]) {
        return NO;
    } else {
        return [self deleteNode:self.rootNode withValue:value];
    }
}

- (NSInteger)treeHeightWithNode:(BTNode *)node
{
    if (node == NULL) {
        return 0;
    } else{
        if ([self treeHeightWithNode:node.rightNode] > [self treeHeightWithNode:node.leftNode]) {
            return [self treeHeightWithNode:node.rightNode] + 1;
        } else {
            return [self treeHeightWithNode:node.leftNode] + 1;
        }
    }
}

#pragma mark - Private Methods
- (BTNode *)addNodeWithValue:(NSInteger)value withNode:(BTNode *)node
{
    //BTNode *newNode;
    
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

- (NSString *)iterateInOrder:(BTNode *)currentNode
{
    NSMutableString *iteratedListString;
    iteratedListString = [NSMutableString string];
    
    if (currentNode != NULL) {
        [self iterateInOrder:currentNode.leftNode];
        [iteratedListString appendFormat:@"%d\n", currentNode.value];
        //NSLog(@"%i", currentNode.value);
        [self iterateInOrder:currentNode.rightNode];
    }
    return iteratedListString;
}

- (NSString *)iteratePreOrder:(BTNode *)currentNode
{
    NSMutableString *iteratedListString;
    iteratedListString = [NSMutableString string];
    
    if (currentNode != NULL) {
        //NSLog(@"%i", currentNode.value);
        [iteratedListString appendFormat:@"%d\n", currentNode.value];
        [self iteratePreOrder:currentNode.leftNode];
        [self iteratePreOrder:currentNode.rightNode];
    }
    return iteratedListString;
}

- (NSString *)iteratePostOrder:(BTNode *)currentNode
{
    NSMutableString *iteratedListString;
    iteratedListString = [NSMutableString string];
    
    if (currentNode != NULL) {
        [self iteratePostOrder:currentNode.leftNode];
        [self iteratePostOrder:currentNode.rightNode];
        [iteratedListString appendFormat:@"%d\n", currentNode.value];
        //NSLog(@"%i", currentNode.value);
    }
    return iteratedListString;
}

- (Boolean)deleteNode:(BTNode *)node withValue:(NSInteger)value
{
    if (node.value == value) {
        //borrar y recorrer
        return YES;
    }
    else if (node.value <= value) {
        return [self deleteNode:node.rightNode withValue:value];
    }
    else {
        return [self deleteNode:node.leftNode withValue:value];
    }
}

- (void)deleteAndMoveNode:(BTNode *)node
{
    
}

@end
