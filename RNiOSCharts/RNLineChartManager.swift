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

    @objc func setVisibleXRangeMaximum(reactTag: NSNumber, value: CGFloat) {
        self.bridge!.uiManager.addUIBlock { (uiManager: RCTUIManager!, viewRegistry:[NSNumber : UIView]!) in
            let view: RNLineChart = viewRegistry[reactTag] as! RNLineChart;
            view.setVisibleXRangeMaximum(value);
        }
    }
}