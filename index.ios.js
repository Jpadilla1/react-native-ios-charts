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
var LineChart = require('./components/LineChart');

var RCTIOSCharts = React.createClass({
  render: function() {
    return (
      <View style={styles.container}>
        <LineChart
          config={{
            values: [-1, 1, -1, 1, -1, 1],
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
            backgroundColor: 'black',
            gridBackgroundColor: 'white',
            showBackgroundGrid: false,
            // descriptionText: 'Sales per month',
            colors: ['black'],
            descriptionTextColor: 'black',
            descriptionFontSize: 10,
            dataSetLabel: 'Sine function',
            descriptionTextPosition: {
              x: 175, y: 0
            },
            descriptionTextAlign: 'center',
            infoTextFontSize: 12,
            infoTextColor: 'lightgray',
            drawBorders: false,
            borderColor: 'blue',
            borderLineWidth: 0,
            drawValueAboveBar: false,
            drawHighlightArrow: false,
            drawBarShadow: false,
            minOffset: 10,
            highlightPerTap: false,
            showLegend: false,
            legend: {
              textColor: 'black',
              textSize: 16,
              position: 'belowChartCenter',
              form: 'circle',
              formSize: 16,
              xEntrySpace: 30,
              yEntrySpace: 0,
              formToTextSpace: 10,
              // colors: ['red', 'blue', 'orange'],
              // labels: ['a', 'b', 'c']
            },
            // highlightValues: [0, 1, 2, 3],
            xAxis: {
              enabled: true,
              position: 'bottom',
              // drawAxisLine: true,
              // drawGridLines: true,
              // drawLabels: true,
              // textColor: 'red',
              textSize: 12,
              // gridColor: 'blue',
              // gridLineWidth: 3,
              // axisLineColor: 'red',
              // axisLineWidth: 3,
              drawLimitLinesBehindData: false,
              gridDashedLine: {
                // lineLength: 10,
                // spaceLength: 2,
                // phase: 0
              },
              limitLines: [{
                // limit: 5,
                // label: 'expected',
                // position: 'leftBottom',
                // lineColor: 'black',
                // valueTextColor: 'blue',
                // lineDashLengths: 2,
                // lineWidth: 3,
                // lineDashPhase: 0
              }]
            },
            leftAxis: {
              enabled: true,
              drawAxisLine: true,
              drawGridLines: true,
              drawLabels: true,
              // textColor: 'red',
              textSize: 12,
              // gridColor: 'blue',
              // gridLineWidth: 3,
              // axisLineColor: 'black',
              // axisLineWidth: 3,
              drawLimitLinesBehindData: false,
              spaceBottom: 0,
              gridDashedLine: {
                // lineLength: 10,
                // spaceLength: 2,
                // phase: 0
              },
              limitLines: [{
                // limit: 5,
                // label: 'expected',
                // position: 'leftBottom',
                // lineColor: 'black',
                // valueTextColor: 'blue',
                // lineDashLengths: 2,
                // lineWidth: 3,
                // lineDashPhase: 0
              }]
            },
            rightAxis: {
              enabled: false,
              // drawAxisLine: true,
              // drawGridLines: true,
              drawLabels: true,
              // textColor: 'red',
              textSize: 12,
              // gridColor: 'red',
              // gridLineWidth: 3,
              // axisLineColor: 'black',
              axisLineWidth: 1,
              drawLimitLinesBehindData: false,
              gridDashedLine: {
                // lineLength: 10,
                // spaceLength: 2,
                // phase: 0
              },
              limitLines: [{
                // limit: 8,
                // label: 'expected',
                // position: 'leftBottom',
                // lineColor: 'black',
                // valueTextColor: 'blue',
                // lineDashLengths: 2,
                // lineWidth: 3,
                // lineDashPhase: 0
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
    left: 15,
    right: 15,
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
