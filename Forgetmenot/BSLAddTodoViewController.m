//
//  BSLAddTodoViewController.m
//  Forgetmenot
//
//  Created by Benjamin Lanyado on 04/02/2014.
//  Copyright (c) 2014 Benjamin Lanyado. All rights reserved.
//

#import "BSLAddTodoViewController.h"

@interface BSLAddTodoViewController () // NB YOU NEED TO MATCH THIS AS THE VIEW CONTROLLERS'S CLASS (3rd ICON ALONG)

@end

@implementation BSLAddTodoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    // set tile of view controller
    
    self.title = @"Add item";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - User actions

// DONE BUTTON WILL BE KLINED TO THIS METHOD IN THE STORYBOARD
- (IBAction)donePressed:(id)sender {
    
    // you'll see this when you drag a "sent action" selector in the storyboard
    NSLog(@"we done pressed it innit blud");
    
    NSString *userInput = self.textField.text;
    
    NSLog(@"User has entered: %@", userInput);
    
    //call the delegate to dismiss the view controller, passing it userInput
    [self.delegate addTodoViewController:self didFinishWithText:userInput];
    
    
    
    
}

- (IBAction)cancelPressed:(id)sender {
    
    NSLog(@"cancel button has been pressed");
    
    //call the delegate method to dismiss the view controller
    [self.delegate addTodoViewControllerDidCancel:self ];
}



@end







