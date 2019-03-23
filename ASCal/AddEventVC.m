//
//  AddEventVC.m
//  ASCaL
//
//  Created by Amit Saini on 5/22/17.
//  Copyright © 2017 Amit Saini. All rights reserved.
//

#import "AddEventVC.h"
#import "ASCalendarEvent.h"

@interface AddEventVC ()<UITextFieldDelegate>


@end

@implementation AddEventVC{
    IBOutlet UITextField *txtEventName;IBOutlet UITextField *txtDate; IBOutlet UIButton *btnSubmit;   
}

#pragma mark - View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    btnSubmit.layer.cornerRadius=6;
    UIView *paddingName = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    txtEventName.leftView=paddingName;
    txtEventName.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingDate= [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    txtDate.leftView=paddingDate;
    txtDate.leftViewMode = UITextFieldViewModeAlways;
    
    txtEventName.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    txtEventName.layer.borderWidth= 1.0f;
    txtEventName.layer.cornerRadius=6;
    
    txtDate.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    txtDate.layer.borderWidth= 1.0f;
    txtDate.layer.cornerRadius=6;
    
    //Adding Date picker on Date of Birth TextField
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    [datePicker setMinimumDate:[NSDate date]];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(TextFieldStart:) forControlEvents:UIControlEventValueChanged];
    [txtDate setInputView:datePicker];
    
    UIToolbar *keyboardDoneButtonView = [[UIToolbar alloc] init];
    [keyboardDoneButtonView sizeToFit];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                   style:UIBarButtonItemStylePlain target:self
                                                                  action:@selector(doneClicked:)];
    [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:doneButton, nil]];
    txtDate.inputAccessoryView = keyboardDoneButtonView;
    txtEventName.inputAccessoryView = keyboardDoneButtonView;

}

- (void)doneClicked:(id)sender{
    [self.view endEditing:YES];
}

#pragma mark - Date Picker Action
-(void) TextFieldStart:(id)sender{
    UIDatePicker *picker = (UIDatePicker*)txtDate.inputView;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *eventDate = picker.date;
    [dateFormat setDateFormat:@"d,MMMM yyyy"];
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    txtDate.text = [NSString stringWithFormat:@"%@",dateString];
}

#pragma mark - Submit Button action
-(IBAction)SubmitBtn:(id)sender{
    
    if ([txtEventName.text isEqualToString:@""]) {
        
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Message"
                                      message:@"Please enter event name"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action){
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                             }];
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
    else if ([txtDate.text isEqualToString:@""])
    {
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Message"
                                      message:@"Please enter event date"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action){
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                             }];
        
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    else{
        [[ASCalendarEvent sharedInstance].arrDate addObject: txtDate.text];
        [[ASCalendarEvent sharedInstance].arrEvents addObject: txtEventName.text];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - Back Button Action
-(IBAction)BackBtnAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Handling Memory Warning

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
