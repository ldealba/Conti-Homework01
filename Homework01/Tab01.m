//
//  Tab01.m
//  Homework01
//
//  Created by Walter Gonzalez Domenzain on 23/04/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "Tab01.h"
#import "Tab01_Selected.h"
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
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(Tab01Active:)
                                                 name:UIApplicationDidBecomeActiveNotification object:nil];
    
    mUserDefaults   = [NSUserDefaults standardUserDefaults];
    
    
    if (!(nil == [mUserDefaults objectForKey:@"permStates"]) && !([@"" isEqual:[mUserDefaults objectForKey:@"permStates"]]))
    {//Case when varaibel has some value in permanent phone memory
        maStates    = [mUserDefaults objectForKey:@"permStates"];
    }
    else
    {//No info has been stored before
        maStates        = [NSMutableArray arrayWithObjects: nInitialStates];
    }
//-----------------------------------------
    if (!(nil == [mUserDefaults objectForKey:@"permCapitals"]) && !([@"" isEqual:[mUserDefaults objectForKey:@"permCapitals"]]))
    {//Case when varaibel has some value in permanent phone memory
        maCapitals    = [mUserDefaults objectForKey:@"permCapitals"];
    }
    else
    {//No info has been stored before
        maCapitals        = [NSMutableArray arrayWithObjects: nInitialsCapitals];
    }
//-----------------------------------------
    if (!(nil == [mUserDefaults objectForKey:@"permPOs"]) && !([@"" isEqual:[mUserDefaults objectForKey:@"permPOs"]]))
    {//Case when varaibel has some value in permanent phone memory
        maPO    = [mUserDefaults objectForKey:@"permPOs"];
    }
    else
    {//No info has been stored before
        maPO        = [NSMutableArray arrayWithObjects: nInitialsPOs];
    }
//-----------------------------------------
    if (!(nil == [mUserDefaults objectForKey:@"permPopulation"]) && !([@"" isEqual:[mUserDefaults objectForKey:@"permPopulation"]]))
    {//Case when varaibel has some value in permanent phone memory
        maPopulation    = [mUserDefaults objectForKey:@"permPopulation"];
    }
    else
    {//No info has been stored before
        maPopulation    = [NSMutableArray arrayWithObjects: nInitialsPopulation];
    }
//-----------------------------------------
    [self.tblStates reloadData];
}
- (void)Tab01Active:(NSNotification *)notification
{
    NSLog(@"Tab01Active");
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
    cell.lblPopulation.text = maPopulation[indexPath.row];
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Row = %d", (int)indexPath.row);
    miIndex     = (int)indexPath.row;
    
    Tab01_Selected *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Tab01_Selected"];
    [self presentViewController:viewController animated:YES completion:nil];
}

//-------------------------------------------------------------------------------
/*- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath");
    Tab01Details *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Tab01Details"];
    //[self.navigationController pushViewController:viewController animated:YES];
    [self presentViewController:viewController animated:YES completion:nil];
}*/

/*
 YourViewControllerClass *viewController = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewController"];
 */
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
