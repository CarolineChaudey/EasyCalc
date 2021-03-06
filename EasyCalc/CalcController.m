//
//  CalcController.m
//  EasyCalc
//
//  Created by Caroline Chaudey on 21/12/2016.
//  Copyright © 2016 esgi. All rights reserved.
//

#import "CalcController.h"

@interface CalcController ()

@end

@implementation CalcController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //self.operationColor = self.addition.backgroundColor;
    self.operation = @"+";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)touchDigit:(id)sender {
    NSString* digit = [(UIButton*) sender currentTitle];
    self.field.text = [self.field.text stringByAppendingString:digit];
}

- (IBAction)touchOperation:(id)sender {
    self.operation = [(UIButton*) sender currentTitle];
    self.field.text = [self.field.text stringByAppendingString:self.operation];
    [self disableOperations];
}

- (IBAction)touchCancel:(id)sender {
    self.field.text = @"";
    [self enableOperation];
}

- (IBAction)touchEqual:(id)sender {
    
    int result;
    NSArray* components = [self.field.text componentsSeparatedByString:self.operation];
    int firstNumber = [components[0] intValue];
    int secondNumber;
    
    
    // if the second number is not correct in some way
    if (([components count] < 2)
        || ([components[0]  isEqual: @""])
        || ([components[1]  isEqual: @""])
        || ([self.operation isEqual:@"/"] && [components[1] isEqual:@"0"])
        ) {
            self.field.text = @"";
            [self enableOperation];
    } else {
        secondNumber = [components[1] intValue];
        if ([self.operation  isEqual: @"+"]){
            result = firstNumber + secondNumber;
        } else if ([self.operation  isEqual: @"-"]) {
            result = firstNumber - secondNumber;
        } else if ([self.operation  isEqual: @"X"]) {
            result = firstNumber * secondNumber;
        } else if ([self.operation  isEqual: @"/"] && (secondNumber != 0)) {
            result = firstNumber / secondNumber;
        }
        
        self.field.text = [NSString stringWithFormat:@"%d", result];
        [self enableOperation];
    }
    
    
}

- (void)disableOperations {
    self.addition.enabled = NO;
    self.substraction.enabled = NO;
    self.multiplication.enabled = NO;
    self.division.enabled = NO;
    /*
    self.addition.backgroundColor = [UIColor grayColor];
    self.substraction.backgroundColor = [UIColor grayColor];
    self.multiplication.backgroundColor = [UIColor grayColor];
    self.division.backgroundColor = [UIColor grayColor];
     */
}

- (void)enableOperation {
    self.addition.enabled = YES;
    self.substraction.enabled = YES;
    self.multiplication.enabled = YES;
    self.division.enabled = YES;
    /*
    self.addition.backgroundColor = self.operationColor;
    self.substraction.backgroundColor = self.operationColor;
    self.multiplication.backgroundColor = self.operationColor;
    self.division.backgroundColor = self.operationColor;
     */
}

@end
