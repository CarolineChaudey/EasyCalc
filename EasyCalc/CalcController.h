//
//  CalcController.h
//  EasyCalc
//
//  Created by Caroline Chaudey on 21/12/2016.
//  Copyright © 2016 esgi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalcController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *field;
@property (weak, nonatomic) IBOutlet UIButton *addition;
@property (weak, nonatomic) IBOutlet UIButton *substraction;
@property (weak, nonatomic) IBOutlet UIButton *division;
@property (weak, nonatomic) IBOutlet UIButton *multiplication;
@property (weak, nonatomic) NSString* operation;
@property (weak, nonatomic) UIColor* operationColor;

@end
