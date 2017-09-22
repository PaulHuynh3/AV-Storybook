//
//  Page.h
//  AV Storybook
//
//  Created by Paul on 2017-09-22.
//  Copyright © 2017 Paul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface Page : NSObject

@property (nonatomic)UIImage* image;
@property (nonatomic)NSString* title;




-(instancetype)initWithTitle:(NSString*)title andImage:(NSString*)image;



/*
 1. Create a model class to store the data for a given page. Think about what properties it will need.
 
 2. Create the capture view controller. This will have the image view, the audio recording, and the playback button. It will fill in the model object using this data.
 
 3. Add pagination to the app.
 */



@end
