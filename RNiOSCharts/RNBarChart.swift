//
//  BarChart.swift
//  PoliRank
//
//  Created by Jose Padilla on 2/6/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

import Charts
import SwiftyJSON

@objc(RNBarChart)
class RNBarChart : BarChartView {
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.frame = frame;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented");
    }
    
    func setConfig(config: String!) {
        setBarLineChartViewBaseProps(config);
      
        var labels: [String] = [];
        
        var json: JSON = nil;
        if let data = config.dataUsingEncoding(NSUTF8StringEncoding) {
            json = JSON(data: data);
        };
        
        if json["labels"].isExists() {
            labels = json["labels"].arrayObject as! [String];
        }
      
        self.data = getBarData(labels, json: json);
      
        
        if json["drawValueAboveBar"].isExists() {
            self.drawValueAboveBarEnabled = json["drawValueAboveBar"].boolValue;
        }
        
        if json["drawHighlightArrow"].isExists() {
            self.drawHighlightArrowEnabled = json["drawHighlightArrow"].boolValue;
        }
        
        if json["drawBarShadow"].isExists() {
            self.drawBarShadowEnabled = json["drawBarShadow"].boolValue;
        }
        
    }
    
}