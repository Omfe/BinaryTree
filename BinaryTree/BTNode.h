//
//  BTNode.h
//  BinaryTree
//
//  Created by Omar Gudino on 11/1/12.
//  Copyright (c) 2012 Omar Gudino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSTreeGraphModelNode.h"

@interface BTNode : NSObject <PSTreeGraphModelNode>

@property (strong, nonatomic) BTNode *leftNode;
@property (strong, nonatomic) BTNode *rightNode;
@property (assign, nonatomic) NSInteger value;

- (id)initWithValue:(NSInteger)value;

@end
