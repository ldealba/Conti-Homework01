//
//  Tab01-Selected.m
//  Homework01
//
//  Created by Walter Gonzalez Domenzain on 24/04/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "Tab01_Selected.h"
#import "Declarations.h"

@interface Tab01_Selected ()

@end

@implementation Tab01_Selected

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initController
{
    self.lblState.text      = maStates[miIndex];
    self.lblCapital.text    = maCapitals[miIndex];
    self.lblPO.text         = maPO[miIndex];
    self.lblPopultion.text  = maPopulation[miIndex];
}

- (IBAction)btnBackPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnSharePressed:(id)sender
{
    NSString                    *stMsg;
    NSArray                     *aItems;
    UIImage                     *imgShare;
    UIActivityViewController    *aVC;
    
    imgShare    = [UIImage imageNamed:@"Continental_logo.jpg"];
    stMsg       = @"Hola desde mi curso de iOS en Continental";
    
    aItems      = @[imgShare, stMsg];
    
    aVC         = [[UIActivityViewController alloc] initWithActivityItems:aItems applicationActivities:nil];
    
    aVC.excludedActivityTypes = [NSArray arrayWithObjects:UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypeAirDrop, nil];
    
    [self presentViewController:aVC animated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
