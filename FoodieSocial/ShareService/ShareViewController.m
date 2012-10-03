//
//  ShareViewController.m
//  FoodieSocial
//
//  Created by shaoxinjiang on 12-8-27.
//  Copyright (c) 2012年 shaoxinjiang. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController ()

@end

@implementation ShareViewController

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

- (IBAction)handleShareButtonAction: (id)sender
{
    // Create the item to share (in this example, a url)
	NSURL *url = [NSURL URLWithString:@"http://soleoshao.com"];
	SHKItem *item = [SHKItem URL:url title:@"FoodieSocial is Awesome!"];
    
	// Get the ShareKit action sheet
	SHKActionSheet *actionSheet = [SHKActionSheet actionSheetForItem:item];
    
	// Display the action sheet
    [actionSheet showInView:self.view];
	//[actionSheet showFromToolbar:self];
}
@end
