//
//  todoTableViewCell.h
//  ToDoApp
//
//  Created by Arsalan Vakili on 2015-08-18.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToDoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityNumber;
@property (weak, nonatomic) IBOutlet UISwitch *isCompletedIndicatorSwitch;

@end
