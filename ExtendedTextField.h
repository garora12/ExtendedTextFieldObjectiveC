//
//  ExtendedTextField.h
//  ExtendedFields
//
//  Created by Kanwarpal Singh on 17/06/16.
//  Copyright © 2016 Kanwarpal Singh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExtendedPickerView.h"
#import "ExtendedDatePickerView.h"

@protocol TextFieldCustomDelegate;

IB_DESIGNABLE

@interface ExtendedTextField : UITextField<UITextFieldDelegate>

// A refrence holder for TextFieldCustomDelegate delagets
@property(nonatomic,weak) id <TextFieldCustomDelegate> extendedDelegate;
// defines if there is any limit for text filed
@property (nonatomic) IBInspectable BOOL sizeLimit;

// defines the maximum character limit for text field
@property (nonatomic) IBInspectable int maxLength;

// defines the minimum requcired character limit for text field
@property (nonatomic) IBInspectable int minLength;

// a refrence to define whether field is phone field, defult is false
@property (nonatomic) IBInspectable BOOL phone;

// define whether to enable phone number formatting like 123-456-7890
@property (nonatomic) IBInspectable BOOL formatPhone;

// a refrence to define whether field will open picker on tap
@property (nonatomic) IBInspectable BOOL pickerType;

// a refrence to define whether field will open date picker on tap
@property (nonatomic) IBInspectable BOOL datePickerType;

// defines the characters that can be entered in text field
@property (nonatomic,retain) IBInspectable NSString *allowedCharacters;

// defines all the characters can be entered in text field
@property (nonatomic) IBInspectable BOOL allowAllCharacters;

// defines the color to set to text field when validation failed
@property (nonatomic,retain) IBInspectable UIColor *highlightColor;

// defines the left padding for text in text field
@property (nonatomic) IBInspectable float leftPadding;

// defines the right padding for text in text field
@property (nonatomic) IBInspectable float rightPadding;

// defines the top padding for text in text field
@property (nonatomic) IBInspectable float topPadding;

// defines the bottom padding for text in text field
@property (nonatomic) IBInspectable float bottomPadding;

// defines the text field placeholder color
@property (nonatomic,retain) IBInspectable UIColor *placeholderColor;

// defines the text field border color
@property (nonatomic,retain) IBInspectable UIColor *borderColor;

// defines the text field border width
@property (nonatomic) IBInspectable CGFloat borderWidth;

// defines the text field corner radius
@property (nonatomic) IBInspectable CGFloat cornerRadius;

@end



@protocol TextFieldCustomDelegate

// cutom delegate methods that can be implemented view controller that conform to protocol

// Called when text field get focus
-(void)didBegin:(UITextField *)currentTextField;
// Called when text field leave focus
-(void)didEnd:(UITextField *)currentTextField;
// Called when text field returnd key is pressed
-(void)returnKey:(UITextField *)currentTextField;

@end