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
@property NSDictionary * userInfo;
@end

@implementation SecondViewController



-(void) viewWillAppear:(BOOL)animated {
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(increaseCounter:) name:@"stepperValueChanged" object:nil];
    self.counterLabel.text = [NSString stringWithFormat:@"%@", self.userInfo[@"stepperValue"]];
}

-(void) increaseCounter: (NSNotification *) notice {
    self.userInfo = notice.userInfo;
    self.counterLabel.text = [NSString stringWithFormat:@"%@", self.userInfo[@"stepperValue"]];
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"stepperValueChanged" object:nil];
}

@end
