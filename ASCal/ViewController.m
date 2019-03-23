//
//  ViewController.m
//  ASCal
//
//  Created by Amit Saini on 4/13/17.
//  Copyright © 2017 Amit Saini. All rights reserved.
//

#import "ViewController.h"
#import "ASCalView.h"
#import "ASCalendarEvent.h"
#import "AddEventVC.h"
@interface ViewController ()<ASCalDelegates>

{
    ASCalView *cal;
    IBOutlet UILabel *lblDate;
}
@property (nonatomic, strong) NSMutableDictionary *data;

@end

@implementation ViewController
@synthesize animalsData;

#pragma mark - View LifeCycle
- (void)viewDidLoad {
    //
    self.data = [[NSMutableDictionary alloc] init];
    
    cal = [[ASCalView alloc]initWithFrame:CGRectMake(0,60, 200, 200)];
    cal.delegate=self;
    [self.view addSubview:cal];

    [super viewDidLoad];
}
-(void)viewWillAppear:(BOOL)animated{
    [cal fetchEvents];
}

#pragma mark -  Add Event Action
-(IBAction)AddEvent:(id)sender{
    AddEventVC *controller=[self.storyboard  instantiateViewControllerWithIdentifier:@"AddEventVC"];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - ASCal Delegates
-(void)didSelectDate:(NSString *)stringDate{
    NSLog(@"Your Selected date is= %@",stringDate);
    lblDate.text=stringDate;
}

#pragma mark - Handling Memory Warning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
