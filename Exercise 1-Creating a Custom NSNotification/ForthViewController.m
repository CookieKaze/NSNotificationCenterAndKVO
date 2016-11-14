//
//  ForthViewController.m
//  Exercise 1-Creating a Custom NSNotification
//
//  Created by Erin Luu on 2016-11-13.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import "ForthViewController.h"
#import "ForthView.h"

@interface ForthViewController ()
@property (weak, nonatomic) IBOutlet ForthView *trackPadView;
@property (weak, nonatomic) IBOutlet UIView *redSquare;

@end

@implementation ForthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addObserver:self.trackPadView forKeyPath:@"point" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
