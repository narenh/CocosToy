//
//  HelloWorldLayer.m
//  CocosToy
//
//  Created by Naren Hazareesingh on 5/2/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super initWithColor:ccc4(180, 180, 255, 255)])) {
        self.isTouchEnabled = YES;

		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Click to Orbit" fontName:@"Helvetica" fontSize:20];
        planet1 = [CCSprite spriteWithFile:@"Planet1.png" rect:CGRectMake(0, 0, 500, 500)];
        planet2 = [CCSprite spriteWithFile:@"Planet2.png" rect:CGRectMake(0, 0, 500, 500)];
        planet3 = [CCSprite spriteWithFile:@"Planet3.png" rect:CGRectMake(0, 0, 500, 500)];

		// ask director the the window size
		//CGSize size = [[CCDirector sharedDirector] winSize];
	
		// position the label on the center of the screen
		label.position =  ccp( 70 , 300 );
		planet1.position = ccp(300, 100);
        planet2.position = ccp(250, 140);
        planet3.position = ccp(200, 200);
        
        planet1.scale = .2;
        planet2.scale = .4;
        planet3.scale = .3;
        
		// add the label as a child to this Layer
		[self addChild:label];
        [self addChild:planet1];
        [self addChild:planet2];
        [self addChild:planet3];
	}

	return self;

}
- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (going) {
        [self unschedule:@selector(orbit)];
        going = NO;
    }
    else {
        [self schedule:@selector(orbit) interval:.01];
        going = YES;
    }
}
-(void)orbit{
    float radius1 = 100;
    float radius2 = 150;
    float radius3 = 180;
    angle += M_PI/180;
    CGPoint newPos1 = CGPointMake(cos(angle)*radius1+300, sin(angle)*radius1+100);
    CGPoint newPos2 = CGPointMake(sin(angle)*radius2+250, cos(angle)*radius2+140);
    CGPoint newPos3 = CGPointMake(cos(angle)*radius3+200, sin(angle)*radius3+200);
    planet1.position = newPos1;
    planet2.position = newPos2;
    planet3.position = newPos3;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
