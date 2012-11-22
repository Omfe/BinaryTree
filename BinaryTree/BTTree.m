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

@property (nonatomic, assign) BTTreeNodeValueType valueType;

- (BTNode *)addNodeWithValue:(NSInteger)value withNode:(BTNode *)node andParentNode:(BTNode *)parentNode;
- (NSString *)iterateInOrder:(BTNode *)currentNode;
- (NSString *)iteratePreOrder:(BTNode *)currentNode;
- (NSString *)iteratePostOrder:(BTNode *)currentNode;
- (BOOL)nodeExists:(BTNode *)node withValue:(NSInteger)value;
- (void)deleteNode:(BTNode **)node withValue:(NSInteger)value andParentNode:(BTNode *)parentNode;
- (void)deleteAndMoveNode:(BTNode **)node withParentNode:(BTNode *)parentNode;
- (void)moveChildNode:(BTNode *)childNode toParentNode:(BTNode *)parentNode fromNode:(BTNode *)node;
- (NSInteger)treeHeightWithNode:(BTNode *)node;
- (void)balanceTreeWithNode:(BTNode *)node;
- (BOOL)isValueValidType:(id)value;

@end

@implementation BTTree

/*- (id)initWithNodeValueType:(BTTreeNodeValueType)valueType
{
    self = [super init];
    if (self) {
        self.valueType = valueType;
    }
    return self;
}*/

- (void)addNodeWithValue:(NSInteger)value
{
    /*if (![self isValueValidType:value]) {
        return;
    }*/
    
    _rootNode = [self addNodeWithValue:value withNode:self.rootNode andParentNode:nil];
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

- (void)deleteNodeWithValue:(NSInteger)value
{
    BTNode *node;
    
    if (![self nodeExistsWithValue:value]) {
        return;
    } else {
        node = _rootNode;
        [self deleteNode:&node withValue:value andParentNode:nil];
        _rootNode = node;
    }
    
    [self balanceTreeWithNode:self.rootNode];
}



#pragma mark - Private Methods
- (BTNode *)addNodeWithValue:(NSInteger)value withNode:(BTNode *)node andParentNode:(BTNode *)parentNode
{
    if (node == nil) {
        return [[BTNode alloc] initWithValue:value andParentNode:parentNode];
    }
    
    if (node.value < value) {
        node.rightNode = [self addNodeWithValue:value withNode:node.rightNode andParentNode:node];
        return node;
    } else {
        node.leftNode = [self addNodeWithValue:value withNode:node.leftNode andParentNode:node];
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
        return NO;
    } else if (node.value == value) {
        return YES;
    } else if (node.value <= value) {
        return [self nodeExists:node.rightNode withValue:value];
    } else {
        return [self nodeExists:node.leftNode withValue:value];
    }
}



- (void)deleteNode:(BTNode **)node withValue:(NSInteger)value andParentNode:(BTNode *)parentNode
{
    BTNode *tempNode;
    
    if ((*node).value == value) {
        [self deleteAndMoveNode:node withParentNode:parentNode];
    } else if ((*node).value <= value) {
        tempNode = (*node).rightNode;
        [self deleteNode:&tempNode withValue:value andParentNode:*node];
    } else {
        tempNode = (*node).leftNode;
        [self deleteNode:&tempNode withValue:value andParentNode:*node];
    }
}

- (void)deleteAndMoveNode:(BTNode **)node withParentNode:(BTNode *)parentNode
{
    if ((*node).rightNode && !(*node).leftNode) {
        [self moveChildNode:(*node).rightNode toParentNode:parentNode fromNode:*node];
    } else if (!(*node).rightNode && (*node).leftNode) {
        [self moveChildNode:(*node).leftNode toParentNode:parentNode fromNode:*node];
    } else if ((*node).rightNode && (*node).leftNode) {
        [self moveChildNode:nil toParentNode:parentNode fromNode:*node];
    } else {
        if (parentNode.leftNode == *node) {
            parentNode.leftNode = nil;
        } else {
            parentNode.rightNode = nil;
        }
        *node = nil;
    }
}

- (void)moveChildNode:(BTNode *)childNode toParentNode:(BTNode *)parentNode fromNode:(BTNode *)node
{
    BTNode *child;
    BTNode *grandChild;
    
    if (!parentNode) {
        return;
    }
    
    if (parentNode && parentNode.leftNode == node) {
        if (childNode) {
            parentNode.leftNode = childNode;
            return;
        }
        
        child = node.leftNode;
        grandChild = child.rightNode;
        if (grandChild) {
            while (grandChild.rightNode) {
                grandChild = grandChild.rightNode;
            }
            
            grandChild.parentNode.rightNode = nil;
            parentNode.leftNode = grandChild;
            grandChild.parentNode = parentNode;
            grandChild.leftNode = child;
            grandChild.rightNode = node.rightNode;
        } else {
            parentNode.leftNode = node.rightNode;
            parentNode.leftNode.rightNode = node.leftNode;
        }
        
    } else {
        if (childNode) {
            parentNode.rightNode = childNode;
            return;
        }
        
        child = node.rightNode;
        grandChild = child.leftNode;
        if (grandChild) {
            while (grandChild.leftNode) {
                grandChild = grandChild.leftNode;
            }
            
            grandChild.parentNode.leftNode = nil;
            parentNode.rightNode = grandChild;
            grandChild.parentNode = parentNode;
            grandChild.rightNode = child;
            grandChild.leftNode = node.leftNode;
        } else {
            parentNode.rightNode = node.leftNode;
            parentNode.rightNode.rightNode = node.rightNode;
        }
    }
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
        _rootNode = currentNode;
        currentNode.rightNode = node;
    }
    
    if (rightHeight >= leftHeight + 2) {
        currentNode = node.rightNode;
        node.rightNode = nil;
        _rootNode = currentNode;
        currentNode.leftNode = node;
    }
}

- (BOOL)isValueValidType:(id)value
{
    return YES;
}

@end
