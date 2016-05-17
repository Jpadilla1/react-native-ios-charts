//
//  ABNumberFormatter.swift
//
//
//  Created by Jose Padilla on 2/5/16.
//
//

import Foundation

class ABNumberFormatter : NSNumberFormatter {
    
    private var maximumDecimalPlaces: Int = 0;
    private var minimumDecimalPlaces: Int = 0;
    
    init(minimumDecimalPlaces: Int, maximumDecimalPlaces: Int) {
        if (minimumDecimalPlaces < 0) {
            self.minimumDecimalPlaces = 0;
        } else {
            self.minimumDecimalPlaces = minimumDecimalPlaces;
        }
        if (maximumDecimalPlaces < 0) {
            self.maximumDecimalPlaces = 0;
        } else {
            self.maximumDecimalPlaces = maximumDecimalPlaces;
        }
        super.init();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented");
    }
    
    func abbreviateNumber(num: Int) -> String {
        var abbrevNum : String = "";
        var number : Float = Float(num);
        if (num >= 1000) {
            let abbrev = ["K", "M", "B"];
            for i in (abbrev.count - 1).stride(to: 0, by: -1) {
                let size = Float(pow(Double(10), Double((i+1)*3)));
                if(size <= number) {
                    number = number/size;
                    let numberString = floatToString(number);
                    self.positiveSuffix = abbrev[i];
                    abbrevNum = String(format:"%@", numberString);
                }
            }
        } else {
            self.positiveSuffix = "";
            abbrevNum = String(format:"%d", Int(number));
        }
        
        return abbrevNum;
    }
    
    func floatToString(val: Float) -> String {
        var ret = String(format:"%.\(self.maximumDecimalPlaces)f", val);
        var c = UniChar(String(ret.characters.last! as Character));
        while (c == 48) {
            ret = ret.substringToIndex(ret.startIndex.advancedBy(ret.characters.count - 1));
            c = UniChar(String(ret.characters.last! as Character));
            if(c == 46) {
                ret = ret.substringToIndex(ret.startIndex.advancedBy(ret.characters.count - 1));
            }
        }
        let formatter = NSNumberFormatter();
        formatter.minimumFractionDigits = self.minimumDecimalPlaces;
        formatter.maximumFractionDigits = self.maximumDecimalPlaces;
        return formatter.stringFromNumber(Float(ret)!)!;
    }
    
    override func stringForObjectValue(obj: AnyObject) -> String? {
        let value = self.abbreviateNumber(obj as! Int);
        if String(value.characters.last!) == "0" {
            return super.stringForObjectValue(Int(value)!);
        }
        
        return super.stringForObjectValue(Float(value)!);
    }
}