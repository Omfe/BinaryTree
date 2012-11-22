//
//  BTViewController.m
//  BinaryTree
//
//  Created by Omar Gudino on 11/1/12.
//  Copyright (c) 2012 Omar Gudino. All rights reserved.
//

#import "BTViewController.h"
#import "BTTree.h"
#import "BTNode.h"
#import "BTNodeView.h"
#import "PSBaseTreeGraphView.h"
#import "PSTreeGraphDelegate.h"

@interface BTViewController () <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, PSTreeGraphDelegate>

@property (weak, nonatomic) IBOutlet PSBaseTreeGraphView *treeGraphView;
@property (weak, nonatomic) IBOutlet UITextField *nodeValueTextField;
@property (weak, nonatomic) IBOutlet UIPickerView *iterateMethodPickerView;
@property (weak, nonatomic) IBOutlet UITextView *iterateTextView;
@property (weak, nonatomic) IBOutlet UILabel *findNodeTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *treeHeightTextLabel;

@property (strong, nonatomic) BTTree *binaryTree;

- (BOOL)isStringIntegerValue:(NSString *)string;

@end

@implementation BTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.binaryTree = [[BTTree alloc] init];
    self.treeGraphView.backgroundColor = [UIColor whiteColor];
    self.treeGraphView.connectingLineColor = [UIColor redColor];
    self.treeGraphView.treeGraphOrientation = PSTreeGraphOrientationStyleVertical;
    self.treeGraphView.connectingLineStyle = PSTreeGraphConnectingLineStyleDirect;
    self.treeGraphView.nodeViewNibName = @"BTNodeView";
    self.treeGraphView.delegate = self;
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


#pragma mark - UITextFieldDelegate Methods
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@""]) {
        return YES;
    }
    
    if (![self isStringIntegerValue:string]) {
        return NO;
    }
    return YES;
}


#pragma mark - PSTreeGraphDelegate Methods
- (void)configureNodeView:(UIView *)nodeView withModelNode:(id<PSTreeGraphModelNode>)modelNode
{
    ((BTNodeView *)nodeView).valueLabel.text = [NSString stringWithFormat:@"%i", ((BTNode *)modelNode).value];
}


#pragma mark - Action Methods
- (IBAction)insertButtonWasPressed:(id)sender
{
    if (self.nodeValueTextField.text.length == 0) {
        return;
    }
    
    [self.binaryTree addNodeWithValue:[self.nodeValueTextField.text integerValue]];
    self.treeHeightTextLabel.text = [NSString stringWithFormat:@"%i", self.binaryTree.treeHeight];
    [self.treeGraphView setModelRoot:nil];
    [self.treeGraphView setModelRoot:self.binaryTree.rootNode];
}

- (IBAction)iterateButtonWasPressed:(id)sender
{
    switch ([self.iterateMethodPickerView selectedRowInComponent:0]) {
        case 0:
            self.iterateTextView.text = [self.binaryTree iterateInOrder];
            break;
        case 1:
            self.iterateTextView.text = [self.binaryTree iteratePreOrder];
            break;
        case 2:
            self.iterateTextView.text = [self.binaryTree iteratePostOrder];
            break;
        default:
            break;
    }
}

- (IBAction)findButtonWasPressed:(id)sender
{
    if (self.nodeValueTextField.text.length == 0) {
        return;
    }
    
    if ([self.binaryTree nodeExistsWithValue:[self.nodeValueTextField.text integerValue]]) {
        self.findNodeTextLabel.text = @"Este Nodo si existe en tu Arbol!";
    } else {
        self.findNodeTextLabel.text = @"Este Nodo no existe en tu Arbol";
    }
}


#pragma mark - Private Methods
- (BOOL)isStringIntegerValue:(NSString *)string
{
    NSScanner *scanner;
    
    scanner = [NSScanner scannerWithString:string];
    return [scanner scanInteger:nil];
}

@end
