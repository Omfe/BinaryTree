//
//  BTTree.h
//  BinaryTree
//
//  Created by Omar Gudino on 11/4/12.
//  Copyright (c) 2012 Omar Gudino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTNode.h"

@interface BTTree : NSObject

- (NSInteger)addNodeWithValue:(NSInteger)value;
- (NSString *)iterateInOrder;
- (NSString *)iteratePreOrder;
- (NSString *)iteratePostOrder;
- (BOOL)findNodeWithValue:(NSInteger)value;
- (BOOL)findNode:(BTNode *)node withValue:(NSInteger)value;
- (BOOL)deleteNodeWithValue:(NSInteger)value;
- (NSInteger)treeHeightWithNode:(BTNode *)node;

@end
