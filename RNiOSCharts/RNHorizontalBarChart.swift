//
//  RNBarChart.swift
//  RCTIOSCharts
//
//  Created by Jose Padilla on 12/24/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

import Foundation
import Charts
import SwiftyJSON

@objc(RNHorizontalBarChart)
class RNHorizontalBarChart : HorizontalBarChartView {
    
    var labels: [String] = [];
    var values: [Double] = [];
    var dataSetLabel: String = "";
    var colors: [UIColor] = ChartColorTemplates.colorful();
    var legendColors: [UIColor] = ChartColorTemplates.colorful();
    var legendLabels: [String] = [];
    var decimalPlaces: Int = 0;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.frame = frame;
        self.descriptionText = "";
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented");
    }
    
    func setConfig(config: String!) {
        var json: JSON = nil;
        if let data = config.dataUsingEncoding(NSUTF8StringEncoding) {
            json = JSON(data: data);
        };
        
        if json["labels"].isExists() {
            self.labels = json["labels"].arrayObject as! [String];
        }
        
        if json["dataSets"].isExists() {
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
                    
                    if tmp["colors"].isExists() {
                        let arrColors = tmp["colors"].arrayObject as! [Int];
                        dataSet.colors = arrColors.map({return RCTConvert.UIColor($0)});
                    }
                    
                    if tmp["barShadowColor"].isExists() {
                        dataSet.barShadowColor = RCTConvert.UIColor(tmp["barShadowColor"].intValue);
                    }
                    
                    if tmp["barSpace"].isExists() {
                        dataSet.barSpace = CGFloat(tmp["barSpace"].floatValue);
                    }
                    
                    if tmp["drawValues"].isExists() {
                        dataSet.drawValuesEnabled = tmp["drawValues"].boolValue;
                    }
                    
                    if tmp["highlightAlpha"].isExists() {
                        dataSet.highlightAlpha = CGFloat(tmp["highlightAlpha"].floatValue);
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
                    
                    if tmp["stackLabels"].isExists() {
                        dataSet.stackLabels = tmp["stackLabels"].arrayObject as! [String];
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
                        if json["valueFormatter"]["decimalPlaces"].isExists() {
                            self.decimalPlaces = json["valueFormatter"]["decimalPlaces"].intValue;
                        }
                        
                        if json["valueFormatter"]["type"].isExists() {
                            switch(json["valueFormatter"]["type"]) {
                            case "regular":
                                dataSet.valueFormatter = NSNumberFormatter();
                                break;
                            case "abbreviated":
                                dataSet.valueFormatter = ABNumberFormatter(decimalPlaces: self.decimalPlaces);
                                break;
                            default:
                                dataSet.valueFormatter = NSNumberFormatter();
                            }
                        }
                        
                        if json["valueFormatter"]["numberStyle"].isExists() {
                            switch(json["valueFormatter"]["numberStyle"]) {
                            case "CurrencyAccountingStyle":
                                if #available(iOS 9.0, *) {
                                    dataSet.valueFormatter?.numberStyle = .CurrencyAccountingStyle
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
                        
                        dataSet.valueFormatter?.maximumFractionDigits = self.decimalPlaces;
                    }
                    
                    sets.append(dataSet);
                }
            }
            
            let chartData = BarChartData(xVals: self.labels, dataSets: sets);
            self.data = chartData;
        }
        
        if json["backgroundColor"].isExists() {
            self.backgroundColor = RCTConvert.UIColor(json["backgroundColor"].intValue);
        }
        
        if json["gridBackgroundColor"].isExists() {
            self.gridBackgroundColor = RCTConvert.UIColor(json["gridBackgroundColor"].intValue);
        }
        
        if json["noDataText"].isExists() {
            self.noDataText = json["noDataText"].stringValue;
        }
        
        if json["descriptionText"].isExists() {
            self.descriptionText = json["descriptionText"].stringValue;
        }
        
        if json["descriptionFontName"].isExists() {
            self.descriptionFont = UIFont(
                name: json["descriptionFontName"].stringValue,
                size: self.descriptionFont!.pointSize
            );
        }
        
        if json["descriptionFontSize"].isExists() {
            self.descriptionFont = self.descriptionFont?.fontWithSize(CGFloat(json["descriptionFontSize"].floatValue));
        }
        
        if json["descriptionTextColor"].isExists() {
            self.descriptionTextColor = RCTConvert.UIColor(json["descriptionTextColor"].intValue);
        }
        
        if json["descriptionTextPosition"].isExists() &&
            json["descriptionTextPosition"]["x"].isExists() &&
            json["descriptionTextPosition"]["y"].isExists() {
                
                self.setDescriptionTextPosition(
                    x: CGFloat(json["descriptionTextPosition"]["x"].floatValue),
                    y: CGFloat(json["descriptionTextPosition"]["y"].floatValue)
                )
        }
        
        if json["infoTextFontName"].isExists() {
            self.infoFont = UIFont(
                name: json["infoTextFontName"].stringValue,
                size: self.infoFont!.pointSize
            );
        }
        
        if json["infoTextFontSize"].isExists() {
            self.infoFont = self.infoFont?.fontWithSize(CGFloat(json["infoTextFontSize"].floatValue));
        }
        
        if json["infoTextColor"].isExists() {
            self.infoTextColor = RCTConvert.UIColor(json["infoTextColor"].intValue);
        }
        
        if json["dataSetLabel"].isExists() {
            self.dataSetLabel = json["dataSetLabel"].stringValue;
        }
        
        if json["colors"].isExists() {
            let arrColors = json["colors"].arrayObject as! [Int];
            self.colors = arrColors.map({return RCTConvert.UIColor($0)});
        }
        
        if json["descriptionTextAlign"].isExists() {
            switch (json["descriptionTextAlign"].stringValue) {
            case "left":
                self.descriptionTextAlign = NSTextAlignment.Left;
                break;
            case "center":
                self.descriptionTextAlign = NSTextAlignment.Center;
                break;
            case "right":
                self.descriptionTextAlign = NSTextAlignment.Right;
                break;
            case "justified":
                self.descriptionTextAlign = NSTextAlignment.Justified;
                break;
            default:
                break;
            }
        }
        
        if json["drawBorders"].isExists() {
            self.drawBordersEnabled = json["drawBorders"].boolValue;
        }
        
        if json["borderColor"].isExists() {
            self.borderColor = RCTConvert.UIColor(json["borderColor"].intValue);
        }
        
        if json["borderLineWidth"].isExists() {
            self.borderLineWidth = CGFloat(json["borderLineWidth"].floatValue);
        }
        
        if json["drawMarkers"].isExists() {
            self.drawMarkers = json["drawMarkers"].boolValue;
        }
        
        if json["drawValueAboveBar"].isExists() {
            self.drawValueAboveBarEnabled = json["drawValueAboveBar"].boolValue;
        }
        
        if json["drawHighlightArrow"].isExists() {
            self.drawHighlightArrowEnabled = json["drawHighlightArrow"].boolValue;
        }
        
        if json["drawBarShadow"].isExists() {
            self.drawBarShadowEnabled = json["drawBarShadow"].boolValue;
        }
        
        if json["minOffset"].isExists() {
            self.minOffset = CGFloat(json["minOffset"].floatValue);
        }
        
        if json["autoScaleMinMax"].isExists() {
            self.autoScaleMinMaxEnabled = json["autoScaleMinMax"].boolValue;
        }
        
        if json["highlightPerTap"].isExists() {
            self.highlightPerTapEnabled = json["highlightPerTap"].boolValue;
        }
        
        if json["showLegend"].isExists() {
            self.legend.enabled = json["showLegend"].boolValue;
        }
        
        if json["legend"].isExists() {
            if json["legend"]["textColor"].isExists() {
                self.legend.textColor = RCTConvert.UIColor(json["legend"]["textColor"].intValue);
            }
            
            if json["legend"]["textSize"].isExists() {
                self.legend.font = self.legend.font.fontWithSize(CGFloat(json["legend"]["textSize"].floatValue));
            }
            
            if json["legend"]["textFontName"].isExists() {
                self.legend.font = UIFont(
                    name: json["legend"]["textFontName"].stringValue,
                    size: self.legend.font.pointSize
                    )!;
            }
            
            if json["legend"]["wordWrap"].isExists() {
                self.legend.wordWrapEnabled = json["legend"]["wordWrap"].boolValue;
            }
            
            if json["legend"]["maxSizePercent"].isExists() {
                self.legend.maxSizePercent = CGFloat(json["legend"]["maxSizePercent"].floatValue);
            }
            
            if json["legend"]["position"].isExists() {
                switch(json["legend"]["position"].stringValue) {
                case "rightOfChart":
                    self.legend.position = ChartLegend.ChartLegendPosition.RightOfChart;
                    break;
                case "rightOfChartCenter":
                    self.legend.position = ChartLegend.ChartLegendPosition.RightOfChartCenter;
                    break;
                case "rightOfChartInside":
                    self.legend.position = ChartLegend.ChartLegendPosition.RightOfChartInside;
                    break;
                case "leftOfChart":
                    self.legend.position = ChartLegend.ChartLegendPosition.LeftOfChart;
                    break;
                case "leftOfChartCenter":
                    self.legend.position = ChartLegend.ChartLegendPosition.LeftOfChartCenter;
                    break;
                case "leftOfChartInside":
                    self.legend.position = ChartLegend.ChartLegendPosition.LeftOfChartInside;
                    break;
                case "belowChartLeft":
                    self.legend.position = ChartLegend.ChartLegendPosition.BelowChartLeft;
                    break;
                case "belowChartRight":
                    self.legend.position = ChartLegend.ChartLegendPosition.BelowChartRight;
                    break;
                case "belowChartCenter":
                    self.legend.position = ChartLegend.ChartLegendPosition.BelowChartCenter;
                    break;
                case "aboveChartLeft":
                    self.legend.position = ChartLegend.ChartLegendPosition.AboveChartLeft;
                    break;
                case "aboveChartRight":
                    self.legend.position = ChartLegend.ChartLegendPosition.AboveChartRight;
                    break;
                case "aboveChartCenter":
                    self.legend.position = ChartLegend.ChartLegendPosition.AboveChartCenter;
                    break;
                case "pieChartCenter":
                    self.legend.position = ChartLegend.ChartLegendPosition.PiechartCenter;
                    break;
                default:
                    self.legend.position = ChartLegend.ChartLegendPosition.BelowChartLeft;
                    break;
                }
            }
            
            if json["legend"]["form"].isExists() {
                switch(json["legend"]["form"]) {
                case "square":
                    self.legend.form = ChartLegend.ChartLegendForm.Square;
                    break;
                case "circle":
                    self.legend.form = ChartLegend.ChartLegendForm.Circle;
                    break;
                case "line":
                    self.legend.form = ChartLegend.ChartLegendForm.Line;
                    break;
                default:
                    self.legend.form = ChartLegend.ChartLegendForm.Square;
                    break;
                }
            }
            
            if json["legend"]["formSize"].isExists() {
                self.legend.formSize = CGFloat(json["legend"]["formSize"].floatValue);
            }
            
            if json["legend"]["xEntrySpace"].isExists() {
                self.legend.xEntrySpace = CGFloat(json["legend"]["xEntrySpace"].floatValue);
            }
            
            if json["legend"]["yEntrySpace"].isExists() {
                self.legend.yEntrySpace = CGFloat(json["legend"]["yEntrySpace"].floatValue);
            }
            
            if json["legend"]["formToTextSpace"].isExists() {
                self.legend.formToTextSpace = CGFloat(json["legend"]["formToTextSpace"].floatValue);
            }
            
            if json["legend"]["colors"].isExists() {
                let arrColors = json["legend"]["colors"].arrayObject as! [Int];
                self.legendColors = arrColors.map({return RCTConvert.UIColor($0)});
                if self.legendLabels.count == self.legendColors.count {
                    self.legend.setCustom(colors: self.legendColors, labels: self.legendLabels);
                }
            }
            
            if json["legend"]["labels"].isExists() {
                self.legendLabels = json["legend"]["labels"].arrayObject as! [String];
                if self.legendLabels.count == self.legendColors.count {
                    self.legend.setCustom(colors: self.legendColors, labels: self.legendLabels);
                }
            }
            
        }
        
        
        if json["highlightValues"].isExists() {
            let highlightValues = json["highlightValues"].arrayObject as! [Int];
            self.highlightValues(highlightValues.map({return ChartHighlight(xIndex: $0, dataSetIndex: 0)}));
        }
        
        // xAxis
        
        if json["xAxis"].isExists() {
            if json["xAxis"]["enabled"].isExists() {
                self.xAxis.enabled = json["xAxis"]["enabled"].boolValue;
            }
            
            if json["xAxis"]["drawAxisLine"].isExists() {
                self.xAxis.drawAxisLineEnabled = json["xAxis"]["drawAxisLine"].boolValue;
            }
            
            if json["xAxis"]["drawGridLines"].isExists() {
                self.xAxis.drawGridLinesEnabled = json["xAxis"]["drawGridLines"].boolValue;
            }
            
            if json["xAxis"]["drawLabels"].isExists() {
                self.xAxis.drawLabelsEnabled = json["xAxis"]["drawLabels"].boolValue;
            }
            
            if json["xAxis"]["textColor"].isExists() {
                self.xAxis.labelTextColor = RCTConvert.UIColor(json["xAxis"]["textColor"].intValue);
            }
            
            if json["xAxis"]["textFontName"].isExists() {
                self.xAxis.labelFont = UIFont(
                    name: json["xAxis"]["textFontName"].stringValue,
                    size: self.xAxis.labelFont.pointSize
                    )!;
            }
            
            if json["xAxis"]["textSize"].isExists() {
                self.xAxis.labelFont = self.xAxis.labelFont.fontWithSize(CGFloat(json["xAxis"]["textSize"].floatValue));
            }
            
            if json["xAxis"]["gridColor"].isExists() {
                self.xAxis.gridColor = RCTConvert.UIColor(json["xAxis"]["gridColor"].intValue);
            }
            
            if json["xAxis"]["gridLineWidth"].isExists() {
                self.xAxis.gridLineWidth = CGFloat(json["xAxis"]["gridLineWidth"].floatValue);
            }
            
            if json["xAxis"]["axisLineColor"].isExists() {
                self.xAxis.axisLineColor = RCTConvert.UIColor(json["xAxis"]["axisLineColor"].intValue);
            }
            
            if json["xAxis"]["axisLineWidth"].isExists() {
                self.xAxis.axisLineWidth = CGFloat(json["xAxis"]["axisLineWidth"].floatValue);
            }
            
            if json["xAxis"]["gridDashedLine"].isExists() {
                
                if json["xAxis"]["gridDashedLine"]["lineLength"].isExists() {
                    self.xAxis.gridLineDashLengths = [CGFloat(
                        json["xAxis"]["gridDashedLine"]["lineLength"].floatValue
                        )];
                }
                
                if json["xAxis"]["gridDashedLine"]["spaceLength"].isExists() {
                    self.xAxis.gridLineWidth = CGFloat(
                        json["xAxis"]["gridDashedLine"]["spaceLength"].floatValue
                    );
                }
                
                if json["xAxis"]["gridDashedLine"]["phase"].isExists() {
                    self.xAxis.gridLineDashPhase = CGFloat(
                        json["xAxis"]["gridDashedLine"]["phase"].floatValue
                    );
                }
                
            }
            
            if json["xAxis"]["limitLines"].isExists() {
                let limitLines = json["xAxis"]["limitLines"].arrayObject;
                for l in limitLines! {
                    let tmp = JSON(l);
                    
                    if tmp["limit"].isExists() &&
                        tmp["label"].isExists() {
                            
                            let line = ChartLimitLine(
                                limit: tmp["limit"].doubleValue,
                                label: tmp["label"].stringValue
                            );
                            
                            if tmp["position"].isExists() {
                                switch(tmp["position"]) {
                                case "leftBottom":
                                    line.labelPosition = ChartLimitLine.ChartLimitLabelPosition.LeftBottom;
                                    break;
                                case "leftTop":
                                    line.labelPosition = ChartLimitLine.ChartLimitLabelPosition.LeftTop;
                                    break;
                                case "rightBottom":
                                    line.labelPosition = ChartLimitLine.ChartLimitLabelPosition.RightBottom;
                                    break;
                                case "rightTop":
                                    line.labelPosition = ChartLimitLine.ChartLimitLabelPosition.RightTop;
                                    break;
                                default:
                                    line.labelPosition = ChartLimitLine.ChartLimitLabelPosition.RightTop;
                                    break;
                                }
                            }
                            
                            if tmp["lineColor"].isExists() {
                                line.lineColor = RCTConvert.UIColor(tmp["lineColor"].intValue);
                            }
                            
                            if tmp["lineDashLengths"].isExists() {
                                line.lineDashLengths = [CGFloat(tmp["lineDashLengths"].floatValue)];
                            }
                            
                            if tmp["lineDashPhase"].isExists() {
                                line.lineDashPhase = CGFloat(tmp["lineDashPhase"].floatValue);
                            }
                            
                            if tmp["lineWidth"].isExists() {
                                line.lineWidth = CGFloat(tmp["lineWidth"].floatValue);
                            }
                            
                            if tmp["valueTextColor"].isExists() {
                                line.valueTextColor = RCTConvert.UIColor(tmp["valueTextColor"].intValue);
                            }
                            
                            if tmp["xOffset"].isExists() {
                                line.xOffset = CGFloat(tmp["xOffset"].floatValue);
                            }
                            
                            if tmp["yOffset"].isExists() {
                                line.yOffset = CGFloat(tmp["yOffset"].floatValue);
                            }
                            
                            if tmp["textFontName"].isExists() {
                                line.valueFont = UIFont(
                                    name: tmp["textFontName"].stringValue,
                                    size: line.valueFont.pointSize
                                    )!;
                            }
                            
                            if tmp["textSize"].isExists() {
                                line.valueFont = line.valueFont.fontWithSize(CGFloat(tmp["textSize"].floatValue));
                            }
                            
                            
                            self.xAxis.addLimitLine(line);
                    }
                }
            }
            
            if json["xAxis"]["position"].isExists() {
                switch(json["xAxis"]["position"].stringValue) {
                case "bothSided":
                    self.xAxis.labelPosition = ChartXAxis.XAxisLabelPosition.BothSided;
                    break;
                case "bottom":
                    self.xAxis.labelPosition = ChartXAxis.XAxisLabelPosition.Bottom;
                    break;
                case "bottomInside":
                    self.xAxis.labelPosition = ChartXAxis.XAxisLabelPosition.BottomInside;
                    break;
                case "top":
                    self.xAxis.labelPosition = ChartXAxis.XAxisLabelPosition.Top;
                    break;
                case "topInside":
                    self.xAxis.labelPosition = ChartXAxis.XAxisLabelPosition.TopInside;
                    break;
                default:
                    self.xAxis.labelPosition = ChartXAxis.XAxisLabelPosition.Bottom;
                    break;
                }
            }
            
            if json["xAxis"]["labelRotationAngle"].isExists() {
                self.xAxis.labelRotationAngle = CGFloat(json["xAxis"]["labelRotationAngle"].floatValue);
            }
            
            if json["xAxis"]["drawLimitLinesBehindData"].isExists() {
                self.xAxis.drawLimitLinesBehindDataEnabled = json["xAxis"]["drawLimitLinesBehindData"].boolValue;
            }
            
            if json["xAxis"]["spaceBetweenLabels"].isExists() {
                self.xAxis.spaceBetweenLabels = json["xAxis"]["spaceBetweenLabels"].intValue;
            }
            
        }
        
        // leftAxis
        
        if json["leftAxis"].isExists() {
            if json["leftAxis"]["enabled"].isExists() {
                self.leftAxis.enabled = json["leftAxis"]["enabled"].boolValue;
            }
            
            if json["leftAxis"]["drawAxisLine"].isExists() {
                self.leftAxis.drawAxisLineEnabled = json["leftAxis"]["drawAxisLine"].boolValue;
            }
            
            if json["leftAxis"]["drawGridLines"].isExists() {
                self.leftAxis.drawGridLinesEnabled = json["leftAxis"]["drawGridLines"].boolValue;
            }
            
            if json["leftAxis"]["drawLabels"].isExists() {
                self.leftAxis.drawLabelsEnabled = json["leftAxis"]["drawLabels"].boolValue;
            }
            
            if json["leftAxis"]["textColor"].isExists() {
                self.leftAxis.labelTextColor = RCTConvert.UIColor(json["leftAxis"]["textColor"].intValue);
            }
            
            if json["leftAxis"]["textFontName"].isExists() {
                self.leftAxis.labelFont = UIFont(
                    name: json["leftAxis"]["textFontName"].stringValue,
                    size: self.leftAxis.labelFont.pointSize
                    )!;
            }
            
            if json["leftAxis"]["textSize"].isExists() {
                self.leftAxis.labelFont = self.leftAxis.labelFont.fontWithSize(CGFloat(json["leftAxis"]["textSize"].floatValue));
            }
            
            if json["leftAxis"]["gridColor"].isExists() {
                self.leftAxis.gridColor = RCTConvert.UIColor(json["leftAxis"]["gridColor"].intValue);
            }
            
            if json["leftAxis"]["gridLineWidth"].isExists() {
                self.leftAxis.gridLineWidth = CGFloat(json["leftAxis"]["gridLineWidth"].floatValue);
            }
            
            if json["leftAxis"]["axisLineColor"].isExists() {
                self.leftAxis.axisLineColor = RCTConvert.UIColor(json["leftAxis"]["axisLineColor"].intValue);
            }
            
            if json["leftAxis"]["axisLineWidth"].isExists() {
                self.leftAxis.axisLineWidth = CGFloat(json["leftAxis"]["axisLineWidth"].floatValue);
            }
            
            if json["leftAxis"]["gridDashedLine"].isExists() {
                
                if json["leftAxis"]["gridDashedLine"]["lineLength"].isExists() {
                    self.leftAxis.gridLineDashLengths = [CGFloat(
                        json["leftAxis"]["gridDashedLine"]["lineLength"].floatValue
                        )];
                }
                
                if json["leftAxis"]["gridDashedLine"]["spaceLength"].isExists() {
                    self.leftAxis.gridLineWidth = CGFloat(
                        json["leftAxis"]["gridDashedLine"]["spaceLength"].floatValue
                    );
                }
                
                if json["leftAxis"]["gridDashedLine"]["phase"].isExists() {
                    self.leftAxis.gridLineDashPhase = CGFloat(
                        json["leftAxis"]["gridDashedLine"]["phase"].floatValue
                    );
                }
                
            }
            
            if json["leftAxis"]["limitLines"].isExists() {
                let limitLines = json["leftAxis"]["limitLines"].arrayObject;
                for l in limitLines! {
                    let tmp = JSON(l);
                    
                    if tmp["limit"].isExists() &&
                        tmp["label"].isExists() {
                            
                            let line = ChartLimitLine(
                                limit: tmp["limit"].doubleValue,
                                label: tmp["label"].stringValue
                            );
                            
                            if tmp["position"].isExists() {
                                switch(tmp["position"]) {
                                case "leftBottom":
                                    line.labelPosition = ChartLimitLine.ChartLimitLabelPosition.LeftBottom;
                                    break;
                                case "leftTop":
                                    line.labelPosition = ChartLimitLine.ChartLimitLabelPosition.LeftTop;
                                    break;
                                case "rightBottom":
                                    line.labelPosition = ChartLimitLine.ChartLimitLabelPosition.RightBottom;
                                    break;
                                case "rightTop":
                                    line.labelPosition = ChartLimitLine.ChartLimitLabelPosition.RightTop;
                                    break;
                                default:
                                    line.labelPosition = ChartLimitLine.ChartLimitLabelPosition.RightTop;
                                    break;
                                }
                            }
                            
                            if tmp["lineColor"].isExists() {
                                line.lineColor = RCTConvert.UIColor(tmp["lineColor"].intValue);
                            }
                            
                            if tmp["lineDashLengths"].isExists() {
                                line.lineDashLengths = [CGFloat(tmp["lineDashLengths"].floatValue)];
                            }
                            
                            if tmp["lineDashPhase"].isExists() {
                                line.lineDashPhase = CGFloat(tmp["lineDashPhase"].floatValue);
                            }
                            
                            if tmp["lineWidth"].isExists() {
                                line.lineWidth = CGFloat(tmp["lineWidth"].floatValue);
                            }
                            
                            if tmp["valueTextColor"].isExists() {
                                line.valueTextColor = RCTConvert.UIColor(tmp["valueTextColor"].intValue);
                            }
                            
                            if tmp["xOffset"].isExists() {
                                line.xOffset = CGFloat(tmp["xOffset"].floatValue);
                            }
                            
                            if tmp["yOffset"].isExists() {
                                line.yOffset = CGFloat(tmp["yOffset"].floatValue);
                            }
                            
                            if tmp["textFontName"].isExists() {
                                line.valueFont = UIFont(
                                    name: tmp["textFontName"].stringValue,
                                    size: line.valueFont.pointSize
                                    )!;
                            }
                            
                            if tmp["textSize"].isExists() {
                                line.valueFont = line.valueFont.fontWithSize(CGFloat(tmp["textSize"].floatValue));
                            }
                            
                            self.leftAxis.addLimitLine(line);
                    }
                }
            }
            
            if json["leftAxis"]["position"].isExists() {
                switch(json["leftAxis"]["position"].stringValue) {
                case "inside":
                    self.leftAxis.labelPosition = ChartYAxis.YAxisLabelPosition.InsideChart;
                    break;
                case "outside":
                    self.leftAxis.labelPosition = ChartYAxis.YAxisLabelPosition.OutsideChart;
                    break;
                default:
                    self.leftAxis.labelPosition = ChartYAxis.YAxisLabelPosition.OutsideChart;
                    break;
                }
            }
            
            if json["leftAxis"]["drawLimitLinesBehindData"].isExists() {
                self.leftAxis.drawLimitLinesBehindDataEnabled = json["leftAxis"]["drawLimitLinesBehindData"].boolValue;
            }
            
            if json["leftAxis"]["spaceTop"].isExists() {
                self.leftAxis.spaceTop = CGFloat(json["leftAxis"]["spaceTop"].floatValue);
            }
            
            if json["leftAxis"]["spaceBottom"].isExists() {
                self.leftAxis.spaceBottom = CGFloat(json["leftAxis"]["spaceBottom"].floatValue);
            }
            
            if json["leftAxis"]["startAtZero"].isExists() {
                self.leftAxis.startAtZeroEnabled = json["leftAxis"]["startAtZeroEnabled"].boolValue;
            }
            
            if json["leftAxis"]["axisMinimum"].isExists() {
                self.leftAxis.axisMinimum = json["leftAxis"]["axisMinimum"].doubleValue;
            }
            
            if json["leftAxis"]["axisMaximum"].isExists() {
                self.leftAxis.axisMaximum = json["leftAxis"]["axisMaximum"].doubleValue;
            }
            
        }
        
        // rightAxis
        
        if json["rightAxis"].isExists() {
            if json["rightAxis"]["enabled"].isExists() {
                self.rightAxis.enabled = json["rightAxis"]["enabled"].boolValue;
            }
            
            if json["rightAxis"]["drawAxisLine"].isExists() {
                self.rightAxis.drawAxisLineEnabled = json["rightAxis"]["drawAxisLine"].boolValue;
            }
            
            if json["rightAxis"]["drawGridLines"].isExists() {
                self.rightAxis.drawGridLinesEnabled = json["rightAxis"]["drawGridLines"].boolValue;
            }
            
            if json["rightAxis"]["drawLabels"].isExists() {
                self.rightAxis.drawLabelsEnabled = json["rightAxis"]["drawLabels"].boolValue;
            }
            
            if json["rightAxis"]["textColor"].isExists() {
                self.rightAxis.labelTextColor = RCTConvert.UIColor(json["rightAxis"]["textColor"].intValue);
            }
            
            if json["rightAxis"]["textFontName"].isExists() {
                self.rightAxis.labelFont = UIFont(
                    name: json["rightAxis"]["textFontName"].stringValue,
                    size: self.rightAxis.labelFont.pointSize
                    )!;
            }
            
            if json["rightAxis"]["textSize"].isExists() {
                self.rightAxis.labelFont = self.rightAxis.labelFont.fontWithSize(CGFloat(json["rightAxis"]["textSize"].floatValue));
            }
            
            if json["rightAxis"]["gridColor"].isExists() {
                self.rightAxis.gridColor = RCTConvert.UIColor(json["rightAxis"]["gridColor"].intValue);
            }
            
            if json["rightAxis"]["gridLineWidth"].isExists() {
                self.rightAxis.gridLineWidth = CGFloat(json["rightAxis"]["gridLineWidth"].floatValue);
            }
            
            if json["rightAxis"]["axisLineColor"].isExists() {
                self.rightAxis.axisLineColor = RCTConvert.UIColor(json["rightAxis"]["axisLineColor"].intValue);
            }
            
            if json["rightAxis"]["axisLineWidth"].isExists() {
                self.rightAxis.axisLineWidth = CGFloat(json["rightAxis"]["axisLineWidth"].floatValue);
            }
            
            if json["rightAxis"]["gridDashedLine"].isExists() {
                
                if json["rightAxis"]["gridDashedLine"]["lineLength"].isExists() {
                    self.rightAxis.gridLineDashLengths = [CGFloat(
                        json["rightAxis"]["gridDashedLine"]["lineLength"].floatValue
                        )];
                }
                
                if json["rightAxis"]["gridDashedLine"]["spaceLength"].isExists() {
                    self.rightAxis.gridLineWidth = CGFloat(
                        json["rightAxis"]["gridDashedLine"]["spaceLength"].floatValue
                    );
                }
                
                if json["rightAxis"]["gridDashedLine"]["phase"].isExists() {
                    self.rightAxis.gridLineDashPhase = CGFloat(
                        json["rightAxis"]["gridDashedLine"]["phase"].floatValue
                    );
                }
                
            }
            
            if json["rightAxis"]["limitLines"].isExists() {
                let limitLines = json["rightAxis"]["limitLines"].arrayObject;
                for l in limitLines! {
                    let tmp = JSON(l);
                    
                    if tmp["limit"].isExists() &&
                        tmp["label"].isExists() {
                            
                            let line = ChartLimitLine(
                                limit: tmp["limit"].doubleValue,
                                label: tmp["label"].stringValue
                            );
                            
                            if tmp["position"].isExists() {
                                switch(tmp["position"]) {
                                case "leftBottom":
                                    line.labelPosition = ChartLimitLine.ChartLimitLabelPosition.LeftBottom;
                                    break;
                                case "leftTop":
                                    line.labelPosition = ChartLimitLine.ChartLimitLabelPosition.LeftTop;
                                    break;
                                case "rightBottom":
                                    line.labelPosition = ChartLimitLine.ChartLimitLabelPosition.RightBottom;
                                    break;
                                case "rightTop":
                                    line.labelPosition = ChartLimitLine.ChartLimitLabelPosition.RightTop;
                                    break;
                                default:
                                    line.labelPosition = ChartLimitLine.ChartLimitLabelPosition.RightTop;
                                    break;
                                }
                            }
                            
                            if tmp["lineColor"].isExists() {
                                line.lineColor = RCTConvert.UIColor(tmp["lineColor"].intValue);
                            }
                            
                            if tmp["lineDashLengths"].isExists() {
                                line.lineDashLengths = [CGFloat(tmp["lineDashLengths"].floatValue)];
                            }
                            
                            if tmp["lineDashPhase"].isExists() {
                                line.lineDashPhase = CGFloat(tmp["lineDashPhase"].floatValue);
                            }
                            
                            if tmp["lineWidth"].isExists() {
                                line.lineWidth = CGFloat(tmp["lineWidth"].floatValue);
                            }
                            
                            if tmp["valueTextColor"].isExists() {
                                line.valueTextColor = RCTConvert.UIColor(tmp["valueTextColor"].intValue);
                            }
                            
                            if tmp["xOffset"].isExists() {
                                line.xOffset = CGFloat(tmp["xOffset"].floatValue);
                            }
                            
                            if tmp["yOffset"].isExists() {
                                line.yOffset = CGFloat(tmp["yOffset"].floatValue);
                            }
                            
                            if tmp["textFontName"].isExists() {
                                line.valueFont = UIFont(
                                    name: tmp["textFontName"].stringValue,
                                    size: line.valueFont.pointSize
                                    )!;
                            }
                            
                            if tmp["textSize"].isExists() {
                                line.valueFont = line.valueFont.fontWithSize(CGFloat(tmp["textSize"].floatValue));
                            }
                            
                            self.rightAxis.addLimitLine(line);
                    }
                }
            }
            
            if json["rightAxis"]["position"].isExists() {
                switch(json["rightAxis"]["position"].stringValue) {
                case "inside":
                    self.rightAxis.labelPosition = ChartYAxis.YAxisLabelPosition.InsideChart;
                    break;
                case "outside":
                    self.rightAxis.labelPosition = ChartYAxis.YAxisLabelPosition.OutsideChart;
                    break;
                default:
                    self.rightAxis.labelPosition = ChartYAxis.YAxisLabelPosition.OutsideChart;
                    break;
                }
            }
            
            if json["rightAxis"]["drawLimitLinesBehindData"].isExists() {
                self.rightAxis.drawLimitLinesBehindDataEnabled = json["rightAxis"]["drawLimitLinesBehindData"].boolValue;
            }
            
            if json["rightAxis"]["spaceTop"].isExists() {
                self.rightAxis.spaceTop = CGFloat(json["rightAxis"]["spaceTop"].floatValue);
            }
            
            if json["rightAxis"]["spaceBottom"].isExists() {
                self.rightAxis.spaceBottom = CGFloat(json["rightAxis"]["spaceBottom"].floatValue);
            }
            
            if json["rightAxis"]["startAtZero"].isExists() {
                self.rightAxis.startAtZeroEnabled = json["rightAxis"]["startAtZeroEnabled"].boolValue;
            }
            
            if json["rightAxis"]["axisMinimum"].isExists() {
                self.rightAxis.axisMinimum = json["rightAxis"]["axisMinimum"].doubleValue;
            }
            
            if json["rightAxis"]["axisMaximum"].isExists() {
                self.rightAxis.axisMaximum = json["rightAxis"]["axisMaximum"].doubleValue;
            }
        }
        
        if json["animation"].isExists() {
            let xAxisDuration = json["animation"]["xAxisDuration"].isExists() ?
                json["animation"]["xAxisDuration"].doubleValue : 0;
            let yAxisDuration = json["animation"]["yAxisDuration"].isExists() ?
                json["animation"]["yAxisDuration"].doubleValue : 0;
            
            var easingOption: ChartEasingOption = .Linear;
            
            if json["animation"]["easingOption"].isExists() {
                switch(json["animation"]["easingOption"]) {
                case "linear":
                    easingOption = .Linear;
                    break;
                case "easeInQuad":
                    easingOption = .EaseInQuad;
                    break;
                case "easeOutQuad":
                    easingOption = .EaseOutQuad;
                    break;
                case "easeInOutQuad":
                    easingOption = .EaseInOutQuad;
                    break;
                case "easeInCubic":
                    easingOption = .EaseInCubic;
                    break;
                case "easeOutCubic":
                    easingOption = .EaseOutCubic;
                    break;
                case "easeInOutCubic":
                    easingOption = .EaseInOutCubic;
                    break;
                case "easeInQuart":
                    easingOption = .EaseInQuart;
                    break;
                case "easeOutQuart":
                    easingOption = .EaseOutQuart;
                    break;
                case "easeInOutQuart":
                    easingOption = .EaseInOutQuart;
                    break;
                case "easeInQuint":
                    easingOption = .EaseInQuint;
                    break;
                case "easeOutQuint":
                    easingOption = .EaseOutQuint;
                    break;
                case "easeInOutQuint":
                    easingOption = .EaseInOutQuint;
                    break;
                case "easeInSine":
                    easingOption = .EaseInSine;
                    break;
                case "easeOutSine":
                    easingOption = .EaseOutSine;
                    break;
                case "easeInOutSine":
                    easingOption = .EaseInOutSine;
                    break;
                case "easeInExpo":
                    easingOption = .EaseInExpo;
                    break;
                case "easeOutExpo":
                    easingOption = .EaseOutExpo;
                    break;
                case "easeInOutExpo":
                    easingOption = .EaseInOutExpo;
                    break;
                case "easeInCirc":
                    easingOption = .EaseInCirc;
                    break;
                case "easeOutCirc":
                    easingOption = .EaseOutCirc;
                    break;
                case "easeInOutCirc":
                    easingOption = .EaseInOutCirc;
                    break;
                case "easeInElastic":
                    easingOption = .EaseInElastic;
                    break;
                case "easeOutElastic":
                    easingOption = .EaseOutElastic;
                    break;
                case "easeInBack":
                    easingOption = .EaseInBack;
                    break;
                case "easeOutBack":
                    easingOption = .EaseOutBack;
                    break;
                case "easeInOutBack":
                    easingOption = .EaseInOutBack;
                    break;
                case "easeInBounce":
                    easingOption = .EaseInBounce;
                    break;
                case "easeOutBounce":
                    easingOption = .EaseOutBounce;
                    break;
                case "easeInOutBounce":
                    easingOption = .EaseInOutBounce;
                    break;
                default:
                    easingOption = .Linear;
                    break;
                }
            }
            
            self.animate(xAxisDuration: xAxisDuration, yAxisDuration: yAxisDuration, easingOption: easingOption);
        }
        
        if json["valueFormatter"].isExists() {
            if json["valueFormatter"]["decimalPlaces"].isExists() {
                self.decimalPlaces = json["valueFormatter"]["decimalPlaces"].intValue;
            }
            
            if json["valueFormatter"]["type"].isExists() {
                switch(json["valueFormatter"]["type"]) {
                case "regular":
                    self.leftAxis.valueFormatter = NSNumberFormatter();
                    self.rightAxis.valueFormatter = NSNumberFormatter();
                    break;
                case "abbreviated":
                    self.leftAxis.valueFormatter = ABNumberFormatter(decimalPlaces: self.decimalPlaces);
                    self.rightAxis.valueFormatter = ABNumberFormatter(decimalPlaces: self.decimalPlaces);
                    break;
                default:
                    self.leftAxis.valueFormatter = NSNumberFormatter();
                    self.rightAxis.valueFormatter = NSNumberFormatter();
                }
            }
            
            if json["valueFormatter"]["numberStyle"].isExists() {
                switch(json["valueFormatter"]["numberStyle"]) {
                case "CurrencyAccountingStyle":
                    if #available(iOS 9.0, *) {
                        self.leftAxis.valueFormatter?.numberStyle = .CurrencyAccountingStyle;
                        self.rightAxis.valueFormatter?.numberStyle = .CurrencyAccountingStyle
                    }
                    break;
                case "CurrencyISOCodeStyle":
                    if #available(iOS 9.0, *) {
                        self.leftAxis.valueFormatter?.numberStyle = .CurrencyISOCodeStyle;
                        self.rightAxis.valueFormatter?.numberStyle = .CurrencyISOCodeStyle;
                    }
                    break;
                case "CurrencyPluralStyle":
                    if #available(iOS 9.0, *) {
                        self.leftAxis.valueFormatter?.numberStyle = .CurrencyPluralStyle;
                        self.rightAxis.valueFormatter?.numberStyle = .CurrencyPluralStyle;
                    }
                    break;
                case "CurrencyStyle":
                    self.leftAxis.valueFormatter?.numberStyle = .CurrencyStyle;
                    self.rightAxis.valueFormatter?.numberStyle = .CurrencyStyle;
                    break;
                case "DecimalStyle":
                    self.leftAxis.valueFormatter?.numberStyle = .DecimalStyle;
                    self.rightAxis.valueFormatter?.numberStyle = .DecimalStyle;
                    break;
                case "NoStyle":
                    self.leftAxis.valueFormatter?.numberStyle = .NoStyle;
                    self.rightAxis.valueFormatter?.numberStyle = .NoStyle;
                    break;
                case "OrdinalStyle":
                    if #available(iOS 9.0, *) {
                        self.leftAxis.valueFormatter?.numberStyle = .OrdinalStyle
                        self.rightAxis.valueFormatter?.numberStyle = .OrdinalStyle
                    }
                    break;
                case "PercentStyle":
                    self.leftAxis.valueFormatter?.numberStyle = .PercentStyle;
                    self.rightAxis.valueFormatter?.numberStyle = .PercentStyle;
                    break;
                case "ScientificStyle":
                    self.leftAxis.valueFormatter?.numberStyle = .ScientificStyle;
                    self.rightAxis.valueFormatter?.numberStyle = .ScientificStyle;
                    break;
                case "SpellOutStyle":
                    self.leftAxis.valueFormatter?.numberStyle = .SpellOutStyle;
                    self.rightAxis.valueFormatter?.numberStyle = .SpellOutStyle;
                    break;
                default:
                    self.leftAxis.valueFormatter?.numberStyle = .NoStyle;
                    self.rightAxis.valueFormatter?.numberStyle = .NoStyle;
                }
            }
            
            self.leftAxis.valueFormatter?.maximumFractionDigits = self.decimalPlaces;
            self.rightAxis.valueFormatter?.maximumFractionDigits = self.decimalPlaces;
        }
        
    }
    
}