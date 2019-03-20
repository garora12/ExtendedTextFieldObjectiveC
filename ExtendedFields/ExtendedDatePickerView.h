//
//  ExtendedDatePickerView.h
//  ExtendedFields
//
//  Created by Kanwarpal Singh on 17/06/16.
//  Copyright © 2016 Kanwarpal Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ExtendedDatePickerViewDelegate;

@interface ExtendedDatePickerView : UIView

// A refrence holder for ExtendedPickerViewDelegate delagets
@property(nonatomic,weak) id <ExtendedDatePickerViewDelegate> extendedDelegate;

@end

@protocol ExtendedDatePickerViewDelegate

-(void)extendedDatePickerViewDidValueSelected:(NSDate *)selectedDate picker:(ExtendedDatePickerView *)datePickerView;
-(void)extendedDatePickerViewDidCancel:(ExtendedDatePickerView *)datePickerView;

@end
