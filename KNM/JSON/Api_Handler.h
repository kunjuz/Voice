//
//  Api_Handler.h
//  Etsdc
//
//  Created by Cybraum on 4/20/16.
//  Copyright © 2016 Cybraum. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Api_Handler : UIViewController
{
    
}
-(NSArray *) setRequestWithRequestArray:(NSArray *)inputArray;
-(NSArray *)getCourseDetail;
-(NSArray *)getSpecificCourcedetail:(NSString *)courseId;
-(NSArray *)getGalleryCategory;
-(NSArray *)getImagesByAlbumID:(NSString *)albumid;
-(NSArray *)getLibraryDetails;
-(NSArray *)getVideoDetails;
-(NSArray *)getBanners;
-(NSArray *)getNotification;
-(NSArray *)getWeekCourse;
-(NSArray *)getCourseBy:(NSString *)userid;
@end
