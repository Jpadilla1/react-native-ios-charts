# react-native-ios-charts

Bringing [iOS Charts](https://github.com/danielgindi/ios-charts) to React Native.

# Introduction

The aim of this library is to provide reusable React Native components that can graph charts like Bar, Line, Scatter, Combined, Pie, Candle, Bubble from the awesome ios-charts library.

# Installation

**The minimum deployment target should be set to iOS 8.0 or greater**

1. Run `npm install --save react-native-ios-charts`
2. Add all the files under node_modules/react-native-ios-charts/RNiOSCharts, except the Libraries folder.
3. When you add the files XCode should prompt you to create a bridging header if you haven't done so already. Create it and import the `RCTViewManager.h`. It should look something like this.
  ```Objective-C
  #import "RCTViewManager.h"
  ```
4. Add the SwiftyJSON.xcodeproj and Charts.xcodeproj under node_modules/react-native-ios-charts/RNiOSCharts/Libraries to your project in XCode.
5. Under Build Phases, under `Link Binary With Libraries`, click the plus sign and add SwiftyJSON.framework and Charts.framework for iOS to your project.
6. Add the SwiftyJSON.framework and Charts.framework to the Embedded Binaries section in your app.
7. In your project's build settings, go to build options and change the `Embedded Content Contains Swift Code` to `Yes`.

# Usage

As of this point, BarChart and LineChart are currently supported. Support for more graphs will be coming along the way.

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
```

# Contributing

Anyone who is willing to help developing this library is welcomed! I am not a swift guy as you may see by my code that is horrible. You may either create an issue or contact me directly.

# Roadmap

TODO

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
