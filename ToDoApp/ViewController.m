//
//  ViewController.m
//  ToDoApp
//
//  Created by Arsalan Vakili on 2015-08-18.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import "ViewController.h"
#import "ToDoItem.h"
#import "ToDoTableViewCell.h"
#import "DetailsViewController.h"
#import "UserTodoViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UserTodoViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong) NSMutableArray *todoItemsArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;  // setting the tableviews data source to be the current view contoller
    self.tableView.delegate = self;  // setting the tableviews delegate to be the current controller

    [self makingSomeData];
   // [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


   // creating the swipe gesture recognizer to be able to strike though the completed tasks

- (IBAction)swipeGestureRecoginzer:(id)sender {
    
    UISwipeGestureRecognizer *swipeGesture = (UISwipeGestureRecognizer *)sender;
    
    
    
    CGPoint cellLocation = [swipeGesture locationInView:self.tableView];
    NSIndexPath *cellToSwipe = [self.tableView indexPathForRowAtPoint:cellLocation];
    
    NSNumber *strikeSize = [NSNumber numberWithInt:2];
    
    NSDictionary *strikeThroughAttribute = [NSDictionary dictionaryWithObject:strikeSize forKey:NSStrikethroughStyleAttributeName];
    ToDoTableViewCell *tableViewCell = (ToDoTableViewCell *)[self.tableView cellForRowAtIndexPath:cellToSwipe];
    
    NSString *stringToStrikeThrough = tableViewCell.titleLabel.text;
    
    NSAttributedString *strikeThroughText = [[NSAttributedString alloc]initWithString:stringToStrikeThrough attributes:strikeThroughAttribute];
    tableViewCell.titleLabel.attributedText = strikeThroughText;
    
}




-(void)makingSomeData{
    ToDoItem *todoItem1 = [[ToDoItem alloc]initWithTitle:@"Cleaning" withDescription:@"Need to clean the my washroom" withpriorityNumber:@2 withIsCompletedIndicator:NO];
    ToDoItem *todoItem2 = [[ToDoItem alloc]initWithTitle:@"Studying" withDescription:@"Studying for dynamical systems and operating systems" withpriorityNumber:@1 withIsCompletedIndicator:YES];
    ToDoItem *todItem3 = [[ToDoItem alloc]initWithTitle:@"Meeting James" withDescription:@"going with James to the bar in downtown Toronto" withpriorityNumber:@2 withIsCompletedIndicator:YES];
    ToDoItem *todoItem4 = [[ToDoItem alloc]initWithTitle:@"Soccer" withDescription:@"soccer at UW with friends on friday night" withpriorityNumber:@1 withIsCompletedIndicator:NO];
    self.todoItemsArray = [[NSMutableArray alloc]initWithArray:@[todoItem1,todoItem2,todItem3,todoItem4]];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"showDetails"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ToDoItem *object = self.todoItemsArray[indexPath.row];
        DetailsViewController *vc = [segue destinationViewController];
        [vc setTodo:object];
    } else if ([[segue identifier] isEqualToString:@"UserTodo"]){
        UINavigationController *nav = [segue destinationViewController];
        UserTodoViewController *vc = nav.viewControllers[0];
        vc.delegate = self;
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.todoItemsArray.count;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
     ToDoTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    ToDoItem *todItem = self.todoItemsArray[indexPath.row];
   
    cell.titleLabel.text = todItem.title;
    cell.descriptionLabel.text = todItem.descriptions;
    cell.priorityNumber.text = [NSString stringWithFormat:@"%@",todItem.priorityNumber];
    cell.isCompletedIndicatorSwitch.on = todItem.isIndicatorCompleted;
    
    return cell;
    
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        ToDoItem *todItem = self.todoItemsArray[indexPath.row];
        [self.todoItemsArray removeObject:todItem];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


-(void)didSaveToDoItem:(ToDoItem *)todo{
    [self.todoItemsArray addObject:todo];
    [self.tableView reloadData];
}


@end
