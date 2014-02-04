//
//  BSLAddTodoViewController.h
//  Forgetmenot
//
//  Created by Benjamin Lanyado on 04/02/2014.
//  Copyright (c) 2014 Benjamin Lanyado. All rights reserved.
//

#import <UIKit/UIKit.h>

//define our protocol FIRST for dismissing the view controller
@protocol BSLAddTodoViewControllerDelegate;

/// shows the parent class
@interface BSLAddTodoViewController : UIViewController

// all format: @property TYPE name
//IBoutlet makes textField accesible within the storyboard - in the outlets of connections
@property IBOutlet UITextField *textField;

//copied form UIview.h creat a property (a reference) to an object we will istruct to do things. Delegates are how views are presented and dismissed.
@property (nonatomic, assign)   id <BSLAddTodoViewControllerDelegate>   delegate;

@end

//defining the delegate
@protocol BSLAddTodoViewControllerDelegate <NSObject>

//delegate methods void as they don't expect anything back
//This is a required method that will be called on the delegate when "cancel" is pressed. Required becuase there is no @optional above it
- (void)addTodoViewControllerDidCancel:(BSLAddTodoViewController *)controller;


//Required method that will be called on the delegate when Done is pressed
- (void)addTodoViewController:(BSLAddTodoViewController *)controller didFinishWithText:(NSString *)text;

@end
