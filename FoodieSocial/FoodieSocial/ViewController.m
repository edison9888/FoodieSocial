//
//  ViewController.m
//  FoodieSocial
//
//  Created by shaoxinjiang on 12-8-26.
//  Copyright (c) 2012年 shaoxinjiang. All rights reserved.
//
#import <MobileCoreServices/UTCoreTypes.h>
#import "ViewController.h"
#import "PhotoViewController.h"
#import "CameraViewController.h"
#import "ShareViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize m_menu;

// test shareviewcontroller
- (IBAction)testsharecontroller:(id)sender
{
    // Create the item to share (in this example, a url)
	NSURL *url = [NSURL URLWithString:@"http://soleoshao.com"];
	SHKItem *item = [SHKItem URL:url title:@"FoodieSocial is Awesome!"];
    
	// Get the ShareKit action sheet
	SHKActionSheet *actionSheet = [SHKActionSheet actionSheetForItem:item];
    
    
	// Display the action sheet
    [actionSheet showInView:self.view];
}
- (IBAction)testphotocontroller:(id)sender
{
    
    UIStoryboard *storyboard = self.storyboard;
    id pvc = [storyboard instantiateViewControllerWithIdentifier:@"PhotoViewController"];
    [self startMediaBrowserFromViewController: self
                                usingDelegate: self];
    // Configure the new view controller here.
    
   // [self presentViewController:pvc animated:YES completion:nil];
}
- (IBAction)testcameracontroller:(id)sender
{
    [self startCameraControllerFromViewController: self
                                    usingDelegate: self];
    

}
- (BOOL) startCameraControllerFromViewController: (UIViewController*) controller
                                   usingDelegate: (id <UIImagePickerControllerDelegate,
                                                   UINavigationControllerDelegate>) delegate {
    
    if (([UIImagePickerController isSourceTypeAvailable:
          UIImagePickerControllerSourceTypeCamera] == NO)
        || (delegate == nil)
        || (controller == nil))
        return NO;
    
    
    UIImagePickerController *cameraUI = [[UIImagePickerController alloc] init];
    cameraUI.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    // Displays a control that allows the user to choose picture or
    // movie capture, if both are available:
    cameraUI.mediaTypes =
    [[NSArray alloc] initWithObjects: (NSString *)kUTTypeImage, nil];
    //[UIImagePickerController availableMediaTypesForSourceType:
    // UIImagePickerControllerSourceTypeCamera];
    
    // Hides the controls for moving & scaling pictures, or for
    // trimming movies. To instead show the controls, use YES.
    cameraUI.allowsEditing = NO;
    
    cameraUI.delegate = delegate;
    
    [controller presentModalViewController: cameraUI animated: YES];
    return YES;
}

- (BOOL) startMediaBrowserFromViewController: (UIViewController*) controller
                               usingDelegate: (id <UIImagePickerControllerDelegate,
                                               UINavigationControllerDelegate>) delegate {
    
    if (([UIImagePickerController isSourceTypeAvailable:
          UIImagePickerControllerSourceTypeSavedPhotosAlbum] == NO)
        || (delegate == nil)
        || (controller == nil))
        return NO;
    
    UIImagePickerController *mediaUI = [[UIImagePickerController alloc] init];
    mediaUI.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    // Displays saved pictures and movies, if both are available, from the
    // Camera Roll album.
    mediaUI.mediaTypes =
    [[NSArray alloc] initWithObjects: (NSString *) kUTTypeImage, nil];
    //[UIImagePickerController availableMediaTypesForSourceType:
    // UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    
    // Hides the controls for moving & scaling pictures, or for
    // trimming movies. To instead show the controls, use YES.
    mediaUI.allowsEditing = NO;
    
    mediaUI.delegate = delegate;
    
    [controller presentModalViewController: mediaUI animated: YES];
    return YES;
}

- (IBAction)pushedTheButton:(id)sender
{
    
    m_menu ++;
    NSLog(@"Menu: %d",m_menu);
}

