//
//  RNLineChartManager.swift
//  RCTIOSCharts
//
//  Created by Jose Padilla on 12/29/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

import Foundation

@objc(RNLineChartSwift)
class RNLineChartManager : RCTViewManager {
  override func view() -> UIView! {
    return RNLineChart();
  }
}