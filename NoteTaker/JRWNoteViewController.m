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

@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextView *contentField;
@property (nonatomic) JRWNote *note;

@end

@implementation JRWNoteViewController

- (JRWNote *)note{
    if (!_note){
        _note = [[JRWNote alloc] init];
    }
    return _note;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
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
    [APP_DELEGATE addNote:noteToSave];
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
