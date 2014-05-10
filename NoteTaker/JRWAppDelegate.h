//
//  JRWAppDelegate.h
//  NoteTaker
//
//  Created by James Wen on 5/8/14.
//  Copyright (c) 2014 Rochester. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JRWNote.h"

@interface JRWAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//Class methods
+ (void)saveNotesData;
+ (NSMutableArray *)getNotes;
+ (void)addNote:(JRWNote *)newNote;
@end