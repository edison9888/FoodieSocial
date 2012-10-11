//
//  PhotoViewController.m
//  FoodieSocial
//
//  Created by shaoxinjiang on 12-8-27.
//  Copyright (c) 2012年 shaoxinjiang. All rights reserved.
//

#import "PhotoViewController.h"
#import <MobileCoreServices/UTCoreTypes.h>
@interface PhotoViewController ()

@property (nonatomic, retain) IBOutlet UIImageView *imageView;

// toolbar buttons
- (IBAction)photoLibraryAction:(id)sender;

@end

@implementation PhotoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.imagePickerController = [[UIImagePickerController alloc] init];
        self.imagePickerController.delegate = self;
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

- (void)setupImagePicker:(UIImagePickerControllerSourceType)sourceType
{
    self.imagePickerController.sourceType = sourceType;
}
@end
@implementation PhotoViewController (CameraDelegateMethods)

- (void) imagePickerController: (UIImagePickerController *) picker
didFinishPickingMediaWithInfo: (NSDictionary *) info {
    
    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    UIImage *originalImage, *editedImage, *imageToUse;
    
    // Handle a still image picked from a photo album
    if (CFStringCompare ((CFStringRef) mediaType, kUTTypeImage, 0)
        == kCFCompareEqualTo) {
        
        editedImage = (UIImage *) [info objectForKey:
                                   UIImagePickerControllerEditedImage];
        originalImage = (UIImage *) [info objectForKey:
                                     UIImagePickerControllerOriginalImage];
        
        if (editedImage) {
            imageToUse = editedImage;
        } else {
            imageToUse = originalImage;
        }
        // Do something with imageToUse
    }
    
    // Handle a movied picked from a photo album
    if (CFStringCompare ((CFStringRef) mediaType, kUTTypeMovie, 0)
        == kCFCompareEqualTo) {
        
        NSString *moviePath = [[info objectForKey:
                                UIImagePickerControllerMediaURL] path];
        
        // Do something with the picked movie available at moviePath
    }
    
    [[picker parentViewController] dismissModalViewControllerAnimated: YES];
    //[picker release];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [[picker parentViewController] dismissModalViewControllerAnimated: YES];
}
@end