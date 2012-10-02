//
//  PhotoViewController.h
//  FoodieSocial
//
//  Created by shaoxinjiang on 12-8-27.
//  Copyright (c) 2012年 shaoxinjiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property  (nonatomic, retain) UIImagePickerController *imagePickerController;

- (void)setupImagePicker:(UIImagePickerControllerSourceType)sourceType;
- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo;
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker;
@end
