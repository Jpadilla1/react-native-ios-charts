/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';

var React = require('react-native');
var {
  AppRegistry,
  StyleSheet,
  Text,
  View,
} = React;

var BarChart = require('./components/BarChart');

var RCTIOSCharts = React.createClass({
  render: function() {
    return (
      <View style={styles.container}>
        <BarChart
          config={{
            values: [20.9, 10, 40, 39.1, 32, 43, 50, 23, 25, 30, 12, 45],
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                     'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
            backgroundColor: 'black',
            gridBackgroundColor: 'white',
            showBackgroundGrid: true,
            descriptionText: 'Sales per month',
            dataSetLabel: 'I am a label',
            // colors: ['lightblue'],
            descriptionTextColor: 'black',
            descriptionFontSize: 10,
            descriptionTextPosition: {
              x: 175, y: 0
            },
            descriptionTextAlign: 'center',
            infoTextFontSize: 16,
            infoTextColor: 'lightgray',
            drawBorders: true,
            borderColor: 'blue',
            borderLineWidth: 10,
            drawValueAboveBar: true,
            drawHighlightArrow: false,
            drawBarShadow: false,
            minOffset: 30,
            highlightPerTap: false,
            showLegend: true,
            legend: {
              textColor: 'red',
              textSize: 16,
              position: 'belowChartCenter',
              form: 'circle',
              formSize: 16,
              xEntrySpace: 30,
              yEntrySpace: 0,
              formToTextSpace: 10,
              colors: ['red', 'blue', 'orange'],
              labels: ['a', 'b', 'c']
            },
            highlightValues: [0, 1, 2, 3],
            xAxis: {
              enabled: true,
              position: 'bottom',
              drawAxisLine: true,
              drawGridLines: true,
              drawLabels: true,
              textColor: 'red',
              textSize: 12,
              gridColor: 'blue',
              gridLineWidth: 3,
              axisLineColor: 'red',
              axisLineWidth: 3,
              drawLimitLinesBehindData: false,
              gridDashedLine: {
                lineLength: 10,
                spaceLength: 2,
                phase: 0
              },
              limitLines: [{
                limit: 5,
                label: 'expected',
                position: 'leftBottom',
                lineColor: 'black',
                valueTextColor: 'blue',
                lineDashLengths: 2,
                lineWidth: 3,
                lineDashPhase: 0
              }]
            },
            leftAxis: {
              enabled: true,
              drawAxisLine: true,
              drawGridLines: true,
              drawLabels: true,
              textColor: 'red',
              textSize: 12,
              gridColor: 'blue',
              gridLineWidth: 3,
              axisLineColor: 'black',
              axisLineWidth: 3,
              drawLimitLinesBehindData: false,
              gridDashedLine: {
                lineLength: 10,
                spaceLength: 2,
                phase: 0
              },
              limitLines: [{
                limit: 5,
                label: 'expected',
                position: 'leftBottom',
                lineColor: 'black',
                valueTextColor: 'blue',
                lineDashLengths: 2,
                lineWidth: 3,
                lineDashPhase: 0
              }]
            },
            rightAxis: {
              enabled: true,
              drawAxisLine: true,
              drawGridLines: true,
              drawLabels: true,
              textColor: 'red',
              textSize: 12,
              gridColor: 'red',
              gridLineWidth: 3,
              axisLineColor: 'black',
              axisLineWidth: 1,
              drawLimitLinesBehindData: false,
              gridDashedLine: {
                lineLength: 10,
                spaceLength: 2,
                phase: 0
              },
              limitLines: [{
                limit: 8,
                label: 'expected',
                position: 'leftBottom',
                lineColor: 'black',
                valueTextColor: 'blue',
                lineDashLengths: 2,
                lineWidth: 3,
                lineDashPhase: 0
              }]
            }
          }}
          style={styles.chart}/>
      </View>
    );
  }
});

var styles = StyleSheet.create({
  chart: {
    position: 'absolute',
    top: 50,
    left: 10,
    right: 10,
    bottom: 50
  },
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: 'white',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('RCTIOSCharts', () => RCTIOSCharts);
