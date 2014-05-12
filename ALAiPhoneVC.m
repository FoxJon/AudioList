//
//  ALAViewController.m
//  AudioList
//
//  Created by Jonathan Fox on 5/8/14.
//  Copyright (c) 2014 Jon Fox. All rights reserved.
//

#import "ALAiPhoneVC.h"
#import "ALAData.h"

@interface ALAiPhoneVC ()

@end

@implementation ALAiPhoneVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor orangeColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel * name = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 200, 30)];
    name.textColor = [UIColor darkGrayColor];
    name.backgroundColor = [UIColor lightGrayColor];
    name.font = [UIFont systemFontOfSize: 20];
    name.text = @"Album Name";
    
    [self.view addSubview:name];
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

@end
