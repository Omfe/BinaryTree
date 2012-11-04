//
//  BTTree.h
//  BinaryTree
//
//  Created by Omar Gudino on 11/4/12.
//  Copyright (c) 2012 Omar Gudino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTNode.h"

@class BTNode;

BTNode *rootNode = NULL;

@interface BTTree : NSObject


- (BTNode *)addNodeWithValue:(NSInteger)value withNode:(BTNode *) node;



@end
