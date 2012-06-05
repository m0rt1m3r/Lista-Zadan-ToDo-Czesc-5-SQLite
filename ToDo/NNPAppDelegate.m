//
//  NNPAppDelegate.m
//  ToDo
//
//  Created by Damian on 14/04/2012.
//  Copyright (c) 2012 Notatki Niedzielnego Programisty (http://notatkiprogramisty.blox.pl/html). All rights reserved.
//

#import "NNPAppDelegate.h"

@interface NNPAppDelegate()
-(void) loadInitialData;
@end

@implementation NNPAppDelegate
@synthesize window = _window;
//ddo
@synthesize toDos = _toDos;
@synthesize toDosCompleted = _toDosCompleted;
@synthesize db = _db;

-(void) loadInitialData {
    [NNPSQLite3 copyDatabaseIfNeeded:@"todos.sqlite"];
    self.db = [[DBToDos alloc] initWithDatabase];
    ToDo *task;
    NSMutableArray *tempToDos = [self.db select];
    self.toDos = [[NSMutableArray alloc] init];
    self.toDosCompleted = [[NSMutableArray alloc] init];
    for (int i = 0; i < [tempToDos count]; i++) {
        task = [[ToDo alloc] init];
        task = (ToDo *)[tempToDos objectAtIndex:i];
        if (task.toDoCompletedInd == 1) {
            [self.toDosCompleted addObject:task];
        } else {
            [self.toDos addObject:task];
        }
    }    
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self loadInitialData];     
    return YES;
}

/* usuwamy pozostale metody */
- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}


@end
