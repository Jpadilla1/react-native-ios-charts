
//
//  ChartViewBaseExtension.swift
//  PoliRank
//
//  Created by Jose Padilla on 2/8/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

import SwiftyJSON
import Charts

extension ChartViewBase {

    func setChartViewBaseProps(config: String!) {
        var legendColors: [UIColor] = ChartColorTemplates.colorful();
        var legendLabels: [String] = [];

        self.descriptionText = "";
        self.backgroundColor = UIColor(red: 255.0, green: 255.0, blue: 255.0, alpha: 0.0);

        var json: JSON = nil;
        if let data = config.dataUsingEncoding(NSUTF8StringEncoding) {
            json = JSON(data: data);
        };

        if json["backgroundColor"].isExists() {
            self.backgroundColor = RCTConvert.UIColor(json["backgroundColor"].intValue);
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

        if json["drawMarkers"].isExists() {
            self.drawMarkers = json["drawMarkers"].boolValue;
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
                legendColors = arrColors.map({return RCTConvert.UIColor($0)});
                if legendLabels.count == legendColors.count {
                    legend.setCustom(colors: legendColors, labels: legendLabels);
                }
            }

            if json["legend"]["labels"].isExists() {
                legendLabels = json["legend"]["labels"].arrayObject as! [String];
                if legendLabels.count == legendColors.count {
                    legend.setCustom(colors:  legendColors, labels: legendLabels);
                }
            }
        }

        if json["userInteractionEnabled"].isExists() {
          self.userInteractionEnabled = json["userInteractionEnabled"].boolValue;
        }

        if json["dragDecelerationEnabled"].isExists() {
          self.dragDecelerationEnabled = json["dragDecelerationEnabled"].boolValue;
        }

        if json["dragDecelerationFrictionCoef"].isExists() {
          self.dragDecelerationFrictionCoef = CGFloat(json["dragDecelerationFrictionCoef"].floatValue);
        }

        if json["highlightPerTap"].isExists() {
          self.highlightPerTapEnabled = json["highlightPerTap"].boolValue;
        }

        if json["highlightValues"].isExists() {
            let highlightValues = json["highlightValues"].arrayObject as! [Int];
            self.highlightValues(highlightValues.map({return ChartHighlight(xIndex: $0, dataSetIndex: 0)}));
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
    }
}
