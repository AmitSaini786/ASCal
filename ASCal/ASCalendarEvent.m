//
//  ASCalendarEvent.m
//  ASCal
//
//  Created by Amit Saini on 5/2/17.
//  Copyright © 2017 Amit Saini. All rights reserved.
//

#import "ASCalendarEvent.h"

@implementation ASCalendarEvent
@synthesize date,arrDate,arrEvents;


-(id)init {
    self = [super init];
    if (self != nil) {
        // initialize stuff here
        self.arrDate=[[NSMutableArray alloc]init];
        self.arrEvents=[[NSMutableArray alloc]init];

    }
    
    return self;
}
+(ASCalendarEvent *)sharedInstance{

    static ASCalendarEvent *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        sharedInstance=[ASCalendarEvent new];
    });
    return sharedInstance;
}

+(ASCalendarEvent *)eventWithTitle:(NSString *)title andID:(NSString *)IDString andDate:(NSString *)date andInfo:(NSDictionary *)info{
    ASCalendarEvent *event = [ASCalendarEvent new];
    [event setTitle:title];
    [event setIdString:IDString];
    [event setDate:date];
    [event setInfo:info];
    return event;
}

@end
