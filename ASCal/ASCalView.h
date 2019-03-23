//
//  ASView.h
//  ASCal
//
//  Created by Amit Saini on 4/13/17.
//  Copyright © 2017 Amit Saini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASCalendarEvent.h"
@protocol ASCalDelegates
@required

-(void)didSelectDate:(NSString *)str;

@end

@protocol ASCalendarDataSource <NSObject>

- (NSMutableArray *)eventDate:(NSString *)arrEvent andEventTitle:(NSString *)arrTitle;
@end

@interface ASCalView : UIView

@property (nonatomic, strong) UICollectionView *CVCal;
@property (nonatomic, strong) UITableView *tblEvent;

@property (nonatomic, strong) UIView *view;
@property (nonatomic, weak) id<ASCalDelegates> delegate;
@property (nonatomic, weak) id<ASCalendarDataSource> dataSource;
@property (nonatomic, strong) NSArray *events;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, retain) ASCalendarEvent *animalsData;


/* Reload calendar and events. */

-(void)fetchEvents;

@end
