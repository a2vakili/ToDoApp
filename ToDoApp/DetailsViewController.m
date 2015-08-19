//
//  DetailsViewController.m
//  ToDoApp
//
//  Created by Arsalan Vakili on 2015-08-18.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController



-(void)setTodo:(ToDoItem *)todo{
    if (_todo != todo) {
        _todo = todo;      // checking to see if we instantanly dont have to do // make to do items
    }
    // configure the view
    [self configureView];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)configureView{
    
    if (self.todo) {
        self.detailTitle.text = self.todo.title;
        self.descriptionLabel.text = self.todo.descriptions;
        self.priorityNumberLabel.text = [NSString stringWithFormat:@"%@",self.todo.priorityNumber];
        self.completedIndicatorSwitch.on = self.todo.isIndicatorCompleted;
    }
  
}


@end
