//
//  ExtendedPickerView.h
//  ExtendedFields
//
//  Created by Kanwarpal Singh on 17/06/16.
//  Copyright © 2016 Kanwarpal Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ExtendedPickerViewDelegate;


@interface ExtendedPickerView : UIView

// A refrence holder for ExtendedPickerViewDelegate delagets
@property(nonatomic,weak) id <ExtendedPickerViewDelegate> extendedDelegate;

@end

@protocol ExtendedPickerViewDelegate

-(void)getresponse:(NSDictionary *)response;


-(void)extendedPickerViewDidValueSelected:(NSMutableArray *)selectedValues picker:(ExtendedPickerView *)pickerView;
-(void)extendedPickerViewDidCancel:(ExtendedPickerView *)pickerView;

@end