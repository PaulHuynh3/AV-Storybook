//
//  Page.m
//  AV Storybook
//
//  Created by Paul on 2017-09-22.
//  Copyright © 2017 Paul. All rights reserved.
//

#import "Page.h"

@implementation Page

- (instancetype)initWithTitle:(NSString *)title andImage:(NSString *)image
{
    self = [super init];
    if (self) {
        _title = title;
        _image = [UIImage imageNamed:image];
    }
    return self;
}



@end
