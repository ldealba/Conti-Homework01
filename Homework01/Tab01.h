//
//  Tab01.h
//  Homework01
//
//  Created by Walter Gonzalez Domenzain on 23/04/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+MaryPopin.h"
#import "PopinTwoOptions.h"

@interface Tab01 : UIViewController<UITableViewDelegate, UITableViewDataSource>

//Tables
@property (strong, nonatomic) IBOutlet UITableView *tblStates;

//Actions
- (IBAction)btnAddPressed:(id)sender;


@end