- (IBAction)choosePhotoSrc:(id)sender
{
    UIActionSheet *actionSheet=[[UIActionSheet alloc] initWithTitle:@"From" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles: nil];
    // Test Photo Choose Menu
    [actionSheet addButtonWithTitle:@"Camera"];
    [actionSheet addButtonWithTitle:@"Photo Library"];
    [actionSheet addButtonWithTitle:@"Cancel"];
    
    [actionSheet setCancelButtonIndex:actionSheet.numberOfButtons-1];
    [actionSheet showInView:self.view];
//    [actionSheet release];
}

- (IBAction)chooseShareSrc:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Share to" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil, nil];
    // Test Sharing Choose Menu
    [actionSheet addButtonWithTitle:@"Facebook"];
    [actionSheet addButtonWithTitle:@"Twitter"];
    [actionSheet addButtonWithTitle:@"Renren"];
    [actionSheet addButtonWithTitle:@"Weibo"];
    [actionSheet addButtonWithTitle:@"Cancel"];
    
    [actionSheet setCancelButtonIndex:actionSheet.numberOfButtons-1];
    [actionSheet showInView:self.view];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark UIActionSheetDelegate methods
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //NSLog(@"actionsheet: %@ , buttonIndex: %d", actionSheet, buttonIndex);
    if (actionSheet.title == @"From") {
        NSLog(@"PhotoViewController");
        //PhotoViewController *photoViewController = [[PhotoViewController alloc]init];
        UIStoryboard *storyboard = self.storyboard;
        if(buttonIndex == 0){
            CameraViewController *cameraViewController = [storyboard instantiateViewControllerWithIdentifier:@"CameraViewController"];
            // configure the new view controller explicitly here
            
            [self presentViewController:cameraViewController animated:YES completion:nil];
        }else if(buttonIndex == 1){
            PhotoViewController *photoViewController = [storyboard instantiateViewControllerWithIdentifier:@"PhotoViewController"];
            
            //[photoViewController.overlayViewController setupImagePicker:sourceType];
            //[self presentModalViewController:self.overlayViewController.imagePickerController animated:YES];
            // configure the new view controller explicitly here
            [self presentViewController:photoViewController animated:YES completion:nil];
        }
            
        
    } else if( actionSheet.title == @"Share to"){
        NSLog(@"ShareController");
    }
}
@end

@implementation ViewController (CameraDelegateMethods)
// For responding to the user tapping Cancel.
- (void) imagePickerControllerDidCancel: (UIImagePickerController *) picker {
    
    [[picker parentViewController] dismissModalViewControllerAnimated: YES];
    //[picker release];
}

// For responding to the user accepting a newly-captured picture or movie
- (void) imagePickerController: (UIImagePickerController *) picker
 didFinishPickingMediaWithInfo: (NSDictionary *) info {
    
    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    UIImage *originalImage, *editedImage, *imageToSave;
    
    // Handle a still image capture
    if (CFStringCompare ((CFStringRef) mediaType, kUTTypeImage, 0)
        == kCFCompareEqualTo) {
        
        editedImage = (UIImage *) [info objectForKey:
                                   UIImagePickerControllerEditedImage];
        originalImage = (UIImage *) [info objectForKey:
                                     UIImagePickerControllerOriginalImage];
        
        if (editedImage) {
            imageToSave = editedImage;
        } else {
            imageToSave = originalImage;
        }
        
        // Save the new image (original or edited) to the Camera Roll
        UIImageWriteToSavedPhotosAlbum (imageToSave, nil, nil , nil);
        
    }
    
    // Handle a movie capture
    if (CFStringCompare ((CFStringRef) mediaType, kUTTypeMovie, 0)
        == kCFCompareEqualTo) {
        
        NSString *moviePath = [[info objectForKey:
                                UIImagePickerControllerMediaURL] path];
        
        if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum (moviePath)) {
            UISaveVideoAtPathToSavedPhotosAlbum (
                                                 moviePath, nil, nil, nil);
        }
    }
    
    [[picker parentViewController] dismissModalViewControllerAnimated: YES];
    //[picker release];
}

@end


