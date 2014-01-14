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
        self.stack_double = 0.0;
        self.operator = @"";
    }

    return self;
}



- (double) performOperation: (NSString*) pressedOperator withDouble: (double) number_double {
    if ([self.operator isEqualToString:@"+"]) {
        self.stack_double = self.stack_double + number_double;
    } else if ([self.operator isEqualToString:@"-"]) {
        self.stack_double = self.stack_double - number_double;
    } else if ([self.operator isEqualToString:@"*"]) {
        self.stack_double = self.stack_double * number_double;
    } else if ([self.operator isEqualToString:@"/"]) {
        self.stack_double = self.stack_double / number_double;
    }
    self.operator = pressedOperator;
    return self.stack_double;
};

@end
