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
 
  func setPieRadarChartViewBaseProps(_ config: String!) {
    setChartViewBaseProps(config);
    
    var json: JSON = nil;
    if let data = config.data(using: String.Encoding.utf8) {
      json = JSON(data: data);
    };
   
    if json["rotationEnabled"].exists() {
      self.rotationEnabled = json["rotationEnabled"].boolValue;
    }
    
    if json["rotationAngle"].exists() {
      self.rotationAngle = CGFloat(json["rotationAngle"].floatValue);
    }
    
    if json["rotationWithTwoFingers"].exists() {
      self.rotationWithTwoFingers = json["rotationWithTwoFingers"].boolValue;
    }
    
    if json["minOffset"].exists() {
      self.minOffset = CGFloat(json["minOffset"].floatValue);
    }
    
  }
}
