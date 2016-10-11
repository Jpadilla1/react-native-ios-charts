# react-native-ios-charts
[![npm version](https://img.shields.io/npm/v/react-native-ios-charts.svg?style=flat-square)](https://www.npmjs.com/package/react-native-ios-charts)
[![npm downloads](https://img.shields.io/npm/dm/react-native-ios-charts.svg?style=flat-square)](https://www.npmjs.com/package/react-native-ios-charts)

Bringing [iOS Charts](https://github.com/danielgindi/ios-charts) to React Native.

![Image of all charts](https://raw.githubusercontent.com/Jpadilla1/react-native-ios-charts/master/screenshots/all.png)

Check out the ChartsExplorer in the examples folder

![](http://i.imgur.com/89SXtvq.gif)

# Introduction

The aim of this library is to provide reusable React Native components that can graph charts like Bar, Line, Scatter, Combined, Pie, Candle, Bubble from the awesome ios-charts library.

# Installation

**The minimum deployment target should be set to iOS 8.0 or greater**

1. Run `npm install --save react-native-ios-charts`
2. Add all the files under node_modules/react-native-ios-charts/RNiOSCharts. (In Xcode: File -> Add files to "App Name")
3. When you add the files XCode should prompt you to create a bridging header if you haven't done so already. Create it and import the `RCTViewManager.h`. It should look something like this.

  ```Objective-C
  #import "RCTBridge.h"
  #import "RCTViewManager.h"
  #import "RCTUIManager.h"
  #import "UIView+React.h"
  ```
3.5. You can use [CocoaPods](https://cocoapods.org) and skip steps 4-6. Just add a `Podfile` to your ios directory with the following content. Then run `pod install` and open the generated .xcworkspace from now on in xcode.

  ```
  use_frameworks!

  target 'MyApp' do
    pod 'SwiftyJSON', git: 'https://github.com/IBM-Swift/SwiftyJSON.git'
    pod 'Charts', git: 'https://github.com/danielgindi/Charts.git', branch: 'Chart2.2.5-Swift3.0'
  end
  
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '3.0'
      end
    end
  end
  ```
4. Install [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON) and [iOS Charts](https://github.com/danielgindi/ios-charts) libraries and add `SwiftyJSON.xcodeproj` and `Charts.xcodeproj` files to your project.
5. Under `Build Phases`, under `Link Binary With Libraries`, click the plus sign and add `SwiftyJSON.framework` and `Charts.framework`.
6. Add the `SwiftyJSON.framework` and `Charts.framework` to the `Embedded Binaries` section in your app.
7. In your project's build settings, go to build options and change the `Embedded Content Contains Swift Code` to `Yes`.

# Usage

Currently supported charts:

- [Bar](https://gist.github.com/Jpadilla1/c833b91576152b4b9bb2)
- [Horizontal Bar](https://gist.github.com/Jpadilla1/d3cb8d52b35ed825e87e)
- [Line](https://gist.github.com/Jpadilla1/5c8f8067225fac40b370)
- [Pie](https://gist.github.com/Jpadilla1/58f88276381b4f1ce31c)
- [Candle Stick](https://gist.github.com/Jpadilla1/f64a4bb4cf8dfd3921d4)
- [Bubble](https://gist.github.com/Jpadilla1/34e52658683feadbeaaa)
- [Scatter](https://gist.github.com/Jpadilla1/abbc1e4378e5f6fd7eca)
- [Radar](https://gist.github.com/Jpadilla1/b944cd86bdf46cb50977)

Example code:

```JavaScript
var { BarChart } = require('react-native-ios-charts');

var MyComponent = React.createClass({
  render: function() {
    return (
      <View style={styles.container}>
        <BarChart
          config={{
            dataSets: [{
              values: [1, 2, 3, 10],
              colors: ['green'],
              label: '2015',
            }, {
              values: [3, 2, 1, 5],
              colors: ['red'],
              label: '2014',
            }],
            labels: ['a', 'b', 'c', 'd'],
          }}
          style={styles.chart}
        />
      </View>
    );
  }
});

var styles = StyleSheet.create({
  chart: {
    width: 200,
    height: 200
  }
})
```

# Roadmap

- [X] Support for all charts
- [X] Examples
- [ ] Support for all chart properties
- [ ] Documentation

# License
The MIT License (MIT)

Copyright (c) 2016 Jose E. Padilla

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
