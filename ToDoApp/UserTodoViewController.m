//
//  UserTodoViewController.m
//  ToDoApp
//
//  Created by Arsalan Vakili on 2015-08-18.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import "UserTodoViewController.h"



@interface UserTodoViewController ()<UITextFieldDelegate>

@end

@implementation UserTodoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userTitleInputTextField.delegate = self;
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.userTitleInputTextField resignFirstResponder];
    
    return YES;
}

-(void)dismissKeyboard{
    
    [self.userTitleInputTextField resignFirstResponder];
    [self.userDescriptionInputTextView resignFirstResponder];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveButton:(id)sender {
    
    // making the newtodo item and than setting up the properties to be the textfields outlets and
    // conforming the protocal method
    
    ToDoItem *newTodoItem = [[ToDoItem alloc]init];
    newTodoItem.title =self.userTitleInputTextField.text ;
    newTodoItem.descriptions = self.userDescriptionInputTextView.text;
    newTodoItem.priorityNumber = [self segmentedButtonPressed];
    newTodoItem.isIndicatorCompleted = self.userIndicatorCompletedSwitch.on;
    [self.delegate didSaveToDoItem:newTodoItem];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(NSNumber *)segmentedButtonPressed{
    if (self.userPriorityNumberSegementedButton.selectedSegmentIndex == 0) {
        return @1;
    }
    else if (self.userPriorityNumberSegementedButton.selectedSegmentIndex == 1){
        return @2;
    }
    else if (self.userPriorityNumberSegementedButton.selectedSegmentIndex == 2){
        return @3;
    }
    return @1;
}

@end
