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
    [self.trackPadView addObserver:self forKeyPath:@"point" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:NULL];
}

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"point"]) {
        float newX = self.redSquare.center.x + self.trackPadView.point.x * 0.25;
        float newY = self.redSquare.center.y + self.trackPadView.point.y * 0.25;
        CGPoint newPoint = CGPointMake(newX, newY);
        self.redSquare.center = newPoint;
    }
}

@end
