//
//  REAAnimationRootViewManager.m
//  DoubleConversion
//
//  Created by Szymon Kapala on 22/03/2021.
//

#import "REAAnimationRootViewManager.h"
#import "REAAnimationRootView.h"
#import <React/RCTViewManager.h>
#import "RCTShadowView.h"
#import "REAReactBatchObserver.h"

@interface REAShadowView : RCTShadowView

@end

@implementation REAShadowView {
    NSNumber* _tag;
}

@synthesize reactTag = _tag;

- (NSNumber*)reactTag
{
    return _tag;
}

- (void)setReactTag:(NSNumber*)reactTag
{
    _tag = reactTag;
    [[REAReactBatchObserver animationRootsTags] addObject:reactTag];
}

@end

@implementation REAAnimationRootViewManager

RCT_EXPORT_MODULE(REALayoutView)

- (UIView *)view
{
    return [REAAnimationRootView new];
}

- (RCTShadowView*)shadowView
{
    return [REAShadowView new];
}

RCT_CUSTOM_VIEW_PROPERTY(animated, BOOL, REAAnimationRootView)
{
    view.shouldBeAnimated = [RCTConvert BOOL:json];
}

RCT_CUSTOM_VIEW_PROPERTY(isSingleComponet, BOOL, REAAnimationRootView)
{
    view.isSingleComponent = [RCTConvert BOOL:json];
}

@end
