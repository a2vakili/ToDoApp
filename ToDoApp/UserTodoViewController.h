//
//  UserTodoViewController.h
//  ToDoApp
//
//  Created by Arsalan Vakili on 2015-08-18.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoItem.h"

@protocol UserTodoViewControllerDelegate <NSObject>

-(void)didSaveToDoItem:(ToDoItem *)todo;

@end

@interface UserTodoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *userTitleInputTextField;
@property (weak, nonatomic) IBOutlet UITextView *userDescriptionInputTextView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *userPriorityNumberSegementedButton;
@property (weak, nonatomic) IBOutlet UISwitch *userIndicatorCompletedSwitch;

@property(nonatomic,strong) ToDoItem *todo;
@property(nonatomic,weak) id<UserTodoViewControllerDelegate>delegate;


@end
