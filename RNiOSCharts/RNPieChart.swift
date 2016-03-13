//
//  RNPieChart.swift
//  PoliRank
//
//  Created by Jose Padilla on 2/8/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

import Charts
import SwiftyJSON

@objc(RNPieChart)
class RNPieChart : PieChartView {
  
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

    if json["holeColor"].isExists() {
      self.holeColor = RCTConvert.UIColor(json["holeColor"].intValue);
    }
    
    if json["drawHoleEnabled"].isExists() {
      self.drawHoleEnabled = json["drawHoleEnabled"].boolValue;
    }

    if json["centerText"].isExists() {
      self.centerText = json["centerText"].stringValue;
    }

    if json["drawCenterTextEnabled"].isExists() {
      self.drawCenterTextEnabled = json["drawCenterTextEnabled"].boolValue;
    }
    
    if json["holeRadiusPercent"].isExists() {
      self.holeRadiusPercent = CGFloat(json["holeRadiusPercent"].floatValue);
    }
    
    if json["transparentCircleRadiusPercent"].isExists() {
      self.transparentCircleRadiusPercent = CGFloat(json["transparentCircleRadiusPercent"].floatValue);
    }
    
    if json["drawSliceTextEnabled"].isExists() {
      self.drawSliceTextEnabled = json["drawSliceTextEnabled"].boolValue;
    }
    
    if json["usePercentValuesEnabled"].isExists() {
      self.usePercentValuesEnabled = json["usePercentValuesEnabled"].boolValue;
    }
    
    if json["centerTextRadiusPercent"].isExists() {
      self.centerTextRadiusPercent = CGFloat(json["centerTextRadiusPercent"].floatValue);
    }
    
    if json["maxAngle"].isExists() {
      self.maxAngle = CGFloat(json["maxAngle"].floatValue);
    }
    
    if json["labels"].isExists() {
      labels = json["labels"].arrayObject as! [String];
    }
    
    if json["dataSets"].isExists() {
      let dataSets = json["dataSets"].arrayObject;
      
      var sets: [PieChartDataSet] = [];
      
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
          
          let dataSet = PieChartDataSet(yVals: dataEntries, label: label);
          
          if tmp["sliceSpace"].isExists() {
            dataSet.sliceSpace = CGFloat(tmp["sliceSpace"].floatValue);
          }
          
          if tmp["selectionShift"].isExists() {
            dataSet.selectionShift = CGFloat(tmp["selectionShift"].floatValue);
          }
          
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
      
      let chartData = PieChartData(xVals: labels, dataSets: sets);
      self.data = chartData;
    }
    
  }
  
}