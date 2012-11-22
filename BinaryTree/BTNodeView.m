//
//  BTNodeView.m
//  BinaryTree
//
//  Created by Rogelio Gudino on 11/21/12.
//  Copyright (c) 2012 Omar Gudino. All rights reserved.
//

#import "BTNodeView.h"

@implementation BTNodeView

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.fillColor = [UIColor whiteColor];
    self.selectionColor = [UIColor whiteColor];
    self.borderColor = [UIColor blackColor];
}

@end
