//
//  JRWNoteViewController.m
//  NoteTaker
//
//  Created by James Wen on 5/8/14.
//  Copyright (c) 2014 Rochester. All rights reserved.
//

#import "JRWNoteViewController.h"
#import "JRWNote.h"

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




@end
