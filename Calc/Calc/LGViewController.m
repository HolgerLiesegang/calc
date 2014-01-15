//
//  LGViewController.m
//  Calc
//
//  Created by Holger Liesegang on 13.01.14.
//  Copyright (c) 2014 Holger Liesegang. All rights reserved.
//

#import "LGViewController.h"

@interface LGViewController ()
@property (strong, nonatomic) IBOutlet UILabel *displayLabel;
@property BOOL userIsCreatingNumber;
@property BOOL lockOperatorButtons;
@property (nonatomic, strong) LGCalcModel* calcModel;
@end

@implementation LGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.calcModel = [LGCalcModel new];
}

#pragma mark Button "." pressed
- (IBAction)decimalPointButtonTouchUpInside:(UIButton *)sender
{
    if (!self.userIsCreatingNumber) {
        self.userIsCreatingNumber = YES;
        self.displayLabel.text = @"0";
    }
    NSRange range = [self.displayLabel.text rangeOfString:@"."];
    if (range.location == NSNotFound) {
        self.displayLabel.text = [self.displayLabel.text stringByAppendingString:@"."];
        self.userIsCreatingNumber = YES;
    }
    self.lockOperatorButtons = NO;
}

#pragma mark Button "=" pressed
- (IBAction)SolutionButtonTouchUpInside:(UIButton *)sender
{
    if (self.calcModel.stackDouble != 0.0 && self.lockOperatorButtons == NO) {
        double result = [self.calcModel performOperationWithNumber:[self.displayLabel.text doubleValue]];
        self.displayLabel.text = [NSString stringWithFormat:@"%g", result];
        self.calcModel.stackOperator = @"";
        self.calcModel.stackDouble = 0.0;
        self.userIsCreatingNumber = NO;
        self.lockOperatorButtons = NO;
    }
}

#pragma mark Buttons "+-*/" pressed
- (IBAction)operationButtonTouchUpInside:(UIButton *)sender
{
    NSString *operation = sender.titleLabel.text;
    if (self.lockOperatorButtons == NO) {
        if (self.calcModel.stackDouble == 0.0) {
            self.calcModel.stackDouble = [self.displayLabel.text doubleValue];
        } else {
            double result = [self.calcModel performOperationWithNumber: [self.displayLabel.text doubleValue]];
            self.displayLabel.text = [NSString stringWithFormat:@"%g", result];
        }
        self.lockOperatorButtons = YES;
        self.userIsCreatingNumber = NO;
    }
    self.calcModel.stackOperator = operation;
}

#pragma mark Buttons "0-9" pressed
- (IBAction)numberButtonTouchUpInside:(UIButton *)sender
{
    NSString *keyNumber = sender.titleLabel.text;
    if (!self.userIsCreatingNumber) {
        self.userIsCreatingNumber = YES;
        self.displayLabel.text = @"";
        }
    self.displayLabel.text = [self.displayLabel.text stringByAppendingString:keyNumber];
    if ([self.displayLabel.text isEqualToString:@"00"]) {
        self.displayLabel.text = self.displayLabel.text = @"0";
        self.userIsCreatingNumber = NO;
    }
    self.lockOperatorButtons = NO;
}

#pragma mark Buttons "+/-" pressed
- (IBAction)signButtonTouchUpInside:(UIButton *)sender
{
    double a = [self.displayLabel.text doubleValue];
    double new = 0.0;
    if (a >= 0.0) {
        new = - a;
    } else {
        new = -1 * a;
    }
    self.displayLabel.text = [NSString stringWithFormat:@"%g", new];
    self.calcModel.stackDouble = 0.0;
    self.lockOperatorButtons = NO;
}

#pragma mark Buttons "AC" pressed
- (IBAction)allClearButtonTouchUpInside:(UIButton *)sender
{
    self.displayLabel.text = @"0";
    self.calcModel.stackDouble = 0.0;
    self.calcModel.stackOperator = @"";
    self.userIsCreatingNumber = NO;
    self.lockOperatorButtons = NO;
}

@end
