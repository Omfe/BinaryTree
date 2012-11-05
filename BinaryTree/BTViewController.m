//
//  BTViewController.m
//  BinaryTree
//
//  Created by Omar Gudino on 11/1/12.
//  Copyright (c) 2012 Omar Gudino. All rights reserved.
//

#import "BTViewController.h"
#import "BTTree.h"

@interface BTViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *treeGraphView;
@property (weak, nonatomic) IBOutlet UITextField *nodeValueTextField;
@property (weak, nonatomic) IBOutlet UIPickerView *iterateMethodPickerView;
@property (weak, nonatomic) IBOutlet UITextView *iterateTextView;

@property (strong, nonatomic) BTTree *binaryTree;

@end

@implementation BTViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.binaryTree = [[BTTree alloc] init];
}

#pragma mark - UIPickerViewDataSource Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 3;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (row) {
        case 0:
            return @"InOrder";
        case 1:
            return @"PreOrder";
        case 2:
            return @"PostOrder";
        default:
            return @"";
    }
}

- (IBAction)insertButtonWasPressed:(id)sender
{
    [self.binaryTree addNodeWithValue:[self.nodeValueTextField.text integerValue]];
}

- (IBAction)iterateButtonWasPressed:(id)sender
{
    switch ([self.iterateMethodPickerView selectedRowInComponent:0]) {
        case 0:
            [self.binaryTree iterateInOrder];
            break;
        case 1:
            [self.binaryTree iteratePreOrder];
            break;
        case 2:
            [self.binaryTree iteratePostOrder];
            break;
        default:
            break;
    }
}

- (IBAction)findButtonWasPressed:(id)sender
{
    
}

@end
