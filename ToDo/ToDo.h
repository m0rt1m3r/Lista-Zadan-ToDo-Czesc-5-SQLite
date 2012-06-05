//
//  ToDo.h
//  ToDo
//
//  Created by Damian on 14/04/2012.
//  Copyright (c) 2012 Notatki Niedzielnego Programisty (http://notatkiprogramisty.blox.pl/html). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDo : NSObject 

@property (nonatomic, retain) NSString *toDo;
@property (nonatomic, retain) NSString *toDoDescription;
@property (nonatomic, assign) NSInteger toDoPriority;
@property (nonatomic, assign) NSInteger toDoCompletedInd;
@property (nonatomic, assign) NSInteger toDoID;
@property (nonatomic, retain) NSDate *toDoDateCreated;
@property (nonatomic, retain) NSDate *toDoDateDone;

@end
