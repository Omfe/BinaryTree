//
//  BTTree.m
//  BinaryTree
//
//  Created by Omar Gudino on 11/4/12.
//  Copyright (c) 2012 Omar Gudino. All rights reserved.
//

#import "BTTree.h"
#import "BTNode.h"

@implementation BTTree

- (BTNode *)addNodeWithValue:(NSInteger)value withNode:(BTNode *)node
{
    BTNode *newNode;
    
    if (node == NULL)
    {
        newNode = [[BTNode alloc] initWithValue:value];
        return newNode;
    }
    
    if (node.value < value)
    {
        node.rightNode = [self addNodeWithValue:value withNode:node.rightNode];
    }
    
    else
    {
        node.leftNode = [self addNodeWithValue:value withNode:node.leftNode];
    }
}

@end
//if (nodo.dato < value)
//nodo.derecha = agregar(value, P.derecha);
//else
//nodo.izquierda = agregar(value, P.izquierda);