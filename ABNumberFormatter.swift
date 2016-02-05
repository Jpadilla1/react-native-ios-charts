//
//  ABNumberFormatter.swift
//  
//
//  Created by Jose Padilla on 2/5/16.
//
//

import Foundation

class ABNumberFormatter : NSNumberFormatter {
    
    private var decimalPlaces: Int = 0;
    
    init(decimalPlaces: Int) {
        self.decimalPlaces = decimalPlaces;
        super.init();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented");
    }
    
    func abbreviateNumber(num: Int) -> String? {
        var abbrevNum : String = "";
        var number : Float = Float(num);
        if (num >= 1000) {
            let abbrev = ["K", "M", "B"];
            for (var i = abbrev.count - 1; i >= 0; i--) {
                let size = Float(pow(Double(10), Double((i+1)*3)));
                if(size <= number) {
                    number = number/size;
                    let numberString = floatToString(number);
                    abbrevNum = String(format:"%@%@", numberString, abbrev[i]);
                }
            }
        } else {
            abbrevNum = String(format:"%d", Int(number));
        }
        
        return abbrevNum;
    }
    
    func floatToString(val: Float) -> String {
        var ret = String(format:"%.1f", val);
        var c = UniChar(String(ret.characters.last! as Character));
        while (c == 48) {
            ret = ret.substringToIndex(ret.startIndex.advancedBy(ret.characters.count - 1));
            c = UniChar(String(ret.characters.last! as Character));
            if(c == 46) {
                ret = ret.substringToIndex(ret.startIndex.advancedBy(ret.characters.count - 1));
            }
        }
        let formatter = NSNumberFormatter();
        formatter.minimumFractionDigits = 0;
        formatter.maximumFractionDigits = self.decimalPlaces;
        return formatter.stringFromNumber(Float(ret)!)!;
    }
    
    override func stringForObjectValue(obj: AnyObject) -> String? {
        
        return abbreviateNumber(obj as! Int);
    }
}