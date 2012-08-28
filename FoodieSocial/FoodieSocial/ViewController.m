//
//  ViewController.m
//  FoodieSocial
//
//  Created by shaoxinjiang on 12-8-26.
//  Copyright (c) 2012年 shaoxinjiang. All rights reserved.
//

#import "ViewController.h"
#import "PhotoViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize m_menu;

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
        PhotoViewController *photoViewController = [[PhotoViewController alloc] initWithNibName:@"PhotoView" bundle:nil];
        [self.view addSubview:photoViewController.view];        
        
    } else if( actionSheet.title == @"Share to"){
        NSLog(@"ShareController");
    }
}

@end
