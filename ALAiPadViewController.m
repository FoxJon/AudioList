//
//  ALAiPadViewController.m
//  AudioList
//
//  Created by Jonathan Fox on 5/8/14.
//  Copyright (c) 2014 Jon Fox. All rights reserved.
//

#import "ALAiPadViewController.h"
#import "ALASoundCloudRequest.h"
#import "ALAiPadTableViewController.h"


@interface ALAiPadViewController () <UISplitViewControllerDelegate>

@end

@implementation ALAiPadViewController
{
    ALAiPadTableViewController * listVC;
    UIViewController * detailVC;
    UINavigationController * nc;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        detailVC = [[UIViewController alloc]initWithNibName:nil bundle:nil];
        
        nc = [[UINavigationController alloc]initWithRootViewController:detailVC];
        
        // listVC: tab bar at bottom with tracks & playlists buttons. playlist will push in.
        
        listVC = [[ALAiPadTableViewController alloc]initWithStyle:UITableViewStylePlain];
        
        self.viewControllers = @[listVC, nc];
        
        self.presentsWithGesture = YES;
        
        self.delegate = self;
        
        [ALASoundCloudRequest updateData];
    }
    return self;
}

- (void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc
{
    barButtonItem.title = @"Button";
    detailVC.navigationItem.rightBarButtonItem = barButtonItem;
    nc.navigationController.navigationBarHidden = NO;
    nc.navigationBar.barTintColor = [UIColor purpleColor];
    
}

- (void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    nc.navigationBarHidden = YES;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(BOOL)prefersStatusBarHidden {return YES;}

@end
