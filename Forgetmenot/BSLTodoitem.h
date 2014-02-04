//
//  BSLTodoitem.h
//  Forgetmenot
//
//  Created by Benjamin Lanyado on 03/02/2014.
//  Copyright (c) 2014 Benjamin Lanyado. All rights reserved.
//

#import <Foundation/Foundation.h>

// all format: @property TYPE name

// declared variables
@interface BSLTodoitem : NSObject

@property (nonatomic, copy) NSString *title;

@property (strong) NSDate *date;

@property BOOL completed;

//custom methods - these are explained in the .m file THESE MUST BE SPECIFIC TO THE MODEL (i.e. todoitem) not just generla methods
- (void)markAsCompleted;

- (void)markAsUnfinished;



@end
