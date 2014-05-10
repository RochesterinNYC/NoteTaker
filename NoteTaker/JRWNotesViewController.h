//
//  JRWNotesViewController.h
//  NoteTaker
//
//  Created by James Wen on 5/9/14.
//  Copyright (c) 2014 Rochester. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JRWNotesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    IBOutlet UITableView *myTableView;
}

@property(strong, nonatomic) IBOutlet UITableView *myTableView;

@end
