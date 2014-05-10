//
//  JRWNoteViewController.m
//  NoteTaker
//
//  Created by James Wen on 5/8/14.
//  Copyright (c) 2014 Rochester. All rights reserved.
//

#import "JRWNoteViewController.h"
#import "JRWNote.h"
#import "JRWAppDelegate.h"

@interface JRWNoteViewController ()

@end

@implementation JRWNoteViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.title = @"New Note";
    }
    return self;
}

- (id)initOldNote:(JRWNote *)existingNote {
    self = [super initWithNibName:@"JRWNoteViewController" bundle:nil];
    if(self){
        self.navigationItem.title = @"Existing Note";
        self.titleField.text = existingNote.title;
        self.contentField.text = existingNote.content;
    }
    return self;
}

//Note Saving

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Save Note" style:UIBarButtonItemStyleBordered target:self action:@selector(saveNote)];
}

-(void)saveNote {
    
    JRWNote *noteToSave = [[JRWNote alloc]initWithNoteTitle: self.titleField.text Content: self.contentField.text];
    [JRWAppDelegate addNote:noteToSave];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
