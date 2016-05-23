//
//  RNPieChart.m
//  PoliRank
//
//  Created by Jose Padilla on 2/8/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "RNScatterChart.h"
#import "RCTViewManager.h"

@interface RCT_EXTERN_MODULE(RNScatterChartSwift, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(config, NSString);
RCT_EXTERN_METHOD(setVisibleXRangeMaximum:(nonnull NSNumber *)reactTag value:(CGFloat *)v);

@end