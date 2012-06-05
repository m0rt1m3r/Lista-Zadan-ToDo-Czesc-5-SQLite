//
//  DBToDos.h
//  ToDo
//
//  Created by Damian on 30/05/2012.
//  Copyright (c) 2012 Notatki Niedzielnego Programisty (http://notatkiprogramisty.blox.pl/html). All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NNPSQLite3.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "ToDo.h"

@interface DBToDos : NSObject 

@property (nonatomic, retain) FMDatabase *db;

-(id) initWithDatabase;

-(NSMutableArray *) select;
-(BOOL) update:(ToDo *) todo;
-(NSInteger) add:(ToDo *) todo;
-(BOOL) delete:(NSInteger) withKey;
-(BOOL) deleteAllCompleted;

@end
