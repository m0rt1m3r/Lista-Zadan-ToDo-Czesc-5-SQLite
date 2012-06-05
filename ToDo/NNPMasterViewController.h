//
//  NNPMasterViewController.h
//  ToDo
//
//  Created by Damian on 14/04/2012.
//  Copyright (c) 2012 Notatki Niedzielnego Programisty (http://notatkiprogramisty.blox.pl/html). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NNPAppDelegate.h"
#import "ToDo.h"
#import "NNPDetailViewController.h"
#import "RefreshTableProtocol.h"

#define ALERTMESSAGE_DELETEALL   1001

@interface NNPMasterViewController : UITableViewController <RefreshTableProtocol> {
    NNPAppDelegate *appDelegate;
    
@private
    UIImage *_lowImg, *_mediumImg, *_highImg;    
}

- (IBAction)deleteAllCompleted:(id)sender;

@end
