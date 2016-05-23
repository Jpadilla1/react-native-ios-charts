//
//  RNBarChart.m
//  RCTIOSCharts
//
//  Created by Jose Padilla on 12/24/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import "RNBarChart.h"
#import "RCTViewManager.h"

@interface RCT_EXTERN_MODULE(RNBarChartSwift, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(config, NSString);
RCT_EXTERN_METHOD(setVisibleXRangeMaximum:(nonnull NSNumber *)reactTag value:(CGFloat *)v);

@end