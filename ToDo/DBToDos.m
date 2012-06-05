//
//  DBToDos.m
//  ToDo
//
//  Created by Damian on 30/05/2012.
//  Copyright (c) 2012 Notatki Niedzielnego Programisty (http://notatkiprogramisty.blox.pl/html). All rights reserved.
//

#import "DBToDos.h"

@implementation DBToDos

@synthesize db = _db;

-(id) initWithDatabase {
    if((self = [super init]))
    {
        self.db = [FMDatabase databaseWithPath:[NNPSQLite3 getDBPath:@"todos.sqlite"]]; 
    }
    return self;    
}

-(NSMutableArray *) select {
    NSMutableArray *ma = [[NSMutableArray alloc] init];
    
    if ([self.db open]) {
        FMResultSet *results = [self.db executeQuery:@"SELECT todoid, name, description, priority, completedind, datecreated, datedone FROM todos"];
        while([results next]) {
            ToDo *t = [[ToDo alloc] init];
            
            t.toDoID = [results intForColumn:@"todoid"];
            t.toDo = [results stringForColumn:@"name"];
            t.toDoDescription = [results stringForColumn:@"description"];
            t.toDoPriority = [results intForColumn:@"priority"];
            t.toDoCompletedInd = [[results stringForColumn:@"completedind"] isEqualToString:@"Y"] ? 1 : 0;
            t.toDoDateCreated = [NSDate dateWithTimeIntervalSince1970:[results intForColumn:@"datecreated"]];
            t.toDoDateDone = [NSDate dateWithTimeIntervalSince1970:[results intForColumn:@"datedone"]];
            
            [ma addObject:t];
        }    
        [self.db close];
    }
    
    return ma;    
}

-(BOOL) update:(ToDo *) todo {
    BOOL ret = NO;
    
    if ([self.db open]) {
        [self.db beginTransaction];
        ret = [self.db executeUpdate:@"UPDATE todos SET name = ?, description = ?, priority = ?, completedind = ?, datedone = ? WHERE todoid = ?;", todo.toDo, todo.toDoDescription, [NSNumber numberWithInt:todo.toDoPriority], (todo.toDoCompletedInd == 1 ? @"Y" : @"N"), (todo.toDoCompletedInd == 1 ? [NSDate date] : nil), [NSNumber numberWithInt:todo.toDoID]];
        if(ret) {
            [self.db commit];
        } else {
            [self.db rollback];
        }
    }
    
    return ret;    
}


-(NSInteger) add:(ToDo *) todo {
    NSInteger newToDoID = -1;
    
    if ([self.db open]) {
        [self.db beginTransaction];
        if([self.db executeUpdate:@"INSERT INTO TODOS (NAME, DESCRIPTION, PRIORITY, COMPLETEDIND) VALUES (?, ?, ?, ?);", todo.toDo, todo.toDoDescription, [NSNumber numberWithInt:todo.toDoPriority], (todo.toDoCompletedInd == 1 ? @"Y" : @"N")]) {
            newToDoID = [self.db intForQuery:@"SELECT last_insert_rowid() FROM todos;"];
            [self.db commit];
        } else {
            [self.db rollback];
        }
    }
    
    return newToDoID;
}


-(BOOL) delete:(NSInteger) withKey {
    BOOL ret = NO;
    
    if (withKey > 0) {
        
        if ([self.db open]) {
            
            [self.db beginTransaction];
            ret = [self.db executeUpdate:@"DELETE FROM todos WHERE todoid = ?;", [NSNumber numberWithInt:withKey]];
            if (ret) {
                [self.db commit];
            } else {
                [self.db rollback];
            }
        }        
    }
    
    return ret;    
}

-(BOOL) deleteAllCompleted {
    BOOL ret = NO;
    
    if ([self.db open]) {
        
        [self.db beginTransaction];
        ret = [self.db executeUpdate:@"DELETE FROM todos WHERE completedind = 'Y';"];
        if (ret) {
            [self.db commit];
        } else {
            [self.db rollback];
        }
    }       
    
    return ret;    
}

@end
