//
//  PieRadarChartViewBase.swift
//  PoliRank
//
//  Created by Jose Padilla on 2/8/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

import Charts
import SwiftyJSON

extension PieRadarChartViewBase {
 
  func setPieRadarChartViewBaseProps(config: String!) {
    setChartViewBaseProps(config);
    
    var json: JSON = nil;
    if let data = config.dataUsingEncoding(NSUTF8StringEncoding) {
      json = JSON(data: data);
    };
   
    if json["rotationEnabled"].isExists() {
      self.rotationEnabled = json["rotationEnabled"].boolValue;
    }
    
    if json["rotationAngle"].isExists() {
      self.rotationAngle = CGFloat(json["rotationAngle"].floatValue);
    }
    
    if json["rotationWithTwoFingers"].isExists() {
      self.rotationWithTwoFingers = json["rotationWithTwoFingers"].boolValue;
    }
    
    if json["minOffset"].isExists() {
      self.minOffset = CGFloat(json["minOffset"].floatValue);
    }
    
  }
}