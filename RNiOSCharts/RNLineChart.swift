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
    
    func setConfig(config: String!) {
        self.descriptionText = "";
        
        setBarLineChartViewBaseProps(config);
        
        var labels: [String] = [];
        
        var json: JSON = nil;
        if let data = config.dataUsingEncoding(NSUTF8StringEncoding) {
            json = JSON(data: data);
        };
        
        if json["labels"].isExists() {
            labels = json["labels"].arrayObject as! [String];
        }
      
        self.data = getLineData(labels, json: json);
      
        if json["drawMarkers"].isExists() {
          self.drawMarkers = json["drawMarkers"].boolValue;
        }
        
        if json["leftAxis"]["startAtZero"].isExists() {
            self.leftAxis.startAtZeroEnabled = json["leftAxis"]["startAtZero"].boolValue;
        }
    }
}
