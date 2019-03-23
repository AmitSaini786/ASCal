//
//  ASCalendarEvent.h
//  ASCal
//
//  Created by Amit Saini on 5/2/17.
//  Copyright © 2017 Amit Saini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ASCalendarEvent : NSObject
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *idString;
@property (nonatomic, strong) NSDictionary *info;
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) NSMutableArray *arrDate;
@property (nonatomic, strong) NSMutableArray *arrEvents;

+ (ASCalendarEvent *)sharedInstance;


+(ASCalendarEvent *)eventWithTitle:(NSString *)title andID:(NSString *)IDString andDate:(NSString *)date andInfo:(NSDictionary *)info;


@end
