//
//  Tab01-Selected.h
//  Homework01
//
//  Created by Walter Gonzalez Domenzain on 24/04/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>

@interface Tab01_Selected : UIViewController


//Labels
@property (strong, nonatomic) IBOutlet UILabel *lblState;
@property (strong, nonatomic) IBOutlet UILabel *lblCapital;
@property (strong, nonatomic) IBOutlet UILabel *lblPO;
@property (strong, nonatomic) IBOutlet UILabel *lblPopultion;

//Actions
- (IBAction)btnBackPressed:(id)sender;
- (IBAction)btnSharePressed:(id)sender;

@end
