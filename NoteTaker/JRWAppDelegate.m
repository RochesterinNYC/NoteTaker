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

+ (NSMutableArray *)getNotes{
    notes = [[NSMutableArray alloc] initWithArray:[notes sortedArrayUsingSelector:@selector(compare:)]];
    return notes;
}

+ (void)addNote: (JRWNote *)newNote{
    [notes addObject: newNote];
}

+ (void)saveNotesData{
    NSLog(@"Saving data!");
    NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] initWithCapacity: 3];
    if (notes != nil){
        [dataDictionary setObject: notes forKey:@"notes"];
    }
    NSString *filePath = [JRWAppDelegate getFilePath];
    [NSKeyedArchiver archiveRootObject:dataDictionary toFile:filePath];
}

+ (NSString *)getFilePath{
    NSArray *urls = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                                           inDomains:NSUserDomainMask];
    NSString *documentDirPath = [[urls objectAtIndex:0] path];
    return [documentDirPath stringByAppendingPathComponent:@"notesData"];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
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
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = navController;

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    [JRWAppDelegate saveNotesData];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [JRWAppDelegate saveNotesData];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [JRWAppDelegate saveNotesData];
}


@end
