//
//  BarLineChartViewBaseExtension.swift
//  PoliRank
//
//  Created by Jose Padilla on 2/8/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

import SwiftyJSON
import Charts

extension BarLineChartViewBase {

    func setBarLineChartViewBaseProps(config: String!) {
        setChartViewBaseProps(config);

        var maximumDecimalPlaces: Int = 0;
        var minimumDecimalPlaces: Int = 0;

        var json: JSON = nil;
        if let data = config.dataUsingEncoding(NSUTF8StringEncoding) {
            json = JSON(data: data);
        };

        if json["gridBackgroundColor"].isExists() {
            self.gridBackgroundColor = RCTConvert.UIColor(json["gridBackgroundColor"].intValue);
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

        if json["minOffset"].isExists() {
            self.minOffset = CGFloat(json["minOffset"].floatValue);
        }

        if json["autoScaleMinMax"].isExists() {
            self.autoScaleMinMaxEnabled = json["autoScaleMinMax"].boolValue;
        }

        if json["dragEnabled"].isExists() {
          self.dragEnabled = json["dragEnabled"].boolValue;
        }

        if json["scaleXEnabled"].isExists() {
          self.scaleXEnabled = json["scaleXEnabled"].boolValue;
        }

        if json["scaleYEnabled"].isExists() {
          self.scaleYEnabled = json["scaleYEnabled"].boolValue;
        }

        if json["pinchZoomEnabled"].isExists() {
          self.pinchZoomEnabled = json["pinchZoomEnabled"].boolValue;
        }

        if json["doubleTapToZoomEnabled"].isExists() {
          self.doubleTapToZoomEnabled = json["doubleTapToZoomEnabled"].boolValue;
        }

        if json["highlightPerDragEnabled"].isExists() {
          self.highlightPerDragEnabled = json["highlightPerDragEnabled"].boolValue;
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
                self.leftAxis.customAxisMin = json["leftAxis"]["axisMinimum"].doubleValue;
            }

            if json["leftAxis"]["axisMaximum"].isExists() {
                self.leftAxis.customAxisMax = json["leftAxis"]["axisMaximum"].doubleValue;
            }

            if json["leftAxis"]["labelCount"].isExists() {
              self.leftAxis.labelCount = json["leftAxis"]["labelCount"].intValue;
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
                self.rightAxis.customAxisMin = json["rightAxis"]["axisMinimum"].doubleValue;
            }

            if json["rightAxis"]["axisMaximum"].isExists() {
                self.rightAxis.customAxisMax = json["rightAxis"]["axisMaximum"].doubleValue;
            }

            if json["rightAxis"]["labelCount"].isExists() {
              self.rightAxis.labelCount = json["rightAxis"]["labelCount"].intValue;
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
                    self.leftAxis.valueFormatter = NSNumberFormatter();
                    self.rightAxis.valueFormatter = NSNumberFormatter();
                    break;
                case "abbreviated":
                    self.leftAxis.valueFormatter = ABNumberFormatter(minimumDecimalPlaces: minimumDecimalPlaces, maximumDecimalPlaces: maximumDecimalPlaces);
                    self.rightAxis.valueFormatter = ABNumberFormatter(minimumDecimalPlaces: minimumDecimalPlaces, maximumDecimalPlaces: maximumDecimalPlaces);
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
                        self.rightAxis.valueFormatter?.numberStyle = .CurrencyAccountingStyle;
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
                        self.rightAxis.valueFormatter?.numberStyle = .OrdinalStyle;
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

            self.leftAxis.valueFormatter?.minimumFractionDigits = minimumDecimalPlaces;
            self.rightAxis.valueFormatter?.minimumFractionDigits = minimumDecimalPlaces;
            self.leftAxis.valueFormatter?.maximumFractionDigits = maximumDecimalPlaces;
            self.rightAxis.valueFormatter?.maximumFractionDigits = maximumDecimalPlaces;
        }
        
        if json["viewport"].isExists() {
            
            if json["viewport"]["left"].isExists() &&
                json["viewport"]["top"].isExists() &&
                json["viewport"]["right"].isExists() &&
                json["viewport"]["bottom"].isExists() {
                
                self.setViewPortOffsets(
                    left: CGFloat(json["viewport"]["left"].floatValue),
                    top: CGFloat(json["viewport"]["top"].floatValue),
                    right: CGFloat(json["viewport"]["right"].floatValue),
                    bottom: CGFloat(json["viewport"]["bottom"].floatValue)
                )
            }
        }
    }
}
