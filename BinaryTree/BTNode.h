//
//  BTNode.h
//  BinaryTree
//
//  Created by Omar Gudino on 11/1/12.
//  Copyright (c) 2012 Omar Gudino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSTreeGraphModelNode.h"

@interface BTNode : NSObject <PSTreeGraphModelNode, NSCopying>

@property (strong, nonatomic) BTNode *leftNode;
@property (strong, nonatomic) BTNode *rightNode;
@property (strong, nonatomic) BTNode *parentNode;
@property (assign, nonatomic) NSInteger value;

- (id)initWithValue:(NSInteger)value andParentNode:(BTNode *)parentNode;

@end
