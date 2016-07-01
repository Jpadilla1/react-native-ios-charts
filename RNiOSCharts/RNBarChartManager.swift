//
//  RNBarChartManager.swift
//  RCTIOSCharts
//
//  Created by Jose Padilla on 12/24/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

import Foundation

@objc(RNBarChartSwift)
class RNBarChartManager : RCTViewManager {
  override func view() -> UIView! {
    return RNBarChart();
  }

  @objc func setVisibleXRangeMaximum(reactTag: NSNumber, value: CGFloat) {
    self.bridge!.uiManager.addUIBlock { (uiManager: RCTUIManager!, viewRegistry:[NSNumber : UIView]!) in
      let view: RNBarChart = viewRegistry[reactTag] as! RNBarChart;
        view.setVisibleXRangeMaximum(value);
      }
  }
}