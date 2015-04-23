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
}
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
    return 64;
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
    
    return cell;
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
