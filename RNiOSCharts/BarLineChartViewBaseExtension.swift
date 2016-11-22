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

    func setBarLineChartViewBaseProps(_ config: String!) {
        setChartViewBaseProps(config);

        var maximumDecimalPlaces: Int = 0;
        var minimumDecimalPlaces: Int = 0;

        var json: JSON = nil;
        if let data = config.data(using: String.Encoding.utf8) {
            json = JSON(data: data);
        };

        if json["gridBackgroundColor"].exists() {
            self.gridBackgroundColor = RCTConvert.uiColor(json["gridBackgroundColor"].intValue);
        }

        if json["drawBorders"].exists() {
            self.drawBordersEnabled = json["drawBorders"].boolValue;
        }

        if json["borderColor"].exists() {
            self.borderColor = RCTConvert.uiColor(json["borderColor"].intValue);
        }

        if json["borderLineWidth"].exists() {
            self.borderLineWidth = CGFloat(json["borderLineWidth"].floatValue);
        }

        if json["minOffset"].exists() {
            self.minOffset = CGFloat(json["minOffset"].floatValue);
        }

        if json["autoScaleMinMax"].exists() {
            self.autoScaleMinMaxEnabled = json["autoScaleMinMax"].boolValue;
        }

        if json["dragEnabled"].exists() {
          self.dragEnabled = json["dragEnabled"].boolValue;
        }

        if json["scaleXEnabled"].exists() {
          self.scaleXEnabled = json["scaleXEnabled"].boolValue;
        }

        if json["scaleYEnabled"].exists() {
          self.scaleYEnabled = json["scaleYEnabled"].boolValue;
        }

        if json["pinchZoomEnabled"].exists() {
          self.pinchZoomEnabled = json["pinchZoomEnabled"].boolValue;
        }

        if json["doubleTapToZoomEnabled"].exists() {
          self.doubleTapToZoomEnabled = json["doubleTapToZoomEnabled"].boolValue;
        }

        if json["highlightPerDragEnabled"].exists() {
          self.highlightPerDragEnabled = json["highlightPerDragEnabled"].boolValue;
        }

        // xAxis

        if json["xAxis"].exists() {
            if json["xAxis"]["enabled"].exists() {
                self.xAxis.enabled = json["xAxis"]["enabled"].boolValue;
            }

            if json["xAxis"]["drawAxisLine"].exists() {
                self.xAxis.drawAxisLineEnabled = json["xAxis"]["drawAxisLine"].boolValue;
            }

            if json["xAxis"]["drawGridLines"].exists() {
                self.xAxis.drawGridLinesEnabled = json["xAxis"]["drawGridLines"].boolValue;
            }

            if json["xAxis"]["drawLabels"].exists() {
                self.xAxis.drawLabelsEnabled = json["xAxis"]["drawLabels"].boolValue;
            }

            if json["xAxis"]["textColor"].exists() {
                self.xAxis.labelTextColor = RCTConvert.uiColor(json["xAxis"]["textColor"].intValue);
            }

            if json["xAxis"]["textFontName"].exists() {
                self.xAxis.labelFont = UIFont(
                    name: json["xAxis"]["textFontName"].stringValue,
                    size: self.xAxis.labelFont.pointSize
                    )!;
            }

            if json["xAxis"]["textSize"].exists() {
                self.xAxis.labelFont = self.xAxis.labelFont.withSize(CGFloat(json["xAxis"]["textSize"].floatValue));
            }

            if json["xAxis"]["gridColor"].exists() {
                self.xAxis.gridColor = RCTConvert.uiColor(json["xAxis"]["gridColor"].intValue);
            }

            if json["xAxis"]["gridLineWidth"].exists() {
                self.xAxis.gridLineWidth = CGFloat(json["xAxis"]["gridLineWidth"].floatValue);
            }

            if json["xAxis"]["axisLineColor"].exists() {
                self.xAxis.axisLineColor = RCTConvert.uiColor(json["xAxis"]["axisLineColor"].intValue);
            }

            if json["xAxis"]["axisLineWidth"].exists() {
                self.xAxis.axisLineWidth = CGFloat(json["xAxis"]["axisLineWidth"].floatValue);
            }

            if json["xAxis"]["gridDashedLine"].exists() {

                if json["xAxis"]["gridDashedLine"]["lineLength"].exists() {
                    self.xAxis.gridLineDashLengths = [CGFloat(
                        json["xAxis"]["gridDashedLine"]["lineLength"].floatValue
                        )];
                }

                if json["xAxis"]["gridDashedLine"]["spaceLength"].exists() {
                    self.xAxis.gridLineWidth = CGFloat(
                        json["xAxis"]["gridDashedLine"]["spaceLength"].floatValue
                    );
                }

                if json["xAxis"]["gridDashedLine"]["phase"].exists() {
                    self.xAxis.gridLineDashPhase = CGFloat(
                        json["xAxis"]["gridDashedLine"]["phase"].floatValue
                    );
                }

            }

            if json["xAxis"]["limitLines"].exists() {
                let limitLines = json["xAxis"]["limitLines"].arrayObject;
                for l in limitLines! {
                    let tmp = JSON(l);

                    if tmp["limit"].exists() &&
                        tmp["label"].exists() {

                            let line = ChartLimitLine(
                                limit: tmp["limit"].doubleValue,
                                label: tmp["label"].stringValue
                            );

                            if tmp["position"].exists() {
                                switch(tmp["position"]) {
                                case "leftBottom":
                                    line.labelPosition = ChartLimitLine.LabelPosition.leftBottom;
                                    break;
                                case "leftTop":
                                    line.labelPosition = ChartLimitLine.LabelPosition.leftTop;
                                    break;
                                case "rightBottom":
                                    line.labelPosition = ChartLimitLine.LabelPosition.rightBottom;
                                    break;
                                case "rightTop":
                                    line.labelPosition = ChartLimitLine.LabelPosition.rightTop;
                                    break;
                                default:
                                    line.labelPosition = ChartLimitLine.LabelPosition.rightTop;
                                    break;
                                }
                            }

                            if tmp["lineColor"].exists() {
                                line.lineColor = RCTConvert.uiColor(tmp["lineColor"].intValue);
                            }

                            if tmp["lineDashLengths"].exists() {
                                line.lineDashLengths = [CGFloat(tmp["lineDashLengths"].floatValue)];
                            }

                            if tmp["lineDashPhase"].exists() {
                                line.lineDashPhase = CGFloat(tmp["lineDashPhase"].floatValue);
                            }

                            if tmp["lineWidth"].exists() {
                                line.lineWidth = CGFloat(tmp["lineWidth"].floatValue);
                            }

                            if tmp["valueTextColor"].exists() {
                                line.valueTextColor = RCTConvert.uiColor(tmp["valueTextColor"].intValue);
                            }

                            if tmp["xOffset"].exists() {
                                line.xOffset = CGFloat(tmp["xOffset"].floatValue);
                            }

                            if tmp["yOffset"].exists() {
                                line.yOffset = CGFloat(tmp["yOffset"].floatValue);
                            }

                            if tmp["textFontName"].exists() {
                                line.valueFont = UIFont(
                                    name: tmp["textFontName"].stringValue,
                                    size: line.valueFont.pointSize
                                    )!;
                            }

                            if tmp["textSize"].exists() {
                                line.valueFont = line.valueFont.withSize(CGFloat(tmp["textSize"].floatValue));
                            }


                            self.xAxis.addLimitLine(line);
                    }
                }
            }

            if json["xAxis"]["position"].exists() {
                switch(json["xAxis"]["position"].stringValue) {
                case "bothSided":
                    self.xAxis.labelPosition = ChartXAxis.LabelPosition.bothSided;
                    break;
                case "bottom":
                    self.xAxis.labelPosition = ChartXAxis.LabelPosition.bottom;
                    break;
                case "bottomInside":
                    self.xAxis.labelPosition = ChartXAxis.LabelPosition.bottomInside;
                    break;
                case "top":
                    self.xAxis.labelPosition = ChartXAxis.LabelPosition.top;
                    break;
                case "topInside":
                    self.xAxis.labelPosition = ChartXAxis.LabelPosition.topInside;
                    break;
                default:
                    self.xAxis.labelPosition = ChartXAxis.LabelPosition.bottom;
                    break;
                }
            }

            if json["xAxis"]["labelRotationAngle"].exists() {
                self.xAxis.labelRotationAngle = CGFloat(json["xAxis"]["labelRotationAngle"].floatValue);
            }

            if json["xAxis"]["drawLimitLinesBehindData"].exists() {
                self.xAxis.drawLimitLinesBehindDataEnabled = json["xAxis"]["drawLimitLinesBehindData"].boolValue;
            }

            if json["xAxis"]["spaceBetweenLabels"].exists() {
                self.xAxis.spaceBetweenLabels = json["xAxis"]["spaceBetweenLabels"].intValue;
            }

            if json["xAxis"]["avoidFirstLastClippingEnabled"].exists() {
                self.xAxis.avoidFirstLastClippingEnabled = json["xAxis"]["avoidFirstLastClippingEnabled"].boolValue;
            }

        }

        // leftAxis

        if json["leftAxis"].exists() {
            if json["leftAxis"]["enabled"].exists() {
                self.leftAxis.enabled = json["leftAxis"]["enabled"].boolValue;
            }

            if json["leftAxis"]["drawAxisLine"].exists() {
                self.leftAxis.drawAxisLineEnabled = json["leftAxis"]["drawAxisLine"].boolValue;
            }

            if json["leftAxis"]["drawGridLines"].exists() {
                self.leftAxis.drawGridLinesEnabled = json["leftAxis"]["drawGridLines"].boolValue;
            }

            if json["leftAxis"]["drawLabels"].exists() {
                self.leftAxis.drawLabelsEnabled = json["leftAxis"]["drawLabels"].boolValue;
            }

            if json["leftAxis"]["textColor"].exists() {
                self.leftAxis.labelTextColor = RCTConvert.uiColor(json["leftAxis"]["textColor"].intValue);
            }

            if json["leftAxis"]["textFontName"].exists() {
                self.leftAxis.labelFont = UIFont(
                    name: json["leftAxis"]["textFontName"].stringValue,
                    size: self.leftAxis.labelFont.pointSize
                    )!;
            }

            if json["leftAxis"]["textSize"].exists() {
                self.leftAxis.labelFont = self.leftAxis.labelFont.withSize(CGFloat(json["leftAxis"]["textSize"].floatValue));
            }

            if json["leftAxis"]["gridColor"].exists() {
                self.leftAxis.gridColor = RCTConvert.uiColor(json["leftAxis"]["gridColor"].intValue);
            }

            if json["leftAxis"]["gridLineWidth"].exists() {
                self.leftAxis.gridLineWidth = CGFloat(json["leftAxis"]["gridLineWidth"].floatValue);
            }

            if json["leftAxis"]["axisLineColor"].exists() {
                self.leftAxis.axisLineColor = RCTConvert.uiColor(json["leftAxis"]["axisLineColor"].intValue);
            }

            if json["leftAxis"]["axisLineWidth"].exists() {
                self.leftAxis.axisLineWidth = CGFloat(json["leftAxis"]["axisLineWidth"].floatValue);
            }

            if json["leftAxis"]["gridDashedLine"].exists() {

                if json["leftAxis"]["gridDashedLine"]["lineLength"].exists() {
                    self.leftAxis.gridLineDashLengths = [CGFloat(
                        json["leftAxis"]["gridDashedLine"]["lineLength"].floatValue
                        )];
                }

                if json["leftAxis"]["gridDashedLine"]["spaceLength"].exists() {
                    self.leftAxis.gridLineWidth = CGFloat(
                        json["leftAxis"]["gridDashedLine"]["spaceLength"].floatValue
                    );
                }

                if json["leftAxis"]["gridDashedLine"]["phase"].exists() {
                    self.leftAxis.gridLineDashPhase = CGFloat(
                        json["leftAxis"]["gridDashedLine"]["phase"].floatValue
                    );
                }

            }

            if json["leftAxis"]["limitLines"].exists() {
                let limitLines = json["leftAxis"]["limitLines"].arrayObject;
                for l in limitLines! {
                    let tmp = JSON(l);

                    if tmp["limit"].exists() &&
                        tmp["label"].exists() {

                            let line = ChartLimitLine(
                                limit: tmp["limit"].doubleValue,
                                label: tmp["label"].stringValue
                            );

                            if tmp["position"].exists() {
                                switch(tmp["position"]) {
                                case "leftBottom":
                                    line.labelPosition = ChartLimitLine.LabelPosition.leftBottom;
                                    break;
                                case "leftTop":
                                    line.labelPosition = ChartLimitLine.LabelPosition.leftTop;
                                    break;
                                case "rightBottom":
                                    line.labelPosition = ChartLimitLine.LabelPosition.rightBottom;
                                    break;
                                case "rightTop":
                                    line.labelPosition = ChartLimitLine.LabelPosition.rightTop;
                                    break;
                                default:
                                    line.labelPosition = ChartLimitLine.LabelPosition.rightTop;
                                    break;
                                }
                            }

                            if tmp["lineColor"].exists() {
                                line.lineColor = RCTConvert.uiColor(tmp["lineColor"].intValue);
                            }

                            if tmp["lineDashLengths"].exists() {
                                line.lineDashLengths = [CGFloat(tmp["lineDashLengths"].floatValue)];
                            }

                            if tmp["lineDashPhase"].exists() {
                                line.lineDashPhase = CGFloat(tmp["lineDashPhase"].floatValue);
                            }

                            if tmp["lineWidth"].exists() {
                                line.lineWidth = CGFloat(tmp["lineWidth"].floatValue);
                            }

                            if tmp["valueTextColor"].exists() {
                                line.valueTextColor = RCTConvert.uiColor(tmp["valueTextColor"].intValue);
                            }

                            if tmp["xOffset"].exists() {
                                line.xOffset = CGFloat(tmp["xOffset"].floatValue);
                            }

                            if tmp["yOffset"].exists() {
                                line.yOffset = CGFloat(tmp["yOffset"].floatValue);
                            }

                            if tmp["textFontName"].exists() {
                                line.valueFont = UIFont(
                                    name: tmp["textFontName"].stringValue,
                                    size: line.valueFont.pointSize
                                    )!;
                            }

                            if tmp["textSize"].exists() {
                                line.valueFont = line.valueFont.withSize(CGFloat(tmp["textSize"].floatValue));
                            }

                            self.leftAxis.addLimitLine(line);
                    }
                }
            }

            if json["leftAxis"]["position"].exists() {
                switch(json["leftAxis"]["position"].stringValue) {
                case "inside":
                    self.leftAxis.labelPosition = ChartYAxis.LabelPosition.insideChart;
                    break;
                case "outside":
                    self.leftAxis.labelPosition = ChartYAxis.LabelPosition.outsideChart;
                    break;
                default:
                    self.leftAxis.labelPosition = ChartYAxis.LabelPosition.outsideChart;
                    break;
                }
            }

            if json["leftAxis"]["drawLimitLinesBehindData"].exists() {
                self.leftAxis.drawLimitLinesBehindDataEnabled = json["leftAxis"]["drawLimitLinesBehindData"].boolValue;
            }

            if json["leftAxis"]["spaceTop"].exists() {
                self.leftAxis.spaceTop = CGFloat(json["leftAxis"]["spaceTop"].floatValue);
            }

            if json["leftAxis"]["spaceBottom"].exists() {
                self.leftAxis.spaceBottom = CGFloat(json["leftAxis"]["spaceBottom"].floatValue);
            }

            if json["leftAxis"]["startAtZero"].exists() {
                self.leftAxis.startAtZeroEnabled = json["leftAxis"]["startAtZeroEnabled"].boolValue;
            }

            if json["leftAxis"]["axisMinimum"].exists() {
                self.leftAxis.axisMinValue = json["leftAxis"]["axisMinimum"].doubleValue;
            }

            if json["leftAxis"]["axisMaximum"].exists() {
                self.leftAxis.axisMaxValue = json["leftAxis"]["axisMaximum"].doubleValue;
            }

            if json["leftAxis"]["labelCount"].exists() {
              self.leftAxis.labelCount = json["leftAxis"]["labelCount"].intValue;
            }

        }

        // rightAxis

        if json["rightAxis"].exists() {
            if json["rightAxis"]["enabled"].exists() {
                self.rightAxis.enabled = json["rightAxis"]["enabled"].boolValue;
            }

            if json["rightAxis"]["drawAxisLine"].exists() {
                self.rightAxis.drawAxisLineEnabled = json["rightAxis"]["drawAxisLine"].boolValue;
            }

            if json["rightAxis"]["drawGridLines"].exists() {
                self.rightAxis.drawGridLinesEnabled = json["rightAxis"]["drawGridLines"].boolValue;
            }

            if json["rightAxis"]["drawLabels"].exists() {
                self.rightAxis.drawLabelsEnabled = json["rightAxis"]["drawLabels"].boolValue;
            }

            if json["rightAxis"]["textColor"].exists() {
                self.rightAxis.labelTextColor = RCTConvert.uiColor(json["rightAxis"]["textColor"].intValue);
            }

            if json["rightAxis"]["textFontName"].exists() {
                self.rightAxis.labelFont = UIFont(
                    name: json["rightAxis"]["textFontName"].stringValue,
                    size: self.rightAxis.labelFont.pointSize
                    )!;
            }

            if json["rightAxis"]["textSize"].exists() {
                self.rightAxis.labelFont = self.rightAxis.labelFont.withSize(CGFloat(json["rightAxis"]["textSize"].floatValue));
            }

            if json["rightAxis"]["gridColor"].exists() {
                self.rightAxis.gridColor = RCTConvert.uiColor(json["rightAxis"]["gridColor"].intValue);
            }

            if json["rightAxis"]["gridLineWidth"].exists() {
                self.rightAxis.gridLineWidth = CGFloat(json["rightAxis"]["gridLineWidth"].floatValue);
            }

            if json["rightAxis"]["axisLineColor"].exists() {
                self.rightAxis.axisLineColor = RCTConvert.uiColor(json["rightAxis"]["axisLineColor"].intValue);
            }

            if json["rightAxis"]["axisLineWidth"].exists() {
                self.rightAxis.axisLineWidth = CGFloat(json["rightAxis"]["axisLineWidth"].floatValue);
            }

            if json["rightAxis"]["gridDashedLine"].exists() {

                if json["rightAxis"]["gridDashedLine"]["lineLength"].exists() {
                    self.rightAxis.gridLineDashLengths = [CGFloat(
                        json["rightAxis"]["gridDashedLine"]["lineLength"].floatValue
                        )];
                }

                if json["rightAxis"]["gridDashedLine"]["spaceLength"].exists() {
                    self.rightAxis.gridLineWidth = CGFloat(
                        json["rightAxis"]["gridDashedLine"]["spaceLength"].floatValue
                    );
                }

                if json["rightAxis"]["gridDashedLine"]["phase"].exists() {
                    self.rightAxis.gridLineDashPhase = CGFloat(
                        json["rightAxis"]["gridDashedLine"]["phase"].floatValue
                    );
                }

            }

            if json["rightAxis"]["limitLines"].exists() {
                let limitLines = json["rightAxis"]["limitLines"].arrayObject;
                for l in limitLines! {
                    let tmp = JSON(l);

                    if tmp["limit"].exists() &&
                        tmp["label"].exists() {

                            let line = ChartLimitLine(
                                limit: tmp["limit"].doubleValue,
                                label: tmp["label"].stringValue
                            );

                            if tmp["position"].exists() {
                                switch(tmp["position"]) {
                                case "leftBottom":
                                    line.labelPosition = ChartLimitLine.LabelPosition.leftBottom;
                                    break;
                                case "leftTop":
                                    line.labelPosition = ChartLimitLine.LabelPosition.leftTop;
                                    break;
                                case "rightBottom":
                                    line.labelPosition = ChartLimitLine.LabelPosition.rightBottom;
                                    break;
                                case "rightTop":
                                    line.labelPosition = ChartLimitLine.LabelPosition.rightTop;
                                    break;
                                default:
                                    line.labelPosition = ChartLimitLine.LabelPosition.rightTop;
                                    break;
                                }
                            }

                            if tmp["lineColor"].exists() {
                                line.lineColor = RCTConvert.uiColor(tmp["lineColor"].intValue);
                            }

                            if tmp["lineDashLengths"].exists() {
                                line.lineDashLengths = [CGFloat(tmp["lineDashLengths"].floatValue)];
                            }

                            if tmp["lineDashPhase"].exists() {
                                line.lineDashPhase = CGFloat(tmp["lineDashPhase"].floatValue);
                            }

                            if tmp["lineWidth"].exists() {
                                line.lineWidth = CGFloat(tmp["lineWidth"].floatValue);
                            }

                            if tmp["valueTextColor"].exists() {
                                line.valueTextColor = RCTConvert.uiColor(tmp["valueTextColor"].intValue);
                            }

                            if tmp["xOffset"].exists() {
                                line.xOffset = CGFloat(tmp["xOffset"].floatValue);
                            }

                            if tmp["yOffset"].exists() {
                                line.yOffset = CGFloat(tmp["yOffset"].floatValue);
                            }

                            if tmp["textFontName"].exists() {
                                line.valueFont = UIFont(
                                    name: tmp["textFontName"].stringValue,
                                    size: line.valueFont.pointSize
                                    )!;
                            }

                            if tmp["textSize"].exists() {
                                line.valueFont = line.valueFont.withSize(CGFloat(tmp["textSize"].floatValue));
                            }

                            self.rightAxis.addLimitLine(line);
                    }
                }
            }

            if json["rightAxis"]["position"].exists() {
                switch(json["rightAxis"]["position"].stringValue) {
                case "inside":
                    self.rightAxis.labelPosition = ChartYAxis.LabelPosition.insideChart;
                    break;
                case "outside":
                    self.rightAxis.labelPosition = ChartYAxis.LabelPosition.outsideChart;
                    break;
                default:
                    self.rightAxis.labelPosition = ChartYAxis.LabelPosition.outsideChart;
                    break;
                }
            }

            if json["rightAxis"]["drawLimitLinesBehindData"].exists() {
                self.rightAxis.drawLimitLinesBehindDataEnabled = json["rightAxis"]["drawLimitLinesBehindData"].boolValue;
            }

            if json["rightAxis"]["spaceTop"].exists() {
                self.rightAxis.spaceTop = CGFloat(json["rightAxis"]["spaceTop"].floatValue);
            }

            if json["rightAxis"]["spaceBottom"].exists() {
                self.rightAxis.spaceBottom = CGFloat(json["rightAxis"]["spaceBottom"].floatValue);
            }

            if json["rightAxis"]["startAtZero"].exists() {
                self.rightAxis.startAtZeroEnabled = json["rightAxis"]["startAtZeroEnabled"].boolValue;
            }

            if json["rightAxis"]["axisMinimum"].exists() {
                self.rightAxis.axisMinValue = json["rightAxis"]["axisMinimum"].doubleValue;
            }

            if json["rightAxis"]["axisMaximum"].exists() {
                self.rightAxis.axisMaxValue = json["rightAxis"]["axisMaximum"].doubleValue;
            }

            if json["rightAxis"]["labelCount"].exists() {
              self.rightAxis.labelCount = json["rightAxis"]["labelCount"].intValue;
            }
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
                    self.leftAxis.valueFormatter = NumberFormatter();
                    self.rightAxis.valueFormatter = NumberFormatter();
                    break;
                case "abbreviated":
                    self.leftAxis.valueFormatter = ABNumberFormatter(minimumDecimalPlaces: minimumDecimalPlaces, maximumDecimalPlaces: maximumDecimalPlaces);
                    self.rightAxis.valueFormatter = ABNumberFormatter(minimumDecimalPlaces: minimumDecimalPlaces, maximumDecimalPlaces: maximumDecimalPlaces);
                    break;
                default:
                    self.leftAxis.valueFormatter = NumberFormatter();
                    self.rightAxis.valueFormatter = NumberFormatter();
                }
            }

            if json["valueFormatter"]["numberStyle"].exists() {
                switch(json["valueFormatter"]["numberStyle"]) {
                case "CurrencyAccountingStyle":
                    if #available(iOS 9.0, *) {
                        self.leftAxis.valueFormatter?.numberStyle = .currencyAccounting;
                        self.rightAxis.valueFormatter?.numberStyle = .currencyAccounting;
                    }
                    break;
                case "CurrencyISOCodeStyle":
                    if #available(iOS 9.0, *) {
                        self.leftAxis.valueFormatter?.numberStyle = .currencyISOCode;
                        self.rightAxis.valueFormatter?.numberStyle = .currencyISOCode;
                    }
                    break;
                case "CurrencyPluralStyle":
                    if #available(iOS 9.0, *) {
                        self.leftAxis.valueFormatter?.numberStyle = .currencyPlural;
                        self.rightAxis.valueFormatter?.numberStyle = .currencyPlural;
                    }
                    break;
                case "CurrencyStyle":
                    self.leftAxis.valueFormatter?.numberStyle = .currency;
                    self.rightAxis.valueFormatter?.numberStyle = .currency;
                    break;
                case "DecimalStyle":
                    self.leftAxis.valueFormatter?.numberStyle = .decimal;
                    self.rightAxis.valueFormatter?.numberStyle = .decimal;
                    break;
                case "NoStyle":
                    self.leftAxis.valueFormatter?.numberStyle = .none;
                    self.rightAxis.valueFormatter?.numberStyle = .none;
                    break;
                case "OrdinalStyle":
                    if #available(iOS 9.0, *) {
                        self.leftAxis.valueFormatter?.numberStyle = .ordinal;
                        self.rightAxis.valueFormatter?.numberStyle = .ordinal;
                    }
                    break;
                case "PercentStyle":
                    self.leftAxis.valueFormatter?.numberStyle = .percent;
                    self.rightAxis.valueFormatter?.numberStyle = .percent;
                    break;
                case "ScientificStyle":
                    self.leftAxis.valueFormatter?.numberStyle = .scientific;
                    self.rightAxis.valueFormatter?.numberStyle = .scientific;
                    break;
                case "SpellOutStyle":
                    self.leftAxis.valueFormatter?.numberStyle = .spellOut;
                    self.rightAxis.valueFormatter?.numberStyle = .spellOut;
                    break;
                default:
                    self.leftAxis.valueFormatter?.numberStyle = .none;
                    self.rightAxis.valueFormatter?.numberStyle = .none;
                }
            }

            self.leftAxis.valueFormatter?.minimumFractionDigits = minimumDecimalPlaces;
            self.rightAxis.valueFormatter?.minimumFractionDigits = minimumDecimalPlaces;
            self.leftAxis.valueFormatter?.maximumFractionDigits = maximumDecimalPlaces;
            self.rightAxis.valueFormatter?.maximumFractionDigits = maximumDecimalPlaces;
        }
        
        if json["viewport"].exists() {
            
            if json["viewport"]["left"].exists() &&
                json["viewport"]["top"].exists() &&
                json["viewport"]["right"].exists() &&
                json["viewport"]["bottom"].exists() {
                
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
