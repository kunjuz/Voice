//
//  FirstViewController.h
//  KNM
//
//  Created by Cybraum on 6/20/16.
//  Copyright © 2016 Cybraum. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController
{
    NSMutableData *responseData;
    NSMutableDictionary *inputDic;
}
-(IBAction)GoTap:(id)sender;
@end
