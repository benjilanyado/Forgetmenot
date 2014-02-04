//
//  BSLTodoTableViewController.m
//  Forgetmenot
//
//  Created by Benjamin Lanyado on 03/02/2014.
//  Copyright (c) 2014 Benjamin Lanyado. All rights reserved.
//

#import "BSLTodoTableViewController.h" // this specifies the other part of the contoller
#import "BSLTodoitem.h" //this specifies the model to use

@interface BSLTodoTableViewController ()

@end

@implementation BSLTodoTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //setting the title
    self.title = @"Todo list";
    
    // creating an empty list
    self.todoItems = [[NSMutableArray alloc] init];
    
    //creating a todo item object (this is the miodel). NB the * is a variable, which is only accesisble within this method
    BSLTodoitem *todoItem = [[BSLTodoitem alloc] init];
    todoItem.title = @"Feed the dogs";
    todoItem.date = [NSDate date];
    
    
    // add object to array
    [self.todoItems addObject:todoItem ];
  

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // every array has a count, which will be an integer
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return [self.todoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // as we have specified "Cell" in the storyboard
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    //get the to-do item at a given point in the array
    BSLTodoitem *todo = [self.todoItems objectAtIndex:indexPath.row];
    //this is setting the variable (i.e. it's a row in the array)
    
    // set the title
    cell.textLabel.text = todo.title   ;
    
    //set the date variable
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init ];
    
    // how to display it
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    
    //converts NSDate to NSString
    cell.detailTextLabel.text = [dateFormatter stringFromDate:todo.date];
    
    // displays a tick if completed
    if (todo.completed == YES) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    
    return cell;
}

// implementing a delegate method for ITableView (INCLUDE HYPEHN) Basically - click

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    //get the to-do item at a given point in the array NB There is an index path in the method above
    BSLTodoitem *todo = [self.todoItems objectAtIndex:indexPath.row];

    //here's an action
    if (todo.completed == YES) {
    [todo markAsUnfinished];
        NSLog(@"YOU DIDN'T DO IT");
    } else {        
        [todo markAsCompleted];
        NSLog(@"YOU DID IT");
    }
    
    // refresh cell
    [self.tableView reloadData];
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        //
        [self.todoItems removeObjectAtIndex:indexPath.row];
        
        //creat an array of indexpaths the we will be deleting (1)
        NSArray *indexPaths = @[indexPath];
        //twll the tableview to delete a cell
        [tableView deleteRowsAtIndexPaths:
         indexPaths withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    
    //checking that the segue that will execute is the one we want (check identifier)
    if ([segue.identifier isEqualToString:@"ShowAddTodo"]) {
        
        // get reference to the nav controller, which is the desination of the segue in the storyboard
        UINavigationController *navController = [segue destinationViewController];
        
        // get a reference to our "Add to do" view controller"
        BSLAddTodoViewController *viewController = (BSLAddTodoViewController *)navController.topViewController;
        
        // assign the delegate to execute methods on "us" (the table view controller)
        viewController.delegate = self;
    }


}

// you can connect this in the view with the arrow icon and drag - it asks which IBAction you want. NB when dragging, you're drsgging it onto a controller that can use it, i.e. the table view controller.
- (IBAction)addButtonPressed:(id)sender {
    NSLog(@"Add todo item");
    
    // this method triggers the segue you've made in the storyboard, and named ShowAddTodo
    [self performSegueWithIdentifier:@"ShowAddTodo" sender:self];
    
};

#pragma mark - BSLAddTodoControllerDelegate method

- (void)addTodoViewControllerDidCancel:(BSLAddTodoViewController *)controller {
    //remove AddTodoViewCOntroller from screen
    // YES = make it an animated dismiss nil = don't execute anything you've cancelled
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)addTodoViewController:(BSLAddTodoViewController *)controller didFinishWithText:(NSString *)text {
    [self dismissViewControllerAnimated:YES completion:nil];
    
    //copied from Viewdidload section above - create a new todo item
    BSLTodoitem *todo = [[BSLTodoitem alloc] init];
    todo.title = text;
    todo.date = [NSDate date];
    
    // add todo to array, then tell the array to refresh, triggering it's 'datasource' methods - (number or rows etc)    
    [self.todoItems addObject:todo ];
    [self.tableView reloadData];
}






@end
