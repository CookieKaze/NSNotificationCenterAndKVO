//
//  SecondViewController.m
//  Exercise 1-Creating a Custom NSNotification
//
//  Created by Erin Luu on 2016-11-13.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *counterLabel;
@property NSNotification * noticeMessage;
@end

@implementation SecondViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getCounterValue:) name:@"stepperValueChanged" object:nil];
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated {
    [self increaseCounter];
}

-(void) getCounterValue: (NSNotification *) notice {
    self.noticeMessage = notice;
    [self increaseCounter];
}

-(void) increaseCounter {
    self.counterLabel.text = [NSString stringWithFormat:@"%@", self.noticeMessage.userInfo[@"stepperValue"]];
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"stepperValueChanged" object:nil];
}

@end
