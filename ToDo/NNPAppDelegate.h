//
//  NNPAppDelegate.h
//  ToDo
//
//  Created by Damian on 14/04/2012.
//  Copyright (c) 2012 Notatki Niedzielnego Programisty (http://notatkiprogramisty.blox.pl/html). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"
#import "DBToDos.h"

@interface NNPAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSMutableArray *toDos;
@property (strong, nonatomic) NSMutableArray *toDosCompleted;

@property (strong, nonatomic) DBToDos *db;

@end
