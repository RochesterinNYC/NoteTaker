//
//  JRWNotesViewController.m
//  NoteTaker
//
//  Created by James Wen on 5/9/14.
//  Copyright (c) 2014 Rochester. All rights reserved.
//

#import "JRWNotesViewController.h"
#import "JRWNoteViewController.h"
#import "JRWNote.h"
#import "JRWAppDelegate.h"
@interface JRWNotesViewController ()

@end

@implementation JRWNotesViewController
@synthesize myTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        myTableView.dataSource = self;
        myTableView.delegate = self;
    }
    return self;
}

//Table View Data Source Functionality

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return [[APP_DELEGATE getNotes] count];
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if( cell == nil )
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    if(indexPath.row < [[JRWAppDelegate getNotes]count]){
        JRWNote *tempNote = [[JRWAppDelegate getNotes] objectAtIndex:indexPath.row];
        cell.textLabel.text = tempNote.title;
    }
    return cell;

}

- (NSString *)tableView: (UITableView *)tableView titleForHeaderinSection:(NSInteger)section{
    return @"testing";
}

//Table View Delegate Functionality

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    int selectedRow = indexPath.row;
}

//

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(createNewNote)];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.myTableView reloadData];
}

-(void)createNewNote {
    NSLog(@"Time to create new note!");
    UIViewController *newNote = [[JRWNoteViewController alloc] initWithNibName:@"JRWNoteViewController" bundle:nil];
    
    [self.navigationController pushViewController:newNote animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
