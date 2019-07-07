//
// Created by ZengPu on 2019-07-07.
// Copyright (c) 2019 Zi Mu. All rights reserved.
//

#import "EventsViewCell.h"


@implementation EventsViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat cellW = self.frame.size.width;
        CGFloat imgW = 100;
        CGFloat imgH = 100;
        CGFloat imgTop = 0;

        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake((cellW - imgW) / 2,
                imgTop, imgW, imgH)];

        [self addSubview:self.imageView];
    }
    return self;
}

@end
