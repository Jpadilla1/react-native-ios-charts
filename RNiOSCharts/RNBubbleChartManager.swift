//
//  RNHorizontalBarChartManager.swift
//  RCTIOSCharts
//
//  Created by Jose Padilla on 12/24/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

import Foundation

@objc(RNBubbleChartSwift)
class RNBubbleChartManager : RCTViewManager {
  override func view() -> UIView! {
    return RNBubbleChart();
  }
}