//
//  RNLineChart.swift
//  RCTIOSCharts
//
//  Created by Jose Padilla on 12/29/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

import Foundation
import Charts
import SwiftyJSON


@objc(RNLineChart)
class RNLineChart : LineChartView {
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.frame = frame;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented");
    }
    
    func setConfig(_ config: String!) {
        self.descriptionText = "";
        
        setBarLineChartViewBaseProps(config);
        
        var labels: [String] = [];
        
        var json: JSON = nil;
        if let data = config.data(using: String.Encoding.utf8) {
            json = JSON(data: data);
        };
        
        if json["labels"].exists() {
            labels = json["labels"].arrayObject as! [String];
        }
      
        self.data = getLineData(labels, json: json);
      
        if json["drawMarkers"].exists() {
          self.drawMarkers = json["drawMarkers"].boolValue;
        }
        
        if json["leftAxis"]["startAtZero"].exists() {
            self.leftAxis.startAtZeroEnabled = json["leftAxis"]["startAtZero"].boolValue;
        }
    }
}
