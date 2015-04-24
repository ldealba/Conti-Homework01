//
// The MIT License (MIT)
//
// Copyright (c) 2013 Backelite
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "PopinTwoOptions.h"

#define nTextEmpty              0
#define nTextNoEmpty            1

#define nTxtStateMaxLenght      50
#define nTxtCapitalMaxLenght    50
#define nTxtPOMaxLenght         5
#define nTxtMaxPopulation       10

int     iKeyboardHeight;
int     iKeyboardWidth;

BOOL    boAllTxts       = nTextEmpty;
BOOL    boTxtState      = nTextEmpty;
BOOL    boTxtCapital    = nTextEmpty;
BOOL    boTxtPO         = nTextEmpty;
BOOL    boTxtPopulation = nTextEmpty;



@interface PopinTwoOptions ()
@end

@implementation PopinTwoOptions

//-------------------------------------------------------------------------------
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"PopinBuyTicket viewDidLoad");
}
//-------------------------------------------------------------------------------
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self initViewController];
}
/**********************************************************************************************
 Initialization
 **********************************************************************************************/
- (void) initViewController
{
    //Add a notification to let app know when the keyboard appears, so the texts move accordingly
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    
    
    self.vMain.layer.borderColor  = [UIColor clearColor].CGColor;
    self.vMain.layer.borderWidth  = 1.0;
    self.vMain.clipsToBounds      = YES;
    self.vMain.layer.cornerRadius = 8;

}
/**********************************************************************************************
 Keyboard appears and disappears
 **********************************************************************************************/
- (void)keyboardDidShow:(NSNotification *)notification
{
    NSLog(@"keyboardDidShow");
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    iKeyboardHeight     = MIN(keyboardSize.height,keyboardSize.width);
    iKeyboardWidth      = MAX(keyboardSize.height,keyboardSize.width);
    
    NSLog(@"height = %d, width  %d", iKeyboardHeight, iKeyboardWidth);
    
    if (self.txtState.isEditing)
    {
        self.svMain.contentSize = CGSizeMake(self.svMain.frame.size.width, self.svMain.frame.size.height + iKeyboardHeight/2  + 10);
        
        [self.svMain setContentOffset: CGPointMake(0, 124) animated:YES];
    }
    else
    {
        self.svMain.contentSize = CGSizeMake(self.svMain.frame.size.width, self.svMain.frame.size.height + iKeyboardHeight/2  + 10);
        
        [self.svMain setContentOffset: CGPointMake(0,iKeyboardHeight - (self.view.frame.size.height - self.vMain.frame.size.height)/2 + 10)  animated:YES];
    }
}
/**********************************************************************************************
 Text Fields
 **********************************************************************************************/
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    int x = (int)range.length;
    NSLog(@"x = %d", x);
    
    NSLog(@"Some text changed");
    if (textField == self.txtState)
    {
        NSLog(@"txtState");
        NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        if ([newString length] > nTextEmpty)
        {
            boTxtState      = nTextNoEmpty;
            self.txtState.backgroundColor = [UIColor lightGrayColor];
            if ([newString length] > nTxtStateMaxLenght)
            {
                return NO;
            }
        }
        else
        {
            boTxtState      = nTextEmpty;
        }
        return YES;
    }
    else if (textField == self.txtCapital)
    {
        NSLog(@"txtCapital");
        NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        if ([newString length] > nTextEmpty)
        {
            boTxtCapital      = nTextNoEmpty;
            self.txtCapital.backgroundColor = [UIColor lightGrayColor];
            if ([newString length] > nTxtCapitalMaxLenght)
            {
                return NO;
            }
        }
        else
        {
            boTxtCapital      = nTextEmpty;
        }
        return YES;
    }
    else if (textField == self.txtPO)
    {
        NSLog(@"txtState");
        NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        if ([newString length] > nTextEmpty)
        {
            boTxtPO         = nTextNoEmpty;
            self.txtPO.backgroundColor = [UIColor lightGrayColor];
            if ([newString length] > nTxtPOMaxLenght)
            {
                return NO;
            }
        }
        else
        {
            boTxtPO      = nTextEmpty;
        }
        return YES;
    }
    else if (textField == self.txtPopulation)
    {
        NSLog(@"txtState");
        NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        if ([newString length] > nTextEmpty)
        {
            boTxtPopulation     = nTextNoEmpty;
            self.txtPopulation.backgroundColor = [UIColor lightGrayColor];
            if ([newString length] > nTxtMaxPopulation)
            {
                return NO;
            }
        }
        else
        {
            boTxtPopulation      = nTextEmpty;
        }
        return YES;
    }
    return NO;
}
/**********************************************************************************************
 Buttons functions
 **********************************************************************************************/
- (IBAction)btnCancelPressed:(id)sender
{
    [self.presentingPopinViewController dismissCurrentPopinControllerAnimated:YES completion:nil];
}

- (IBAction)btnSavePressed:(id)sender
{
    if ((boTxtCapital == nTextEmpty) || (boTxtState == nTextEmpty) || (boTxtPO == nTextEmpty) || (boTxtPopulation == nTextEmpty) )
    {//At least one of the text is empty
        if (boTxtState == nTextEmpty)
        {
            self.txtState.backgroundColor = [UIColor redColor];
        }
        if (boTxtCapital == nTextEmpty)
        {
            self.txtCapital.backgroundColor = [UIColor redColor];
        }
        if (boTxtPO == nTextEmpty)
        {
            self.txtPO.backgroundColor = [UIColor redColor];
        }
        if (boTxtPopulation == nTextEmpty)
        {
            self.txtPopulation.backgroundColor = [UIColor redColor];
        }
    }
    else
    {//All text have info
        NSLog(@"Ready for saving");
        
        maStates        = [[NSMutableArray arrayWithArray:maStates] mutableCopy];
        [maStates addObject:self.txtState.text];
        
        maCapitals      = [[NSMutableArray arrayWithArray:maCapitals] mutableCopy];
        [maCapitals addObject:self.txtCapital.text];
        
        maPO            = [[NSMutableArray arrayWithArray:maPO] mutableCopy];
        [maPO addObject:self.txtPO.text];
        
        maPopulation    = [[NSMutableArray arrayWithArray:maPopulation] mutableCopy];
        [maPopulation addObject:self.txtPopulation.text];
        
        [mUserDefaults setObject: maStates forKey: @"permStates"];
        [mUserDefaults setObject: maCapitals forKey: @"permCapitals"];
        [mUserDefaults setObject: maPO forKey: @"permPOs"];
        [mUserDefaults setObject: maPopulation forKey: @"permPopulation"];
        
        NSLog(@"permStates = %@", [mUserDefaults objectForKey:@"permStates"]);
        NSLog(@"permCapitals = %@", [mUserDefaults objectForKey:@"permCapitals"]);
        NSLog(@"permPOs = %@", [mUserDefaults objectForKey:@"permPOs"]);
        NSLog(@"permPOs = %@", [mUserDefaults objectForKey:@"permPopulation"]);
        
        [self.presentingPopinViewController dismissCurrentPopinControllerAnimated:YES completion:nil];
    }
    
}










@end
