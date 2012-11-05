//
//  BTNode.m
//  BinaryTree
//
//  Created by Omar Gudino on 11/1/12.
//  Copyright (c) 2012 Omar Gudino. All rights reserved.
//

#import "BTNode.h"

@interface BTNode ()

@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

@end

@implementation BTNode

- (id)initWithValue:(NSInteger)value
{
    self = [super init];
    if (self) {
        self.value = value;
    }
    return self;
}

- (void)setValue:(NSInteger)value
{
    if (_value != value) {
        _value = value;
        self.valueLabel.text = [NSString stringWithFormat:@"%i", value];
    }
}

- (id<PSTreeGraphModelNode>)parentModelNode
{
    return self.parentNode;
}

- (NSArray *)childModelNodes
{
    return [NSArray arrayWithObjects:self.leftNode, self.rightNode, nil];
}

@end
