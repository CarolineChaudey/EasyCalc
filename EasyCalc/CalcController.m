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


- (IBAction)touchDigit:(id)sender {
    NSString* digit = [(UIButton*) sender currentTitle];
    self.field.text = [self.field.text stringByAppendingString:digit];
}

- (IBAction)touchOperation:(id)sender {
    self.operation = [(UIButton*) sender currentTitle];
    self.field.text = [self.field.text stringByAppendingString:self.operation];
}

- (IBAction)touchCancel:(id)sender {
    self.field.text = @"";
}

- (IBAction)touchEqual:(id)sender {
    
    NSArray* components = [self.field.text componentsSeparatedByString:self.operation];
    int firstNumber = [components[0] intValue];
    int secondNumber = [components[1] intValue];
    int result;
    
    if ([self.operation  isEqual: @"+"]){
        result = firstNumber + secondNumber;
    } else if ([self.operation  isEqual: @"-"]) {
        result = firstNumber - secondNumber;
    } else if ([self.operation  isEqual: @"X"]) {
        result = firstNumber * secondNumber;
    } else if ([self.operation  isEqual: @"/"]) {
        result = firstNumber / secondNumber;
    }
    self.field.text = [NSString stringWithFormat:@"%d", result];
        
}

@end
