//
//  BSLTodoitem.m
//  Forgetmenot
//
//  Created by Benjamin Lanyado on 03/02/2014.
//  Copyright (c) 2014 Benjamin Lanyado. All rights reserved.
//

#import "BSLTodoitem.h"

@implementation BSLTodoitem

//cos it's a method, remove the ";" and put brackets. NB ONLY METHODS APPLICABLE TO THE METHOD
- (void)markAsCompleted {
    self.completed = YES;
}

- (void)markAsUnfinished {
    self.completed = NO;
}


@end
