//
//  FirstViewController.m
//  Exercise 1-Creating a Custom NSNotification
//
//  Created by Erin Luu on 2016-11-13.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIStepper *stepper;

@end

@implementation FirstViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self stepperTapped:self.stepper];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)stepperTapped:(UIStepper *)sender {
    NSDictionary * stepperInfo = @{@"stepperValue": [[NSNumber alloc]initWithDouble:self.stepper.value]};
    NSLog(@"%@", stepperInfo[@"stepperValue"]);
    NSNotificationCenter * nc = [NSNotificationCenter defaultCenter];
    NSNotification * notice = [[NSNotification alloc] initWithName:@"stepperValueChanged" object:nil userInfo:stepperInfo];
    [nc postNotification:notice];
    
}

@end
