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
@property (nonatomic, strong) LGCalcModel* calcModel;
@end

@implementation LGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.calcModel = [LGCalcModel new];
}


- (IBAction)numberButtonTouchUpInside:(UIButton *)sender {
    if (!self.userIsCreatingNumber) {
        self.userIsCreatingNumber = YES;
        self.displayLabel.text = @"";
    }
    self.displayLabel.text = [self.displayLabel.text stringByAppendingString:sender.titleLabel.text];
}

- (IBAction)decimalPointButtonTouchUpInside:(UIButton *)sender {
    NSRange range = [self.displayLabel.text rangeOfString:@"."];
    if (range.location == NSNotFound) {
        self.displayLabel.text = [self.displayLabel.text stringByAppendingString:@"."];
        self.userIsCreatingNumber = YES;
    }

}

- (IBAction)SolutionButtonTouchUpInside:(UIButton *)sender {
}

- (IBAction)operationButtonTouchUpInside:(UIButton *)sender {

    NSString *operation = sender.titleLabel.text;

    if (self.calcModel.stack_double == 0.0) {
        self.calcModel.stack_double = [self.displayLabel.text doubleValue];
        self.calcModel.operator = operation;
        self.displayLabel.text = @"0";
    } else {
        double result = [self.calcModel performOperation:operation withDouble:[self.displayLabel.text doubleValue]];
        self.displayLabel.text = [NSString stringWithFormat:@"%g", result];
    }

    self.userIsCreatingNumber = NO;
}

- (IBAction)allClearButtonTouchUpInside:(UIButton *)sender {
    self.displayLabel.text = @"0";
    self.calcModel.stack_double = 0.0;
    self.calcModel.operator = @"";
    self.userIsCreatingNumber = NO;
}

- (IBAction)signButtonTouchUpInside:(UIButton *)sender {

}


@end
