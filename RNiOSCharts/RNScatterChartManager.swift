//
//  RNHorizontalBarChartManager.swift
//  RCTIOSCharts
//
//  Created by Jose Padilla on 12/24/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

import Foundation

@objc(RNScatterChartSwift)
class RNScatterChartManager : RCTViewManager {
  override func view() -> UIView! {
    return RNScatterChart();
  }

    @objc func setVisibleXRangeMaximum(reactTag: NSNumber, value: CGFloat) {
        self.bridge!.uiManager.addUIBlock { (uiManager: RCTUIManager!, viewRegistry:[NSNumber : UIView]!) in
            let view: RNScatterChart = viewRegistry[reactTag] as! RNScatterChart;
            view.setVisibleXRangeMaximum(value);
        }
    }
}