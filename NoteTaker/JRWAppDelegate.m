//
//  JRWAppDelegate.m
//  NoteTaker
//
//  Created by James Wen on 5/8/14.
//  Copyright (c) 2014 Rochester. All rights reserved.
//

#import "JRWAppDelegate.h"
#import "JRWNotesViewController.h"

static NSMutableArray *notes;

@implementation JRWAppDelegate

//Class Methods
//Get global notes array
+ (NSMutableArray *)getNotes{
    notes = [[NSMutableArray alloc] initWithArray:[notes sortedArrayUsingSelector:@selector(compare:)]];
    return notes;
}
//Add a note to the global notes array
+ (void)addNote: (JRWNote *)newNote{
    [notes addObject: newNote];
}
//Save the current global notes array
+ (void)saveNotesData{
    NSLog(@"Saving data!");
    NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] initWithCapacity: 3];
    if (notes != nil){
        [dataDictionary setObject: notes forKey:@"notes"];
    }
    NSString *filePath = [JRWAppDelegate getFilePath];
    [NSKeyedArchiver archiveRootObject:dataDictionary toFile:filePath];
}
//Get the path for NSencoding
+ (NSString *)getFilePath{
    NSArray *urls = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                                           inDomains:NSUserDomainMask];
    NSString *documentDirPath = [[urls objectAtIndex:0] path];
    return [documentDirPath stringByAppendingPathComponent:@"notesData"];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //NSCoder Notes Data Loading
    NSString *filePath = [JRWAppDelegate getFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]){
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        NSDictionary *savedData = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        
        if([savedData objectForKey:@"notes"] != nil){
            notes = [[NSMutableArray alloc] initWithArray:[savedData objectForKey:@"notes"]];
        }
    }
    
    //View Controller Initialization
    JRWNotesViewController *vc = [[JRWNotesViewController alloc]
       initWithNibName:@"JRWNotesViewController" bundle:nil];
    
    //Nav Controller Initialization
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = navController;

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    [JRWAppDelegate saveNotesData];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [JRWAppDelegate saveNotesData];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [JRWAppDelegate saveNotesData];
}


@end
