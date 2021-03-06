//
//  HelloWorldLayer.h
//  CocosToy
//
//  Created by Naren Hazareesingh on 5/2/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayerColor
{
    CCSprite *planet1;
    CCSprite *planet2;
    CCSprite *planet3;
    float angle;
    BOOL going;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
-(void)orbit;
@end
