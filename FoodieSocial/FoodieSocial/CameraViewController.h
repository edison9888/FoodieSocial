//
//  CameraViewController.h
//  FoodieSocial
//
//  Created by shaoxinjiang on 12-8-30.
//  Copyright (c) 2012年 shaoxinjiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ConfirmCallback)(id sender, bool confirm);

@interface CameraViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (copy, nonatomic) ConfirmCallback confirmCallback;
@property (strong, readonly) UIImage* image;


- (IBAction)confirm:(id)sender;
- (IBAction)cancel:(id)sender;

@end



