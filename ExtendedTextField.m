//
//  ExtendedTextField.m
//  ExtendedFields
//
//  Created by Kanwarpal Singh on 17/06/16.
//  Copyright © 2016 Kanwarpal Singh. All rights reserved.
//

#import "ExtendedTextField.h"
#import "AppDelegate.h"

@implementation ExtendedTextField

- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (id)initWithFrame:(CGRect)theFrame {
    self = [super initWithFrame:theFrame];
    if (self) {
        
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
    if (self) {
        self.delegate = (id)self;
    }
    return self;
}

- (void) setPlaceholderColor:(UIColor *)newColor {
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:@"Some Text" attributes:@{ NSForegroundColorAttributeName : newColor }];
    self.attributedPlaceholder = str;
}

- (void) setCornerRadius:(CGFloat)radius {
    self.layer.cornerRadius = radius;
}

- (void) setBorderColor:(UIColor *)newColor {
    self.layer.borderColor = newColor.CGColor;
}

- (void) setBorderWidth:(CGFloat)width {
    self.layer.borderWidth = width;
}

#pragma mark UITextField Delegates

-(UIViewController *)rootView{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    return appDelegate.window.rootViewController;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (self.datePickerType || self.pickerType) {
        if (self.datePickerType){
            ExtendedPickerView *pickerView          =   [[ExtendedPickerView alloc] init];
            
            UIViewController *currentRootView       =   [self rootView];
            pickerView.extendedDelegate             =   (id)currentRootView;
            // pickerView.showPickerOnViewWithOptions(self.options, onView: currentRootView, forField: self)
        }
        else{
            ExtendedDatePickerView *datePickerView  =   [[ExtendedDatePickerView alloc] init];
            UIViewController *currentRootView       =   [self rootView];
            datePickerView.extendedDelegate         =   (id)currentRootView;
            //datePickerView.showDatePickerOnViewWithOptions(rootView(), forField: self)
        }
        return false;
    }
    return true;
}

- (BOOL)textField:(ExtendedTextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if(string.length == 0){
        return true;
    }
    if(self.phone){
        return [self processPhoneFieldValidation:range replacementString:string];
    }
    else{
        return [self processOtherFieldValidation:range replacementString:string];
    }
    return true;
}


-(BOOL)processPhoneFieldValidation:(NSRange)range replacementString:(NSString *)string{
    if (self.formatPhone){
        self.maxLength = 12;
        if (self.maxLength < (self.text.length + 1)){
            return false;
        }
    }
    else{
        self.maxLength = 10;
        if (self.maxLength < (self.text.length + 1)){
            return false;
        }
    }
    
    NSCharacterSet * allowedCharSet = [NSCharacterSet decimalDigitCharacterSet] ;
    
    NSCharacterSet *invertedValidCharSet = [allowedCharSet invertedSet];
    
    if ([string rangeOfCharacterFromSet:invertedValidCharSet].location != NSNotFound) {
        return NO;
    }
    else{
        NSString *newString = [self.text stringByReplacingCharactersInRange:range withString:string];
        NSArray *components = [newString componentsSeparatedByCharactersInSet:invertedValidCharSet];
        
        NSString *decimalString = [components componentsJoinedByString:@""];
        NSUInteger length = decimalString.length;
        
        int index = 0;
        
        NSMutableString *formattedString = [NSMutableString string];
        
        BOOL hasLeadingOne = length > 0 && [decimalString characterAtIndex:0] == 1;

        if (hasLeadingOne)
        {
            [formattedString appendString:@"1 "];
            index += 1;
        }
        if ((length - index) > 3)
        {
            NSString *areaCode = [decimalString substringWithRange:NSMakeRange(index, 3)];
            [formattedString appendFormat:@"%@-", areaCode];
            index += 3;
        }
        if (length - index > 3)
        {
            NSString *prefix = [decimalString substringWithRange:NSMakeRange(index, 3)];
            [formattedString appendFormat:@"%@-", prefix];
            index += 3;
        }
        
        NSString *remainder = [decimalString substringFromIndex:index];
        
        [formattedString appendString:remainder];
        
        self.text = formattedString;
        
        return false;
    }
}

-(BOOL)processOtherFieldValidation:(NSRange)range replacementString:(NSString *)string{
    if (self.allowAllCharacters) {
        return true;
    }
    
    NSCharacterSet * allowedCharSet = [NSCharacterSet characterSetWithCharactersInString:self.allowedCharacters] ;

    NSCharacterSet *invertedValidCharSet = [allowedCharSet invertedSet];
    
    if ([string rangeOfCharacterFromSet:invertedValidCharSet].location != NSNotFound) {
        return NO;
    }
    
    if(self.sizeLimit){
        NSUInteger newLength = [self.text length] + [string length] - range.length;
        return newLength <= self.maxLength;
    }
    return YES;
}

//MARK: Text field custom delegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [self.extendedDelegate didBegin:textField];
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    [self.extendedDelegate didEnd:textField];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.extendedDelegate returnKey:textField];
    [textField resignFirstResponder];
    return true;
}

//MARK : set padding
- (CGRect)textRectForBounds:(CGRect)bounds {
    return [self rectForBounds:bounds];
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    return [self rectForBounds:bounds];
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds {
    return [self rectForBounds:bounds];
}

//here 40 - is your x offset
- (CGRect)rectForBounds:(CGRect)bounds {
    
    UIEdgeInsets titleInsets = UIEdgeInsetsMake(self.topPadding, self.leftPadding, self.bottomPadding, self.rightPadding);

    CGRect newBounds        =   bounds;
    newBounds.origin.x      +=  titleInsets.left;
    newBounds.origin.y      +=  titleInsets.top;
    newBounds.size.height   -=  titleInsets.top + titleInsets.bottom;
    newBounds.size.width    -=  titleInsets.left + titleInsets.right;
    return newBounds;
}

@end
