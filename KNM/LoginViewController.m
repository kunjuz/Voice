//
//  LoginViewController.m
//  KNM
//
//  Created by Cybraum on 6/20/16.
//  Copyright © 2016 Cybraum. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize unameText,paswText,unameBgimage,scrollView;
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIColor *color=[UIColor whiteColor];
    unameText.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Username" attributes:@{NSForegroundColorAttributeName: color}];
    paswText.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: color}];
 self.navigationController.navigationBarHidden=YES;
    
    if([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone)
    {
        CGSize result=[[UIScreen mainScreen]bounds].size;
        if(result.height==667)
        {
            scrollView.frame=CGRectMake(0, 180, self.view.frame.size.width, 250);
        }
        if(result.height==736)
        {
           scrollView.frame=CGRectMake(0, 200, self.view.frame.size.width, 250);
        }
    }

    
    // Do any additional setup after loading the view from its nib.
}
#pragma mark- UITextField Delegates

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    scrollView.contentOffset=CGPointMake(0, 0);
    [textField resignFirstResponder];
    return YES;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone)
    {
        CGSize result=[[UIScreen mainScreen]bounds].size;
        if(result.height==480)
        {
            
            if(textField==unameText)
            {
               scrollView.contentOffset=CGPointMake(0, 10);
            }
            if(textField==paswText)
            {
                scrollView.contentOffset=CGPointMake(0, 20);
            }
        }
    }
}

#pragma mark-

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
