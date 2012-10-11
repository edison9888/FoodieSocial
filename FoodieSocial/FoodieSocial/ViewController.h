//
//  ViewController.h
//  FoodieSocial
//
//  Created by shaoxinjiang on 12-8-26.
//  Copyright (c) 2012年 shaoxinjiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    int m_menu;
}
@property (assign) int m_menu;

- (IBAction)testsharecontroller:(id)sender;
- (IBAction)testphotocontroller:(id)sender;
- (IBAction)testcameracontroller:(id)sender;
- (BOOL) startCameraControllerFromViewController: (UIViewController*) controller
                                   usingDelegate: (id <UIImagePickerControllerDelegate,
                                                   UINavigationControllerDelegate>) delegate;
- (BOOL) startMediaBrowserFromViewController: (UIViewController*) controller
                               usingDelegate: (id <UIImagePickerControllerDelegate,
                                               UINavigationControllerDelegate>) delegate;
- (IBAction)pushedTheButton:(id)sender;
- (IBAction)takePhoto:(id)sender;
- (IBAction)choosePhotoSrc:(id)sender;
- (IBAction)chooseShareSrc:(id)sender;
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;
@end
