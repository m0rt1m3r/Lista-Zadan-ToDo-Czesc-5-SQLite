//
//  RefreshTableProtocol.h
//  ToDo
//
//  Created by damian on 22/04/2012.
//  Copyright (c) 2012 Notatki Niedzielnego Programisty (http://notatkiprogramisty.blox.pl/html). All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RefreshTableProtocol <NSObject> 

enum operation {INSERT = 0, UPDATE = 1, DELETE = 2};

@optional
-(void) refreshTableAfter:(int)operation:(id)withObject: (NSIndexPath*)atIndexPath;

@end
