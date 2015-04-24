//
//  Tab01.m
//  Homework01
//
//  Created by Walter Gonzalez Domenzain on 23/04/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "Tab01.h"
#import "cellStates.h"
#import "Declarations.h"

@interface Tab01 ()

@end

@implementation Tab01

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
}
//-----------------------------------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-----------------------------------------
- (void)initController
{
    maStates    = [NSMutableArray arrayWithObjects: nInitialStates];
    maCapitals  = [NSMutableArray arrayWithObjects: nInitialsCapitals];
    maPO        = [NSMutableArray arrayWithObjects: nInitialsPOs];
}
/******************************************************************************
 Table functions
******************************************************************************/
//-----------------------------------------
//Table functions
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return maStates.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nCellStatesHeight;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cellStates");
    static NSString *CellIdentifier = @"cellStates";
    
    cellStates *cell = (cellStates *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[cellStates alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.lblState.text      = maStates[indexPath.row];
    cell.lblCapital.text    = maCapitals[indexPath.row];
    cell.lblPO.text         = maPO[indexPath.row];
    return cell;
}
/******************************************************************************
 Button functions
 ******************************************************************************/
- (IBAction)btnAddPressed:(id)sender
{
    [self.tblStates reloadData];
    [self createPopin];
}
/**********************************************************************************************
 Popin View Controller
 **********************************************************************************************/
- (void) createPopin
{//-------------------------------------------------------------------------------
    PopinTwoOptions *popin = [[PopinTwoOptions alloc] init];
    [popin setPopinTransitionStyle:BKTPopinTransitionStyleZoom];
    [popin setPopinTransitionDirection:BKTPopinTransitionDirectionTop];
    [popin setPopinAlignment:0];
    
    BKTBlurParameters *blurParameters       = [BKTBlurParameters new];
    blurParameters.alpha                    = 1.0f;
    blurParameters.radius                   = 8.0f;
    blurParameters.saturationDeltaFactor    = 1.8f;
    blurParameters.tintColor                = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:0.50];
    [popin setBlurParameters:blurParameters];
    [popin setPopinOptions:[popin popinOptions]|BKTPopinBlurryDimmingView];
    [popin setPreferedPopinContentSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height)];
    [popin setPopinTransitionDirection:BKTPopinTransitionDirectionTop];
    [self presentPopinController:popin animated:YES completion:nil];
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
