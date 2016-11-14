//
//  ThirdViewController.m
//  Exercise 1-Creating a Custom NSNotification
//
//  Created by Erin Luu on 2016-11-13.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController () 
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIView *whiteView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;
@property CGFloat originalConstaint;


@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardAppears:) name: UIKeyboardDidChangeFrameNotification object:nil];
    self.originalConstaint = self.bottomConstraint.constant;
}

-(void) keyboardAppears: (NSNotification *) notice{
    NSValue * valueEnd = notice.userInfo[UIKeyboardFrameEndUserInfoKey];
    NSValue * valueStart = notice.userInfo[UIKeyboardFrameBeginUserInfoKey];
    CGFloat keyboardStart = valueStart.CGRectValue.origin.y;
    CGFloat keyboardEnd = valueEnd.CGRectValue.origin.y;
    

    if (keyboardEnd == self.view.bounds.size.height) {
        self.bottomConstraint.constant = self.originalConstaint;
    }else {
        self.bottomConstraint.constant = keyboardStart - keyboardEnd;
    }
}

- (IBAction)viewTapped:(UITapGestureRecognizer *)sender {
    [self.textField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
