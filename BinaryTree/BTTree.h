//
//  BTTree.h
//  BinaryTree
//
//  Created by Omar Gudino on 11/4/12.
//  Copyright (c) 2012 Omar Gudino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTNode.h"

typedef enum {
    BTTreeNodeValueTypeInteger = 0,
    BTTreeNodeValueTypeString = 1
} BTTreeNodeValueType;

@interface BTTree : NSObject

@property (nonatomic, strong) BTNode *rootNode;
@property (nonatomic, assign, readonly) NSInteger treeHeight;

//- (id)initWithNodeValueType:(BTTreeNodeValueType)valueType;
- (void)addNodeWithValue:(NSInteger)value;
- (NSString *)iterateInOrder;
- (NSString *)iteratePreOrder;
- (NSString *)iteratePostOrder;
- (BOOL)nodeExistsWithValue:(NSInteger)value;
- (BOOL)deleteNodeWithValue:(NSInteger)value;

@end
