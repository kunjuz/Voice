//
//  FirstViewController.m
//  KNM
//
//  Created by Cybraum on 6/20/16.
//  Copyright © 2016 Cybraum. All rights reserved.
//

#import "FirstViewController.h"
#import "LoginViewController.h"
#import "JSON.h"
#import "Api_Handler.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    // Do any additional setup after loading the view from its nib.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)GoTap:(id)sender
{

    inputDic = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"lijin@gmail.com",@"user_login",@"12345",@"user_pass",@"LijinKunju",@"user_name",@"lijin@gmail.com",@"email",@"1234556677",@"phone_no",@"99479889577",@"mobile", nil];
        NSArray *inputArray = [[NSArray alloc]initWithObjects:inputDic, nil];
        NSLog(@"Input Array %@",inputArray);
    
//    NSString *str=@"lijin@gmial.com";
//    NSString *uname=@"LIJI";
//    NSString*pass=@"1234565";
//    NSString*phn=@"87765654457";
//    NSString*email=@"lijin@gmail.com";
//    NSString*mobi=@"3356782866";
//    
//    NSString *myRequestString = [NSString stringWithFormat:@"user_login=%@&user_pass=%@&user_name=%@&email=%@&phone_no=%@&mobile=%@",str,pass,uname,email,phn,mobi];
//    
//    // Create Data from request
//    NSData *myRequestData = [NSData dataWithBytes: [myRequestString UTF8String] length: [myRequestString length]];
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString: @" http://www.voiceofislam.in.php56-10.dfw3-2.websitetestlink.com/register.php"]];
//    // set Request Type
//    [request setHTTPMethod: @"POST"];
//    // Set content-type
//    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
//    // Set Request Body
//    [request setHTTPBody: myRequestData];
//    // Now send a request and get Response
//    NSData *returnData = [NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil];
//    // Log Response
//    NSString *response = [[NSString alloc] initWithBytes:[returnData bytes] length:[returnData length] encoding:NSUTF8StringEncoding];
//    NSLog(@"%@",response);
    
    
//        NSString *str=@"raji@gmial.com";
//        NSString *uname=@"rajeesh";
//        NSString*pass=@"kunju";
//        NSString*phn=@"123456789";
//        NSString*email=@"kunju@gmail.com";
//        NSString*mobi=@"123456";
//         NSString *post =[NSString stringWithFormat:@"user_login=%@&user_pass=%@&user_name=%@&email=%@&phone_no=%@&mobile=%@",str,pass,uname,email,phn,mobi];
//        NSLog(@"%@",post);
//        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
//        NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
//        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
//        [request setURL:[NSURL URLWithString:@"http://www.voiceofislam.in.php56-10.dfw3-2.websitetestlink.com/register.php"]];
//        [request setHTTPMethod:@"POST"];
//        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
//        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//        [request setHTTPBody:postData];
    
        //    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        //    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
        //    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        //    [request setURL:[NSURL URLWithString:@"http://www.voiceofislam.in.php56-10.dfw3-2.websitetestlink.com/register.php"]];
        //    [request setHTTPMethod:@"POST"];
        //    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        //    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        //  [request setHTTPBody:postData];
        
        
//        NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
//        if(conn) {
//            NSLog(@"Connection Successful");
//        } else {
//            NSLog(@"Connection could not be made");
//        }
//    
    
            Api_Handler *helper = [[Api_Handler alloc]init];
            NSArray *responseDic = [helper setRequestWithRequestArray:inputArray];
            NSLog(@"%@",responseDic);
    
        //    LoginViewController *loginView=[[LoginViewController alloc]init];
        //    [self.navigationController pushViewController:loginView animated:NO];
    }
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
        
        NSLog(@"%@",response);
        responseData = [[NSMutableData alloc] init];
        [responseData setLength:0];
        
    }
    - (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
        
        [responseData appendData:data];
        
    }
    - (NSCachedURLResponse *)connection:(NSURLConnection *)connection
willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
        
        // display error alert
        
        responseData = nil;
        NSLog(@"Error");
    }
    - (void)connectionDidFinishLoading:(NSURLConnection *)connection
    {
        
        NSString *responseString = [[NSString alloc] initWithData:responseData encoding: NSUTF8StringEncoding];
        NSArray *dictionary = [responseString JSONValue];
        NSLog(@"Dictionary value is  %@", responseString);
        NSArray *succesvalue=[dictionary valueForKey:@"status"];
        
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
