//
//  Validate.m
//  ExtendedFields
//
//  Created by Kanwarpal Singh on 22/06/16.
//  Copyright © 2016 Kanwarpal Singh. All rights reserved.
//

#import "Validate.h"

@implementation Validate

-(NSString *)validateField:(ExtendedTextField *)txtField{
    if (txtField.text.length == 0){
        return (@"Empty field");
    }
    if (txtField.sizeLimit){
        if (txtField.minLength > txtField.text.length){
            return (@"Short length text");
        }
        if (txtField.maxLength < txtField.text.length){
            return (@"Long length text");
        }
    }
    
    return (@"");
}

-(NSString *)validateEmailField:(ExtendedTextField *)txtField{
    if (txtField.text.length == 0){
        return (@"Empty field");
    }
    
    NSString  *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];

    
    BOOL result = [emailTest evaluateWithObject:txtField.text];
    
    if (result){
        return(@"");
    }
    else{
        return(@"Invalid Email format");
    }
}

@end
