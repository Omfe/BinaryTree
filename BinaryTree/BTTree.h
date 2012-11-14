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

- (void)addNodeWithValue:(NSInteger)value;
- (NSString *)iterateInOrder;
- (NSString *)iteratePreOrder;
- (NSString *)iteratePostOrder;
- (Boolean)findNodeWithValue:(NSInteger)value;
- (Boolean)findNode:(BTNode *)node withValue:(NSInteger)value;
- (Boolean)deleteNodeWithValue:(NSInteger)value;
- (NSInteger)treeHeightWithNode:(BTNode *)node;

@end
