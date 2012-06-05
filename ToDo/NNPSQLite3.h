//
//  NNPSQLite3.h
//  ToDo
//
//  Created by Damian on 30/05/2012.
//  Copyright (c) 2012 Notatki Niedzielnego Programisty (http://notatkiprogramisty.blox.pl/html). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NNPSQLite3 : NSObject

+(void) copyDatabaseIfNeeded: (NSString *)databaseFileName;
+(NSString *) getDBPath: (NSString *)databaseFileName;

@end
