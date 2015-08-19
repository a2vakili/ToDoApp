//
//  ToDoItem.m
//  ToDoApp
//
//  Created by Arsalan Vakili on 2015-08-18.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import "ToDoItem.h"

@implementation ToDoItem


- (instancetype)initWithTitle:(NSString *) title withDescription:(NSString *)description withpriorityNumber:(NSNumber *)number withIsCompletedIndicator: (BOOL)indicator
{
    self = [super init];
    if (self) {
        _title = title;
        _descriptions = description;
        _priorityNumber = number;
        _isIndicatorCompleted = indicator;
    }
    return self;
}

@end
