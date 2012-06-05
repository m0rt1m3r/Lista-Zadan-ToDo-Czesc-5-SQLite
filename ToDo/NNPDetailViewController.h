//
//  NNPDetailViewController.h
//  ToDo
//
//  Created by damian on 14/04/2012.
//  Copyright (c) 2012 Notatki Niedzielnego Programisty (http://notatkiprogramisty.blox.pl/html). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"
#import "RefreshTableProtocol.h"

@interface NNPDetailViewController : UIViewController {
id <RefreshTableProtocol> __unsafe_unretained _delegate;
@private
    UIImage     *_doneImg, *_notDoneImg;
    NSInteger   _completedIndState;    
}

@property (assign) id delegate;
@property (weak, nonatomic) NSIndexPath *parentCellIndexPath;

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) ToDo *task;
@property (weak, nonatomic) IBOutlet UITextField *nameTxtField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTxtField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *prioritySegCtrl;
@property (weak, nonatomic) IBOutlet UIButton *completedBtn;

- (IBAction)completedBtnTapped:(id)sender;
- (IBAction)saveBtnTapped:(id)sender;
- (IBAction)deleteBtnTapped:(id)sender;
- (IBAction)hideKeyboard:(id)sender;


@end
