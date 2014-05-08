//
//  ALAiPadViewController.m
//  AudioList
//
//  Created by Jonathan Fox on 5/8/14.
//  Copyright (c) 2014 Jon Fox. All rights reserved.
//

#import "ALAiPadViewController.h"
#import "ALAiPadTVC.h"
#import "ALAData.h"
#import "ALATableViewCell.h"

@interface ALAiPadViewController () <UISplitViewControllerDelegate>

@end

@implementation ALAiPadViewController
{
    ALAiPadTVC * listVC;
    UIViewController * detailVC;
    UINavigationController * nc;
    UILabel * name;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        detailVC = [[UIViewController alloc]initWithNibName:nil bundle:nil];
        
        nc = [[UINavigationController alloc]initWithRootViewController:detailVC];
        
        listVC = [[ALAiPadTVC alloc]initWithStyle:UITableViewStylePlain];
        
        self.viewControllers = @[listVC, nc];
        
        self.presentsWithGesture = YES;
        
        self.delegate = self;
        
        self.view.backgroundColor = [UIColor orangeColor];
        
    }
    return self;
}

- (void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc
{
    barButtonItem.title = @"Button";
    detailVC.navigationItem.rightBarButtonItem = barButtonItem;
    detailVC.navigationController.navigationBarHidden = NO;
    nc.navigationBar.barTintColor = [UIColor purpleColor];
    
    NSLog(@"hide");
}

- (void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    NSLog(@"show");
    nc.navigationBarHidden = YES;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    name = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 200, 30)];
    name.textColor = [UIColor darkGrayColor];
    name.backgroundColor = [UIColor lightGrayColor];
    name.font = [UIFont systemFontOfSize: 20];
    
    
    [detailVC.view addSubview:name];
    
    
    
    // Do any additional setup after loading the view.
}

-(void)setIndex:(NSInteger)index
{
    _index = index;
    
    NSDictionary * albumInfo = [[ALAData MainData] allListItems][index];
    
    name.text = albumInfo[@"Album Name"];
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
