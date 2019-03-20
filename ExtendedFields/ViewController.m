//
//  ViewController.m
//  ExtendedFields
//
//  Created by Kanwarpal Singh on 17/06/16.
//  Copyright © 2016 Kanwarpal Singh. All rights reserved.
//

#import "ViewController.h"
#import "ExtendedPickerView.h"
#import "ExtendedTextField.h"
#import "Validate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)btnPressed:(id)sender{
    if ([self validate]) {
        NSLog(@"validation Passed");
    }
    
    //[self loginapi]
}

-(void)abcd{
   // [self forgotpwd]
    
}

-(void)getresponse:(NSDictionary *)response{
    if([response objectForKey:@""]){
        
    }
}

-(BOOL)validate{
    Validate *obj = [[Validate alloc]init];
    
    NSString *status = [obj validateField:txtField];
        
    if (status.length > 0){
        
        if ([status isEqualToString:@"Empty field"]){
            NSLog(@"Please provide Company Phone Number");
        }
        else if ([status isEqualToString:@"Short length text"]){
            NSLog(@"Please provide 10 digits for Company Phone Number");
        }
        
        return false;
    }
    
    return true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end