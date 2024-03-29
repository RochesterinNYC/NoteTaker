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
    return [[JRWAppDelegate getNotes] count];
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

//Table View Delegate Functionality
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    int selectedRow = indexPath.row;
    [self seeNoteAtIndex:selectedRow];
}

//Instance Methods
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(createNewNote)];
    self.navigationItem.title = @"Your Notes";
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.myTableView reloadData];
}

//Action for new note
-(void)createNewNote {
    NSLog(@"Time to create new note!");
    UIViewController *newNote = [[JRWNoteViewController alloc] initWithNibName:@"JRWNoteViewController" bundle:nil];
    
    [self.navigationController pushViewController:newNote animated:YES];
}
//Action for viewing existing note
-(void)seeNoteAtIndex:(int)index {
    JRWNote *tempNote = [[JRWAppDelegate getNotes]objectAtIndex:index];
    UIViewController *existingNote = [[JRWNoteViewController alloc] initOldNote: tempNote];
    [self.navigationController pushViewController:existingNote animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
