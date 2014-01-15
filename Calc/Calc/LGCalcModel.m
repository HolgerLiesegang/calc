//
//  LGCalcModel.m
//  Calc
//
//  Created by Holger Liesegang on 14.01.14.
//  Copyright (c) 2014 Holger Liesegang. All rights reserved.
//

#import "LGCalcModel.h"

@implementation LGCalcModel


- (id)init
{
    self = [super init];
    if (self) {
        self.stackDouble = 0.0;
        self.stackOperator = @"";
    }

    return self;
}

- (double) performOperationWithNumber: (double) number_double {
    double result = 0.0;

    if ([self.stackOperator isEqualToString:@"+"]) {
        result = self.stackDouble + number_double;
    } else if ([self.stackOperator isEqualToString:@"-"]) {
        result = self.stackDouble - number_double;
    } else if ([self.stackOperator isEqualToString:@"*"]) {
        result = self.stackDouble * number_double;
    } else if ([self.stackOperator isEqualToString:@"/"]) {
        result = self.stackDouble / number_double;
    }
    self.stackDouble = result;
    return result;
};

@end
