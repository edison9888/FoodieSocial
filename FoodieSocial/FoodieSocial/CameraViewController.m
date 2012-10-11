//
//  CameraViewController.m
//  FoodieSocial
//
//  Created by shaoxinjiang on 12-8-30.
//  Copyright (c) 2012年 shaoxinjiang. All rights reserved.
//

#import "CameraViewController.h"

#import <MobileCoreServices/UTCoreTypes.h>
@interface CameraViewController ()

@property (strong, readwrite) UIImage* image;

@end

@implementation CameraViewController

@synthesize confirmCallback = confirmCallback;
@synthesize imageView = _imageView;
@synthesize image = _image;


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
    [self.imageView setImage:self.image];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.imageView = nil;
    self.image = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)confirm:(id)sender{
    if(self.confirmCallback){
        self.confirmCallback(self,true);
    }
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)cancel:(id)sender{
    if(self.confirmCallback){
        self.confirmCallback(self, false);
    }
    [self.navigationController popViewControllerAnimated:true];
}

@end
