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
        var maximumDecimalPlaces: Int = 0;
        var minimumDecimalPlaces: Int = 0;
        
        var json: JSON = nil;
        if let data = config.dataUsingEncoding(NSUTF8StringEncoding) {
            json = JSON(data: data);
        };
        
        if json["drawMarkers"].isExists() {
            self.drawMarkers = json["drawMarkers"].boolValue;
        }
        
        if json["labels"].isExists() {
            labels = json["labels"].arrayObject as! [String];
        }
        
        if json["dataSets"].isExists() {
            let dataSets = json["dataSets"].arrayObject;
            
            var sets: [LineChartDataSet] = [];
            
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
                    
                    let dataSet = LineChartDataSet(yVals: dataEntries, label: label);
                    
                    if tmp["colors"].isExists() {
                        let arrColors = tmp["colors"].arrayObject as! [Int];
                        dataSet.colors = arrColors.map({return RCTConvert.UIColor($0)});
                    }
                    
                    if tmp["drawCircles"].isExists() {
                        dataSet.drawCirclesEnabled = tmp["drawCircles"].boolValue;
                    }
                    
                    if tmp["lineWidth"].isExists() {
                        dataSet.lineWidth = CGFloat(tmp["lineWidth"].floatValue);
                    }
                    
                    if tmp["circleColors"].isExists() {
                        let arrColors = tmp["circleColors"].arrayObject as! [Int];
                        dataSet.circleColors = arrColors.map({return RCTConvert.UIColor($0)});
                    }
                    
                    if tmp["circleHoleColor"].isExists() {
                        dataSet.circleHoleColor = RCTConvert.UIColor(tmp["circleHoleColor"].intValue);
                    }
                    
                    if tmp["circleRadius"].isExists() {
                        dataSet.circleRadius = CGFloat(tmp["circleRadius"].floatValue);
                    }
                    
                    if tmp["cubicIntensity"].isExists() {
                        dataSet.cubicIntensity = CGFloat(tmp["cubicIntensity"].floatValue);
                    }
                    
                    if tmp["drawCircleHole"].isExists() {
                        dataSet.drawCircleHoleEnabled = tmp["drawCircleHole"].boolValue;
                    }
                    
                    if tmp["drawCubic"].isExists() {
                        dataSet.drawCubicEnabled = tmp["drawCubic"].boolValue;
                    }
                    
                    if tmp["drawFilled"].isExists() {
                        dataSet.drawFilledEnabled = tmp["drawFilled"].boolValue;
                    }
                    
                    if tmp["drawHorizontalHighlightIndicator"].isExists() {
                        dataSet.drawHorizontalHighlightIndicatorEnabled = tmp["drawHorizontalHighlightIndicator"].boolValue;
                    }
                    
                    if tmp["drawVerticalHighlightIndicator"].isExists() {
                        dataSet.drawVerticalHighlightIndicatorEnabled = tmp["drawVerticalHighlightIndicator"].boolValue;
                    }
                    
                    if tmp["drawValues"].isExists() {
                        dataSet.drawValuesEnabled = tmp["drawValues"].boolValue;
                    }
                    
                    if tmp["fillAlpha"].isExists() {
                        dataSet.fillAlpha = CGFloat(tmp["fillAlpha"].floatValue);
                    }
                    
                    if tmp["fillColor"].isExists() {
                        dataSet.fillColor = RCTConvert.UIColor(tmp["fillColor"].intValue);
                    }
                    
                    if tmp["highlightColor"].isExists() {
                        dataSet.highlightColor = RCTConvert.UIColor(tmp["highlightColor"].intValue);
                    }
                    
                    if tmp["highlightEnabled"].isExists() {
                        dataSet.highlightEnabled = tmp["highlightEnabled"].boolValue;
                    }
                    
                    if tmp["highlightLineDashLengths"].isExists() {
                        dataSet.highlightLineDashLengths = [CGFloat(tmp["highlightLineDashLengths"].floatValue)];
                    }
                    
                    if tmp["highlightLineDashPhase"].isExists() {
                        dataSet.highlightLineDashPhase = CGFloat(tmp["highlightLineDashPhase"].floatValue);
                    }
                    
                    if tmp["highlightLineWidth"].isExists() {
                        dataSet.highlightLineWidth = CGFloat(tmp["highlightLineWidth"].floatValue);
                    }
                    
                    if tmp["lineDashLengths"].isExists() {
                        dataSet.lineDashLengths = [CGFloat(tmp["lineDashLengths"].floatValue)];
                    }
                    
                    if tmp["lineDashPhase"].isExists() {
                        dataSet.lineDashPhase = CGFloat(tmp["lineDashPhase"].floatValue);
                    }
                    
                    if tmp["lineWidth"].isExists() {
                        dataSet.lineWidth = CGFloat(tmp["lineWidth"].floatValue);
                    }
                    
                    if tmp["valueTextFontName"].isExists() {
                        dataSet.valueFont = UIFont(
                            name: tmp["valueTextFontName"].stringValue,
                            size: dataSet.valueFont.pointSize
                            )!;
                    }
                    
                    if tmp["valueTextFontSize"].isExists() {
                        dataSet.valueFont = dataSet.valueFont.fontWithSize(CGFloat(tmp["valueTextFontSize"].floatValue));
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
            
            let chartData = LineChartData(xVals: labels, dataSets: sets);
            self.data = chartData;
        }
    }
}