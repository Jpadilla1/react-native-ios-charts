//
//  RNHorizontalBarChartManager.swift
//  RCTIOSCharts
//
//  Created by Jose Padilla on 12/24/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

import Foundation

@objc(RNCandleStickChartSwift)
class RNCandleStickChartManager : RCTViewManager {
  override func view() -> UIView! {
    return RNCandleStickChart();
  }

    @objc func setVisibleXRangeMaximum(reactTag: NSNumber, value: CGFloat) {
        self.bridge!.uiManager.addUIBlock { (uiManager: RCTUIManager!, viewRegistry:[NSNumber : UIView]!) in
            let view: RNCandleStickChart = viewRegistry[reactTag] as! RNCandleStickChart;
            view.setVisibleXRangeMaximum(value);
        }
    }
}