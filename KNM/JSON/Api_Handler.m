//
//  Api_Handler.m
//  Etsdc
//
//  Created by Cybraum on 4/20/16.
//  Copyright © 2016 Cybraum. All rights reserved.
//

#import "Api_Handler.h"
#import "JSON.h"

@implementation Api_Handler

#define Api_Link @"http://meridian.net.in/demo/etsdc/response.php?fid="

-(NSArray *) setRequestWithRequestArray:(NSArray *)inputArray
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:inputArray
                                                       options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    NSString *post = [NSString stringWithFormat:@"requestArray=%@", jsonString];
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:NO];
    
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://localhost/test/index.php"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    NSURLResponse *response;
    NSError *errors = nil;
    
    NSData *POSTReply = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:POSTReply options:0 error:&errors];
    
    NSLog(@"request %@", request);
    NSLog(@"jsonArray%@",jsonArray);
    
    return jsonArray;
}


-(NSArray *)getCourseDetail
{
      // http://meridian.net.in/demo/etsdc/
    
    NSString *urlString=[NSString stringWithFormat:@"%@3",Api_Link];
    //@"http://meridianinc.biz.cp-30.webhostbox.net/etsdc/response.php?fid=3";
   	urlString = [urlString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    urlString = [urlString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSURL *url = [NSURL URLWithString:urlString];
    NSString *json = [[NSString alloc]init];
    json=[NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSArray *courseListArray  = [json JSONValue] ;
    // NSLog(@"%@",courseListArray);
    return courseListArray;
}
-(NSArray *)getSpecificCourcedetail:(NSString *)courseId
{
   
     NSString *urlString=[NSString stringWithFormat:@"%@8&category_id=%@",Api_Link,courseId];
                         //@"http://meridianinc.biz.cp-30.webhostbox.net/etsdc/response.php?fid=8&category_id=%@",courseId];
   	urlString = [urlString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    urlString = [urlString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSURL *url = [NSURL URLWithString:urlString];
    NSString *json = [[NSString alloc]init];
    json=[NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSArray *courseListArray  = [json JSONValue] ;
    // NSLog(@"%@",courseListArray);
    return courseListArray;
}
-(NSArray *)getImagesByAlbumID:(NSString *)albumid
{
    
    NSString *urlString=[NSString stringWithFormat:@"%@5&album_id=%@",Api_Link,albumid];
                         //@"http://meridianinc.biz.cp-30.webhostbox.net/etsdc/response.php?fid=5&album_id=%@",albumid];
    
    NSLog(@"%@",urlString);
    urlString = [urlString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    urlString = [urlString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSURL *url = [NSURL URLWithString:urlString];
    NSString *json = [[NSString alloc]init];
    json=[NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSArray *imageArray  = [json JSONValue] ;
    return imageArray;
}
-(NSArray *)getGalleryCategory
{
    
    NSString *urlString=[NSString stringWithFormat:@"%@4",Api_Link];
//http://meridianinc.biz.cp-30.webhostbox.net/etsdc/response.php?fid=4";
    
    urlString = [urlString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    urlString = [urlString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSString *json = [[NSString alloc]init];
    
    json=[NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    
    NSArray *imageArray  = [json JSONValue] ;
    
   // NSLog(@"%@",imageArray);
    
    return imageArray;
}
-(NSArray *)getLibraryDetails
{
    NSString *urlString=[NSString stringWithFormat:@"%@10",Api_Link];
//http://meridianinc.biz.cp-30.webhostbox.net/etsdc//response.php?fid=10";
   	urlString = [urlString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    urlString = [urlString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSURL *url = [NSURL URLWithString:urlString];
    NSString *json = [[NSString alloc]init];
    json=[NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSArray *libraryArray  = [json JSONValue] ;
    // NSLog(@"%@",libraryArray);
    return libraryArray;
}

-(NSArray *)getVideoDetails
{
    NSString *urlString=[NSString stringWithFormat:@"%@12",Api_Link];
    //@"http://meridianinc.biz.cp-30.webhostbox.net/etsdc/response.php?fid=12";
   	urlString = [urlString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    urlString = [urlString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSURL *url = [NSURL URLWithString:urlString];
    NSString *json = [[NSString alloc]init];
    json=[NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSArray *videoArray  = [json JSONValue] ;
    return videoArray;
}
-(NSArray *)getBanners
{
    NSString *urlString=[NSString stringWithFormat:@"%@14",Api_Link];
    //@"http://meridianinc.biz.cp-30.webhostbox.net/etsdc/response.php?fid=14";
   	urlString = [urlString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    urlString = [urlString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSURL *url = [NSURL URLWithString:urlString];
    NSString *json = [[NSString alloc]init];
    json=[NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSArray *BannerArray  = [json JSONValue] ;
    return BannerArray;
}
-(NSArray *)getNotification
{
    NSString *urlString=[NSString stringWithFormat:@"%@15",Api_Link];
    //@"http://meridianinc.biz.cp-30.webhostbox.net/etsdc/response.php?fid=15";
   	urlString = [urlString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    urlString = [urlString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSURL *url = [NSURL URLWithString:urlString];
    NSString *json = [[NSString alloc]init];
    json=[NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSArray *notifArray  = [json JSONValue] ;
    return notifArray;
}
-(NSArray *)getWeekCourse
{
    NSString *urlString=[NSString stringWithFormat:@"%@16",Api_Link];
    //@"http://meridianinc.biz.cp-30.webhostbox.net/etsdc/response.php?fid=16";
   	urlString = [urlString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    urlString = [urlString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSURL *url = [NSURL URLWithString:urlString];
    NSString *json = [[NSString alloc]init];
    json=[NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSArray *courseArray  = [json JSONValue] ;
    return courseArray;
}
-(NSArray *)getCourseBy:(NSString *)userid
{
    NSString *urlString=[NSString stringWithFormat:@"%@18&userid=%@",Api_Link,userid];
                         //@"http://meridianinc.biz.cp-30.webhostbox.net/etsdc/response.php?fid=18&userid=%@",userid];
   	urlString = [urlString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    urlString = [urlString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSURL *url = [NSURL URLWithString:urlString];
    NSString *json = [[NSString alloc]init];
    json=[NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSArray *courseArray  = [json JSONValue] ;
    NSLog(@"%@",courseArray);
    return courseArray;
}

@end
