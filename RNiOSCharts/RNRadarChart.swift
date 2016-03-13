//
//  RNPieChart.swift
//  PoliRank
//
//  Created by Jose Padilla on 2/8/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

import Charts
import SwiftyJSON

@objc(RNRadarChart)
class RNRadarChart : RadarChartView {
  
  override init(frame: CGRect) {
    super.init(frame: frame);
    self.frame = frame;
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented");
  }
  
  func setConfig(config: String!) {
    setPieRadarChartViewBaseProps(config);
    
    var maximumDecimalPlaces: Int = 0;
    var minimumDecimalPlaces: Int = 0;
    var labels: [String] = [];
    
    var json: JSON = nil;
    if let data = config.dataUsingEncoding(NSUTF8StringEncoding) {
      json = JSON(data: data);
    };
    
    if json["labels"].isExists() {
      labels = json["labels"].arrayObject as! [String];
    }
    
    if json["dataSets"].isExists() {
      let dataSets = json["dataSets"].arrayObject;
      
      var sets: [RadarChartDataSet] = [];
      
      for set in dataSets! {
        let tmp = JSON(set);
        if tmp["values"].isExists() {
          let values = tmp["values"].arrayObject as! [Double];
          let label = tmp["label"].isExists() ? tmp["label"].stringValue : "";
          var dataEntries: [ChartDataEntry] = [];
          
          for i in 0..<values.count {
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i);
            dataEntries.append(dataEntry);
          }
          
          let dataSet = RadarChartDataSet(yVals: dataEntries, label: label);
          
          if tmp["colors"].isExists() {
            let arrColors = tmp["colors"].arrayObject as! [Int];
            dataSet.colors = arrColors.map({return RCTConvert.UIColor($0)});
          }
          
          if tmp["drawValues"].isExists() {
            dataSet.drawValuesEnabled = tmp["drawValues"].boolValue;
          }
          
          if tmp["highlightEnabled"].isExists() {
            dataSet.highlightEnabled = tmp["highlightEnabled"].boolValue;
          }
          
          if tmp["fillColor"].isExists() {
            dataSet.fillColor = RCTConvert.UIColor(tmp["fillColor"].intValue);
          }
          
          if tmp["fillAlpha"].isExists() {
            dataSet.fillAlpha = CGFloat(tmp["fillAlpha"].floatValue);
          }
          
          if tmp["lineWidth"].isExists() {
            dataSet.lineWidth = CGFloat(tmp["lineWidth"].floatValue);
          }
          
          if tmp["drawFilledEnabled"].isExists() {
            dataSet.drawFilledEnabled = tmp["drawFilledEnabled"].boolValue;
          }
          
          if tmp["valueTextFontName"].isExists() {
            dataSet.valueFont = UIFont(
              name: tmp["valueTextFontName"].stringValue,
              size: dataSet.valueFont.pointSize
              )!;
          }
          
          if tmp["valueTextFontSize"].isExists() {
            dataSet.valueFont = dataSet.valueFont.fontWithSize(CGFloat(tmp["valueTextFontSize"].floatValue))
          }
          
          if tmp["valueTextColor"].isExists() {
            dataSet.valueTextColor = RCTConvert.UIColor(tmp["valueTextColor"].intValue);
          }
          
          if json["valueFormatter"].isExists() {
            if json["valueFormatter"]["minimumDecimalPlaces"].isExists() {
              minimumDecimalPlaces = json["valueFormatter"]["minimumDecimalPlaces"].intValue;
            }
            if json["valueFormatter"]["maximumDecimalPlaces"].isExists() {
              maximumDecimalPlaces = json["valueFormatter"]["maximumDecimalPlaces"].intValue;
            }
            
            if json["valueFormatter"]["type"].isExists() {
              switch(json["valueFormatter"]["type"]) {
              case "regular":
                dataSet.valueFormatter = NSNumberFormatter();
                break;
              case "abbreviated":
                dataSet.valueFormatter = ABNumberFormatter(minimumDecimalPlaces: minimumDecimalPlaces, maximumDecimalPlaces: maximumDecimalPlaces);
                break;
              default:
                dataSet.valueFormatter = NSNumberFormatter();
              }
            }
            
            if json["valueFormatter"]["numberStyle"].isExists() {
              switch(json["valueFormatter"]["numberStyle"]) {
              case "CurrencyAccountingStyle":
                if #available(iOS 9.0, *) {
                  dataSet.valueFormatter?.numberStyle = .CurrencyAccountingStyle;
                }
                break;
              case "CurrencyISOCodeStyle":
                if #available(iOS 9.0, *) {
                  dataSet.valueFormatter?.numberStyle = .CurrencyISOCodeStyle;
                }
                break;
              case "CurrencyPluralStyle":
                if #available(iOS 9.0, *) {
                  dataSet.valueFormatter?.numberStyle = .CurrencyPluralStyle;
                }
                break;
              case "CurrencyStyle":
                dataSet.valueFormatter?.numberStyle = .CurrencyStyle;
                break;
              case "DecimalStyle":
                dataSet.valueFormatter?.numberStyle = .DecimalStyle;
                break;
              case "NoStyle":
                dataSet.valueFormatter?.numberStyle = .NoStyle;
                break;
              case "OrdinalStyle":
                if #available(iOS 9.0, *) {
                  dataSet.valueFormatter?.numberStyle = .OrdinalStyle;
                }
                break;
              case "PercentStyle":
                dataSet.valueFormatter?.numberStyle = .PercentStyle;
                break;
              case "ScientificStyle":
                dataSet.valueFormatter?.numberStyle = .ScientificStyle;
                break;
              case "SpellOutStyle":
                dataSet.valueFormatter?.numberStyle = .SpellOutStyle;
                break;
              default:
                dataSet.valueFormatter?.numberStyle = .NoStyle;
              }
            }
            
            dataSet.valueFormatter?.minimumFractionDigits = minimumDecimalPlaces;
            dataSet.valueFormatter?.maximumFractionDigits = maximumDecimalPlaces;
          }
          
          sets.append(dataSet);
        }
      }
      
      let chartData = RadarChartData(xVals: labels, dataSets: sets);
      self.data = chartData;
      
      if json["webLineWidth"].isExists() {
        self.webLineWidth = CGFloat(json["webLineWidth"].floatValue);
      }
      
      if json["innerWebLineWidth"].isExists() {
        self.innerWebLineWidth = CGFloat(json["innerWebLineWidth"].floatValue);
      }

      if json["webColor"].isExists() {
        self.webColor = RCTConvert.UIColor(json["webColor"].intValue);
      }
      
      if json["innerWebColor"].isExists() {
        self.innerWebColor = RCTConvert.UIColor(json["innerWebColor"].intValue);
      }
      
      if json["webAlpha"].isExists() {
        self.webAlpha = CGFloat(json["webAlpha"].floatValue);
      }
      
      if json["drawWeb"].isExists() {
        self.drawWeb = json["drawWeb"].boolValue;
      }
      
      if json["skipWebLineCount"].isExists() {
        self.skipWebLineCount = json["skipWebLineCount"].intValue;
      }
      
    }
  }
}