//
//  NNPSQLite3.m
//  ToDo
//
//  Created by Damian on 30/05/2012.
//  Copyright (c) 2012 Notatki Niedzielnego Programisty (http://notatkiprogramisty.blox.pl/html). All rights reserved.
//

#import "NNPSQLite3.h"

@implementation NNPSQLite3

+(void) copyDatabaseIfNeeded: (NSString *)databaseFileName {
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSError *error;
	NSString *dbPath = [self getDBPath:databaseFileName];
    
	BOOL success = [fileManager fileExistsAtPath:dbPath];
	if (!success) {
        
		NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:databaseFileName];
		success = [fileManager copyItemAtPath:defaultDBPath toPath:dbPath error:&error];
        
		if (!success) {
			NSAssert1 (0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
		} else {
			NSLog(@"Writable database copied");
		}
	}else {
		NSLog(@"Writable database exists");
	}    
}

+(NSString *) getDBPath: (NSString *)databaseFileName {
	NSString *dbPath;
    
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDir = [paths objectAtIndex:0];
    
	dbPath = [documentsDir stringByAppendingPathComponent:databaseFileName];
    
	NSLog(@"Database path: %@", dbPath);
    
	return dbPath;    
}

@end
