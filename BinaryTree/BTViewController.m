//
//  BTViewController.m
//  BinaryTree
//
//  Created by Omar Gudino on 11/1/12.
//  Copyright (c) 2012 Omar Gudino. All rights reserved.
//

#import "BTViewController.h"

@interface BTViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *insertButton;
@property (weak, nonatomic) IBOutlet UIButton *findButton;
@property (weak, nonatomic) IBOutlet UIButton *iterateButton;
@property (weak, nonatomic) IBOutlet UITextField *insertNodeWithValue;
@property (weak, nonatomic) IBOutlet UIPickerView *iterateMethodPickerView;


@end

@implementation BTViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
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
    return 0; //los 3 metodos
}

- (IBAction)insertButtonWasPressed:(id)sender
{
    
}

- (IBAction)iterateButtonWasPressed:(id)sender
{
    
}

- (IBAction)findButtonWasPressed:(id)sender
{
    
}

@end
