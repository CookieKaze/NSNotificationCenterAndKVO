//
//  ForthView.m
//  Exercise 1-Creating a Custom NSNotification
//
//  Created by Erin Luu on 2016-11-13.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import "ForthView.h"

@implementation ForthView

- (IBAction)pannGesture:(UIPanGestureRecognizer *)sender {
    self.point = [sender translationInView:self];
}

- (void) addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context {
    
}

@end
