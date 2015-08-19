//
//  ToDoItem.h
//  ToDoApp
//
//  Created by Arsalan Vakili on 2015-08-18.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSString *descriptions;
@property(nonatomic,strong) NSNumber *priorityNumber;
@property(nonatomic) BOOL isIndicatorCompleted;

- (instancetype)initWithTitle:(NSString *) title withDescription:(NSString *)description withpriorityNumber:(NSNumber *)number withIsCompletedIndicator: (BOOL)indicator;

@end
