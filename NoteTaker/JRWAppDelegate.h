//
//  JRWAppDelegate.h
//  NoteTaker
//
//  Created by James Wen on 5/8/14.
//  Copyright (c) 2014 Rochester. All rights reserved.
//

#import <UIKit/UIKit.h>
#define APP_DELEGATE ((JRWAppDelegate *)[[UIApplication sharedApplication] delegate])

@interface JRWAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSMutableArray *notes;

//Initializers
- (void)saveNotesData;
- (NSMutableArray *)getNotes;
@end
