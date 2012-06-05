//
//  NNPDetailViewController.m
//  ToDo
//
//  Created by Damian on 14/04/2012.
//  Copyright (c) 2012 Notatki Niedzielnego Programisty (http://notatkiprogramisty.blox.pl/html). All rights reserved.
//

#import "NNPDetailViewController.h"

@interface NNPDetailViewController ()
- (void)configureView;
- (void)setCompletedImage:(NSInteger)completed;
- (void)updateToDoObject:(ToDo *)object;
@end

@implementation NNPDetailViewController

@synthesize delegate = _delegate;
@synthesize parentCellIndexPath = _parentCellIndexPath;

@synthesize detailItem = _detailItem;
@synthesize task = _task;
@synthesize nameTxtField = _nameTxtField;
@synthesize descriptionTxtField = _descriptionTxtField;
@synthesize prioritySegCtrl = _prioritySegCtrl;
@synthesize completedBtn = _completedBtn;

#pragma mark - Managing the detail item

-(void) setCompletedImage:(NSInteger)completed {
    
    //todo2 -- bez rozszerzenia
    if (!_doneImg || !_notDoneImg) {
        _doneImg = [UIImage imageNamed:@"check"];
        _notDoneImg = [UIImage imageNamed:@"checkblank"];
    }
    UIImage *image = (completed == 1 ? _doneImg : _notDoneImg);
    [self.completedBtn setImage:image forState:UIControlStateNormal];
}

-(void)updateToDoObject:(ToDo *)object {
    object.toDo = self.nameTxtField.text;
    object.toDoDescription = self.descriptionTxtField.text;
    object.toDoPriority = self.prioritySegCtrl.selectedSegmentIndex;
    object.toDoCompletedInd = _completedIndState;
}

-(IBAction)saveBtnTapped:(id)sender {
    if (self.parentCellIndexPath) {
        //updating...
        [self updateToDoObject:self.task];
        [self.delegate refreshTableAfter:UPDATE :self.task :self.parentCellIndexPath];
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        //inserting...
        ToDo *tempTask = [[ToDo alloc] init];
        [self updateToDoObject:tempTask];
        tempTask.toDoID = -1;
        if ([tempTask.toDo length] > 0) {
            [self.delegate refreshTableAfter:INSERT :tempTask :nil];
        }
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

-(IBAction)deleteBtnTapped:(id)sender {
    if (self.parentCellIndexPath) {
        [self.delegate refreshTableAfter:DELETE :self.task :self.parentCellIndexPath];
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    //todo2
    if (self.detailItem) {
        self.task = (ToDo *)self.detailItem;
        
        
        self.nameTxtField.text = self.task.toDo;
        self.descriptionTxtField.text = self.task.toDoDescription;
        self.prioritySegCtrl.selectedSegmentIndex = self.task.toDoPriority;
        _completedIndState = self.task.toDoCompletedInd;
        [self setCompletedImage:self.task.toDoCompletedInd];
    } else {
        _completedIndState = 0;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewDidUnload
{
    [self setNameTxtField:nil];
    [self setDescriptionTxtField:nil];
    [self setPrioritySegCtrl:nil];
    [self setCompletedBtn:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)completedBtnTapped:(id)sender {
    if (_completedIndState == 1) {
        _completedIndState = 0;
    } else {
        _completedIndState = 1;
    }
    [self setCompletedImage:_completedIndState];    
}

- (IBAction)hideKeyboard:(id)sender {
    [(UITextField *)sender resignFirstResponder];
}


@end
