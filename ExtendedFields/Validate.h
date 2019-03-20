//
//  Validate.h
//  ExtendedFields
//
//  Created by Kanwarpal Singh on 22/06/16.
//  Copyright © 2016 Kanwarpal Singh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExtendedTextField.h"

@interface Validate : NSObject

-(NSString *)validateField:(ExtendedTextField *)txtField;
-(NSString *)validateEmailField:(ExtendedTextField *)txtField;

@end
