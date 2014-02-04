//
//  BSLTodoTableViewController.h
//  Forgetmenot
//
//  Created by Benjamin Lanyado on 03/02/2014.
//  Copyright (c) 2014 Benjamin Lanyado. All rights reserved.
//

#import <UIKit/UIKit.h>
//importing the header file of our AddTodo controller, as it contains the delegate definition
#import "BSLAddTodoViewController.h"

// this is parent class

//stating that this class implements methods defined in BSLTodoTableViewController - i.e. inside the m file, these methods exist
@interface BSLTodoTableViewController : UITableViewController < BSLAddTodoViewControllerDelegate>

@property (strong) NSMutableArray *todoItems;
// this can be accessed in any of the methods

@end

// NB this part of the controller says what the controller does, the m says how we do it
