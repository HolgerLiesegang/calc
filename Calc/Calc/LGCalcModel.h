//
//  LGCalcModel.h
//  Calc
//
//  Created by Holger Liesegang on 14.01.14.
//  Copyright (c) 2014 Holger Liesegang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LGCalcModel : NSObject

@property double stack_double;
@property (nonatomic, strong) NSString* operator;


- (double) performOperation: (NSString*) pressedOperator withDouble: (double) number_double;

@end
