//
//  SecondViewController.m
//  UINavigationControllerDemo
//
//  Created by linshengqin on 13-5-26.
//  Copyright (c) 2013年 linshengqin. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

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
    // Do any additional setup after loading the view from its nib.
    
    NSArray *array = [NSArray arrayWithObjects:@"鸡翅",@"排骨", nil];
    UISegmentedControl *segmentedController = [[UISegmentedControl alloc] initWithItems:array];
    segmentedController.segmentedControlStyle = UISegmentedControlSegmentCenter;
    
    [segmentedController addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = segmentedController;
    
    
    
    [self.navigationController  setToolbarHidden:YES animated:YES];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(gotoThridView:)];
    toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0, self.view.frame.size.height - toolBar.frame.size.height - 44.0, self.view.frame.size.width, 44.0)];
    [toolBar setBarStyle:UIBarStyleDefault];
    toolBar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [toolBar setItems:[NSArray arrayWithObject:addButton]];
    [self.view addSubview:toolBar];
    
    // Do any additional setup after loading the view from its nib.
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)segmentAction:(id)sender
{
    switch ([sender selectedSegmentIndex]) {
        case 0:
        {
            UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示" message:@"你点击了鸡翅" delegate:self  cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alter show];
            
        }
            break;
        case 1:
        {
            UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示" message:@"你点击了排骨" delegate:self  cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alter show];
        }
            break;
            
        default:
            break;
    }
}

-(void)gotoThridView:(id)sender
{
    ThirdViewController *thirdView = [[ThirdViewController alloc] init];
    [self.navigationController pushViewController:thirdView animated:YES];
    thirdView.title = @"Thrid View";
    
}

@end
