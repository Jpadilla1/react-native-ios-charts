//
//  BarChart.swift
//  PoliRank
//
//  Created by Jose Padilla on 2/6/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

import Charts
import SwiftyJSON

@objc(RNHorizontalBarChart)
class RNHorizontalBarChart : HorizontalBarChartView {
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.frame = frame;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented");
    }
    
    func setConfig(_ config: String!) {
        setBarLineChartViewBaseProps(config);
        
        var maximumDecimalPlaces: Int = 0;
        var minimumDecimalPlaces: Int = 0;
        var labels: [String] = [];
        
        var json: JSON = nil;
        if let data = config.data(using: String.Encoding.utf8) {
            json = JSON(data: data);
        };
        
        if json["labels"].exists() {
            labels = json["labels"].arrayObject as! [String];
        }
        
        if json["dataSets"].exists() {
            let dataSets = json["dataSets"].arrayObject;
            
            var sets: [BarChartDataSet] = [];
            
            for set in dataSets! {
                let tmp = JSON(set);
                if tmp["values"].exists() {
                    let values = tmp["values"].arrayObject as! [Double];
                    let label = tmp["label"].exists() ? tmp["label"].stringValue : "";
                    var dataEntries: [BarChartDataEntry] = [];
                    
                    for i in 0..<values.count {
                        let dataEntry = BarChartDataEntry(value: values[i], xIndex: i);
                        dataEntries.append(dataEntry);
                    }
                    
                    let dataSet = BarChartDataSet(yVals: dataEntries, label: label);
                    
                    if tmp["barShadowColor"].exists() {
                        dataSet.barShadowColor = RCTConvert.uiColor(tmp["barShadowColor"].intValue);
                    }
                    
                    if tmp["barSpace"].exists() {
                        dataSet.barSpace = CGFloat(tmp["barSpace"].floatValue);
                    }
                    
                    if tmp["highlightAlpha"].exists() {
                        dataSet.highlightAlpha = CGFloat(tmp["highlightAlpha"].floatValue);
                    }
                    
                    if tmp["highlightColor"].exists() {
                        dataSet.highlightColor = RCTConvert.uiColor(tmp["highlightColor"].intValue);
                    }
                    
                    if tmp["highlightLineDashLengths"].exists() {
                        dataSet.highlightLineDashLengths = [CGFloat(tmp["highlightLineDashLengths"].floatValue)];
                    }
                    
                    if tmp["highlightLineDashPhase"].exists() {
                        dataSet.highlightLineDashPhase = CGFloat(tmp["highlightLineDashPhase"].floatValue);
                    }
                    
                    if tmp["highlightLineWidth"].exists() {
                        dataSet.highlightLineWidth = CGFloat(tmp["highlightLineWidth"].floatValue);
                    }
                    
                    if tmp["stackLabels"].exists() {
                        dataSet.stackLabels = tmp["stackLabels"].arrayObject as! [String];
                    }
                    
                    if tmp["colors"].exists() {
                        let arrColors = tmp["colors"].arrayObject as! [Int];
                        dataSet.colors = arrColors.map({return RCTConvert.uiColor($0)});
                    }
                    
                    if tmp["drawValues"].exists() {
                        dataSet.drawValuesEnabled = tmp["drawValues"].boolValue;
                    }
                    
                    if tmp["highlightEnabled"].exists() {
                        dataSet.highlightEnabled = tmp["highlightEnabled"].boolValue;
                    }
                    
                    if tmp["valueTextFontName"].exists() {
                        dataSet.valueFont = UIFont(
                            name: tmp["valueTextFontName"].stringValue,
                            size: dataSet.valueFont.pointSize
                            )!;
                    }
                    
                    if tmp["valueTextFontSize"].exists() {
                        dataSet.valueFont = dataSet.valueFont.withSize(CGFloat(tmp["valueTextFontSize"].floatValue))
                    }
                    
                    if tmp["valueTextColor"].exists() {
                        dataSet.valueTextColor = RCTConvert.uiColor(tmp["valueTextColor"].intValue);
                    }
                    
                    if json["valueFormatter"].exists() {
                        if json["valueFormatter"]["minimumDecimalPlaces"].exists() {
                            minimumDecimalPlaces = json["valueFormatter"]["minimumDecimalPlaces"].intValue;
                        }
                        if json["valueFormatter"]["maximumDecimalPlaces"].exists() {
                            maximumDecimalPlaces = json["valueFormatter"]["maximumDecimalPlaces"].intValue;
                        }
                        
                        if json["valueFormatter"]["type"].exists() {
                            switch(json["valueFormatter"]["type"]) {
                            case "regular":
                                dataSet.valueFormatter = NumberFormatter();
                                break;
                            case "abbreviated":
                                dataSet.valueFormatter = ABNumberFormatter(minimumDecimalPlaces: minimumDecimalPlaces, maximumDecimalPlaces: maximumDecimalPlaces);
                                break;
                            default:
                                dataSet.valueFormatter = NumberFormatter();
                            }
                        }
                        
                        if json["valueFormatter"]["numberStyle"].exists() {
                            switch(json["valueFormatter"]["numberStyle"]) {
                            case "CurrencyAccountingStyle":
                                if #available(iOS 9.0, *) {
                                    dataSet.valueFormatter?.numberStyle = .currencyAccounting;
                                }
                                break;
                            case "CurrencyISOCodeStyle":
                                if #available(iOS 9.0, *) {
                                    dataSet.valueFormatter?.numberStyle = .currencyISOCode;
                                }
                                break;
                            case "CurrencyPluralStyle":
                                if #available(iOS 9.0, *) {
                                    dataSet.valueFormatter?.numberStyle = .currencyPlural;
                                }
                                break;
                            case "CurrencyStyle":
                                dataSet.valueFormatter?.numberStyle = .currency;
                                break;
                            case "DecimalStyle":
                                dataSet.valueFormatter?.numberStyle = .decimal;
                                break;
                            case "NoStyle":
                                dataSet.valueFormatter?.numberStyle = .none;
                                break;
                            case "OrdinalStyle":
                                if #available(iOS 9.0, *) {
                                    dataSet.valueFormatter?.numberStyle = .ordinal;
                                }
                                break;
                            case "PercentStyle":
                                dataSet.valueFormatter?.numberStyle = .percent;
                                break;
                            case "ScientificStyle":
                                dataSet.valueFormatter?.numberStyle = .scientific;
                                break;
                            case "SpellOutStyle":
                                dataSet.valueFormatter?.numberStyle = .spellOut;
                                break;
                            default:
                                dataSet.valueFormatter?.numberStyle = .none;
                            }
                        }
                        
                        dataSet.valueFormatter?.minimumFractionDigits = minimumDecimalPlaces;
                        dataSet.valueFormatter?.maximumFractionDigits = maximumDecimalPlaces;
                    }
                    
                    sets.append(dataSet);
                }
            }
            
            let chartData = BarChartData(xVals: labels, dataSets: sets);
            self.data = chartData;
        }
        
        if json["drawValueAboveBar"].exists() {
            self.drawValueAboveBarEnabled = json["drawValueAboveBar"].boolValue;
        }
        
        if json["drawHighlightArrow"].exists() {
            self.drawHighlightArrowEnabled = json["drawHighlightArrow"].boolValue;
        }
        
        if json["drawBarShadow"].exists() {
            self.drawBarShadowEnabled = json["drawBarShadow"].boolValue;
        }
        
    }
    
}
