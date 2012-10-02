//
//  CameraViewController.h
//  FoodieSocial
//
//  Created by shaoxinjiang on 12-8-30.
//  Copyright (c) 2012年 shaoxinjiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OverlayViewControllerDelegate;

@interface CameraViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    id <OverlayViewControllerDelegate> delegate;
}

@property  (nonatomic, assign) id <OverlayViewControllerDelegate> delegate;
@property  (nonatomic, retain) UIImagePickerController *imagePickerController;

- (void)setupImagePicker:(UIImagePickerControllerSourceType)sourceType;

@end

@protocol OverlayViewControllerDelegate
- (void)didTakePicture:(UIImage *)picture;
- (void)didFinishWithCamera;
@end

