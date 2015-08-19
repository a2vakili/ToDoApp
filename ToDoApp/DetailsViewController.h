//
//  DetailsViewController.h
//  ToDoApp
//
//  Created by Arsalan Vakili on 2015-08-18.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoItem.h"

@interface DetailsViewController : UIViewController

@property(nonatomic,strong) ToDoItem *todo;


@property (weak, nonatomic) IBOutlet UILabel *detailTitle;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityNumberLabel;
@property (weak, nonatomic) IBOutlet UISwitch *completedIndicatorSwitch;

@end
