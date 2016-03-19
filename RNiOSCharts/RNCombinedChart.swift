//
//  RNPieChart.swift
//  PoliRank
//
//  Created by Jose Padilla on 2/8/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

import Charts
import SwiftyJSON

@objc(RNCombinedChart)
class RNCombinedChart : CombinedChartView {
  
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
    
    let data = CombinedChartData(xVals: labels);
    
    if json["lineData"].isExists() {
      data.lineData = getLineData(labels, json: json["lineData"]);
    }

    if json["barData"].isExists() {
      data.barData = getBarData(labels, json: json["barData"]);
    }
    
    if json["bubbleData"].isExists() {
      data.bubbleData = getBubbleData(labels, json: json["bubbleData"]);
    }
    
    if json["scatterData"].isExists() {
      data.scatterData = getScatterData(labels, json: json["scatterData"]);
    }
    
    if json["candleData"].isExists() {
      data.candleData = getCandleStickData(labels, json: json["candleData"]);
    }
    
    if json["drawHighlightArrowEnabled"].isExists() {
      self.drawHighlightArrowEnabled = json["drawHighlightArrowEnabled"].boolValue;
    }
    
    if json["drawValueAboveBarEnabled"].isExists() {
      self.drawValueAboveBarEnabled = json["drawValueAboveBarEnabled"].boolValue;
    }
    
    if json["drawBarShadowEnabled"].isExists() {
      self.drawBarShadowEnabled = json["drawBarShadowEnabled"].boolValue;
    }
    
    if json["drawOrder"].isExists() {
      self.drawOrder = json["drawOrder"].map({
        if (String($0) == "Bar") {
          return CombinedChartDrawOrder.Bar.rawValue;
        }
        if (String($0) == "Bubble") {
          return CombinedChartDrawOrder.Bubble.rawValue;
        }
        if (String($0) == "Line") {
          return CombinedChartDrawOrder.Line.rawValue;
        }
        if (String($0) == "Candle") {
          return CombinedChartDrawOrder.Candle.rawValue;
        }
        return CombinedChartDrawOrder.Scatter.rawValue;
      });
    }
    
    self.data = data;
  }
}