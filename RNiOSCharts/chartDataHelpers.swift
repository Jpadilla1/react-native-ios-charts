//
//  chartDataHelpers.swift
//  ChartsExplorer
//
//  Created by Jose Padilla on 3/18/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

import Foundation
import Charts
import SwiftyJSON


var maximumDecimalPlaces: Int = 0;
var minimumDecimalPlaces: Int = 0;

func getLineData(labels: [String], json: JSON!) -> LineChartData {
    if !json["dataSets"].isExists() {
        return LineChartData();
    }
    
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
            
            if tmp["axisDependency"].isExists() {
                let value = tmp["axisDependency"].stringValue;
                if value == "left" {
                    dataSet.axisDependency = .Left;
                } else if value == "right" {
                    dataSet.axisDependency = .Right;
                }
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
    return LineChartData(xVals: labels, dataSets: sets);
}


func getBarData(labels: [String], json: JSON!) -> BarChartData {
    if !json["dataSets"].isExists() {
        return BarChartData();
    }
    
    let dataSets = json["dataSets"].arrayObject;
    var sets: [BarChartDataSet] = [];
    
    for set in dataSets! {
        let tmp = JSON(set);
        if tmp["values"].isExists() {
            let values = tmp["values"].arrayObject as! [Double];
            let label = tmp["label"].isExists() ? tmp["label"].stringValue : "";
            var dataEntries: [BarChartDataEntry] = [];
            
            for i in 0..<values.count {
                let dataEntry = BarChartDataEntry(value: values[i], xIndex: i);
                dataEntries.append(dataEntry);
            }
            
            let dataSet = BarChartDataSet(yVals: dataEntries, label: label);
            
            if tmp["barShadowColor"].isExists() {
                dataSet.barShadowColor = RCTConvert.UIColor(tmp["barShadowColor"].intValue);
            }
            
            if tmp["barSpace"].isExists() {
                dataSet.barSpace = CGFloat(tmp["barSpace"].floatValue);
            }
            
            if tmp["highlightAlpha"].isExists() {
                dataSet.highlightAlpha = CGFloat(tmp["highlightAlpha"].floatValue);
            }
            
            if tmp["highlightColor"].isExists() {
                dataSet.highlightColor = RCTConvert.UIColor(tmp["highlightColor"].intValue);
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
            
            if tmp["stackLabels"].isExists() {
                dataSet.stackLabels = tmp["stackLabels"].arrayObject as! [String];
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
            
            if tmp["axisDependency"].isExists() {
                let value = tmp["axisDependency"].stringValue;
                if value == "left" {
                    dataSet.axisDependency = .Left;
                } else if value == "right" {
                    dataSet.axisDependency = .Right;
                }
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
    return BarChartData(xVals: labels, dataSets: sets);
}


func getBubbleData(labels: [String], json: JSON!) -> BubbleChartData {
    if !json["dataSets"].isExists() {
        return BubbleChartData();
    }
    
    let dataSets = json["dataSets"].arrayObject;
    
    var sets: [BubbleChartDataSet] = [];
    
    for set in dataSets! {
        let tmp = JSON(set);
        if tmp["values"].isExists() {
            let values = tmp["values"].arrayObject!;
            let label = tmp["label"].isExists() ? tmp["label"].stringValue : "";
            var dataEntries: [BubbleChartDataEntry] = [];
            
            for i in 0..<values.count {
                let object = JSON(values[i]);
                let dataEntry = BubbleChartDataEntry(
                    xIndex: i,
                    value: object["value"].doubleValue,
                    size: CGFloat(object["size"].floatValue)
                );
                dataEntries.append(dataEntry);
            }
            
            let dataSet = BubbleChartDataSet(yVals: dataEntries, label: label);
            
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
            
            if tmp["highlightCircleWidth"].isExists() {
                dataSet.highlightCircleWidth = CGFloat(tmp["highlightCircleWidth"].floatValue);
            }
            
            if tmp["valueTextFontName"].isExists() {
                dataSet.valueFont = UIFont(
                    name: tmp["valueTextFontName"].stringValue,
                    size: dataSet.valueFont.pointSize
                    )!;
            }
            
            if tmp["axisDependency"].isExists() {
                let value = tmp["axisDependency"].stringValue;
                if value == "left" {
                    dataSet.axisDependency = .Left;
                } else if value == "right" {
                    dataSet.axisDependency = .Right;
                }
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
    return BubbleChartData(xVals: labels, dataSets: sets);
}

func getScatterData(labels: [String], json: JSON!) -> ScatterChartData {
    if !json["dataSets"].isExists() {
        return ScatterChartData();
    }
    
    let dataSets = json["dataSets"].arrayObject;
    
    var sets: [ScatterChartDataSet] = [];
    
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
            
            let dataSet = ScatterChartDataSet(yVals: dataEntries, label: label);
            
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
            
            if tmp["scatterShapeSize"].isExists() {
                dataSet.scatterShapeSize = CGFloat(tmp["scatterShapeSize"].floatValue);
            }
            
            if tmp["scatterShapeHoleRadius"].isExists() {
                dataSet.scatterShapeHoleRadius = CGFloat(tmp["scatterShapeHoleRadius"].floatValue);
            }
            
            if tmp["scatterShapeHoleColor"].isExists() {
                dataSet.scatterShapeHoleColor = RCTConvert.UIColor(tmp["scatterShapeHoleColor"].intValue);
            }
            
            if tmp["scatterShape"].isExists() {
                switch(tmp["scatterShape"]) {
                case "Square":
                    dataSet.scatterShape = .Square;
                    break;
                case "Circle":
                    dataSet.scatterShape = .Circle;
                    break;
                case "Triangle":
                    dataSet.scatterShape = .Triangle;
                    break;
                case "Cross":
                    dataSet.scatterShape = .Cross;
                    break;
                case "X":
                    dataSet.scatterShape = .X;
                    break;
                default:
                    dataSet.scatterShape = .Square;
                    break;
                }
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
            
            if tmp["axisDependency"].isExists() {
                let value = tmp["axisDependency"].stringValue;
                if value == "left" {
                    dataSet.axisDependency = .Left;
                } else if value == "right" {
                    dataSet.axisDependency = .Right;
                }
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
    return ScatterChartData(xVals: labels, dataSets: sets);
}

func getCandleStickData(labels: [String], json: JSON!) -> CandleChartData {
    if !json["dataSets"].isExists() {
        return CandleChartData();
    }
    
    let dataSets = json["dataSets"].arrayObject;
    
    var sets: [CandleChartDataSet] = [];
    
    for set in dataSets! {
        let tmp = JSON(set);
        if tmp["values"].isExists() {
            let values = tmp["values"].arrayObject!;
            let label = tmp["label"].isExists() ? tmp["label"].stringValue : "";
            var dataEntries: [CandleChartDataEntry] = [];
            
            for i in 0..<values.count {
                let object = JSON(values[i]);
                let dataEntry = CandleChartDataEntry(
                    xIndex: i,
                    shadowH: object["shadowH"].doubleValue,
                    shadowL: object["shadowL"].doubleValue,
                    open: object["open"].doubleValue,
                    close: object["close"].doubleValue
                );
                dataEntries.append(dataEntry);
            }
            
            let dataSet = CandleChartDataSet(yVals: dataEntries, label: label);
            
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
            
            if tmp["axisDependency"].isExists() {
                let value = tmp["axisDependency"].stringValue;
                if value == "left" {
                    dataSet.axisDependency = .Left;
                } else if value == "right" {
                    dataSet.axisDependency = .Right;
                }
            }

            if tmp["barSpace"].isExists() {
                dataSet.barSpace = CGFloat(tmp["barSpace"].floatValue);
            }

            if tmp["showCandleBar"].isExists() {
                dataSet.showCandleBar = tmp["showCandleBar"].boolValue;
            }

            if tmp["shadowWidth"].isExists() {
                dataSet.shadowWidth = CGFloat(tmp["shadowWidth"].floatValue);
            }

            if tmp["shadowColor"].isExists() {
                dataSet.shadowColor = RCTConvert.UIColor(tmp["shadowColor"].intValue);
            }

            if tmp["shadowColorSameAsCandle"].isExists() {
                dataSet.shadowColorSameAsCandle = tmp["shadowColorSameAsCandle"].boolValue;
            }

            if tmp["neutralColor"].isExists() {
                dataSet.neutralColor = RCTConvert.UIColor(tmp["neutralColor"].intValue);
            }

            if tmp["increasingColor"].isExists() {
                dataSet.increasingColor = RCTConvert.UIColor(tmp["increasingColor"].intValue);
            }

            if tmp["decreasingColor"].isExists() {
                dataSet.decreasingColor = RCTConvert.UIColor(tmp["decreasingColor"].intValue);
            }

            if tmp["increasingFilled"].isExists() {
                dataSet.increasingFilled = tmp["increasingFilled"].boolValue;
            }

            if tmp["decreasingFilled"].isExists() {
                dataSet.decreasingFilled = tmp["decreasingFilled"].boolValue;
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
    return CandleChartData(xVals: labels, dataSets: sets);
}

