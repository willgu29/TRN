//
//  CreateLocalEventViewController.m
//  TRN
//
//  Created by William Gu on 3/16/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "CreateLocalEventViewController.h"
#import "AddReasonsViewController.h"
#import "LocalEvent.h"
#import <Parse/Parse.h>

@interface CreateLocalEventViewController ()

@property (nonatomic, weak) IBOutlet UILabel *characterCount;
@property (nonatomic, weak) IBOutlet UISwitch *isFlexible;
@property (nonatomic, weak) IBOutlet UITextView *eventActivity;
@property (nonatomic, weak) IBOutlet UITextField *eventTitle;
@property (nonatomic, weak) IBOutlet UIPickerView *whoPicker;
@property (nonatomic, strong) NSArray *whoCanSee;



@end

const NSString* PLACEHOLDER_TEXTVIEWTEXT = @"Suggest an activity...";

@implementation CreateLocalEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addLayerToTextView];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"Create Local Event";
    _whoCanSee = @[@"Everyone", @"Only Friends", @"Friends + Girls", @"Friends + Guys", @"Only Guys", @"Only Girls"];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBActions

-(IBAction)submit:(UIButton *)sender
{
    //TOOD: Error check
    //TODO: Save data, pass down
    LocalEvent *localEvent = [[LocalEvent alloc] init];
    localEvent.isFlexibleAboutEvent = _isFlexible.on;
    localEvent.eventName = _eventTitle.text;
    localEvent.eventActivity = _eventActivity.text;
    localEvent.hostName = [PFUser currentUser].username;
    localEvent.whoCanSeeEvent = [_whoPicker selectedRowInComponent:0];
    
    AddReasonsViewController *addVC = [[AddReasonsViewController alloc] initWithNibName:@"AddReasonsViewController" bundle:nil];
    [self.navigationController pushViewController:addVC animated:YES];
}

#pragma mark - Text Field Delegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_eventTitle resignFirstResponder];
    [_eventActivity resignFirstResponder];
}


#pragma mark - Text View Delegate
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:(NSString *)PLACEHOLDER_TEXTVIEWTEXT])
    {
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
    }
    [textView becomeFirstResponder];
}
-(void)textViewDidEndEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@""])
    {
        textView.text = (NSString *)PLACEHOLDER_TEXTVIEWTEXT;
        textView.textColor = [UIColor lightGrayColor];
    }
    [textView resignFirstResponder];
}
-(void)textViewDidChange:(UITextView *)textView
{
    _characterCount.text = [NSString stringWithFormat:@"%d",70-[textView.text length]];
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    // Prevent crashing undo bug – see note below.
    if(range.length + range.location > textView.text.length)
    {
        return NO;
    }
    
    NSUInteger newLength = [textView.text length] + [text length] - range.length;
    return (newLength > 70) ? NO : YES;
}



#pragma mark - Picker view

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"Picker Row: %d", row);
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [_whoCanSee count];
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_whoCanSee objectAtIndex:row];
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

#pragma mark - Helper functions

-(void)addLayerToTextView
{
    CALayer* imageLayer = _eventActivity.layer;
    imageLayer.cornerRadius = 10;
    imageLayer.borderWidth = 1;
    imageLayer.borderColor = [UIColor lightGrayColor].CGColor;
}

@end
