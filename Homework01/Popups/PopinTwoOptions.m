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

int     iKeyboardHeight;
int     iKeyboardWidth;

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
    
    self.svMain.contentSize = CGSizeMake(self.svMain.frame.size.width, self.svMain.frame.size.height + iKeyboardHeight  + 10);
    
    [self.svMain setContentOffset: CGPointMake(0,iKeyboardHeight - (self.view.frame.size.height - self.vMain.frame.size.height)/2 + 10)  animated:YES];
    
    
    

    
    
    

    
    /*if (self.txtState.isEditing)
    {
        self.svProfile.contentSize = CGSizeMake(self.svProfile.frame.size.width, self.svProfile.frame.size.height + iKeyboardHeight - (self.view.frame.size.height-self.svProfile.frame.size.height)/2 + 10);
        [self.svProfile setContentOffset: CGPointMake(0,iKeyboardHeight - (self.view.frame.size.height-self.vProfile.frame.size.height)/2 + 10)  animated:YES];
    }
    else
    {
        self.svProfile.contentSize = CGSizeMake(self.svProfile.frame.size.width, self.svProfile.frame.size.height + iKeyboardHeight - (self.view.frame.size.height-self.vProfile.frame.size.height)/2 + 10);
        [self.svProfile setContentOffset: CGPointMake(0,184)  animated:YES];
    }*/
    
    
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
}










@end
