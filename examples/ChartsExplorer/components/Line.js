import React, { Component } from 'react';
import { StyleSheet } from 'react-native';

import { LineChart } from 'react-native-ios-charts';


const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'stretch',
    backgroundColor: 'transparent'
  }
});

export default class Line extends Component {
  static displayName = 'Line';

  render() {
    const config = {
      dataSets: [{
        values: [-1, 1, -1],
        drawValues: false,
        colors: ['rgb(199, 255, 140)'],
        label: 'Sine function',
        drawCubic: true,
        drawCircles: false,
        lineWidth: 2
      }, {
        values: [1, -1, 1],
        drawValues: false,
        colors: ['rgb(255, 247, 141)'],
        label: 'Cosine function',
        drawCubic: true,
        drawCircles: false,
        lineWidth: 2
      }],
      labels: ['Jan', 'Feb', 'Mar'],
      minOffset: 20,
      scaleYEnabled: false,
      legend: {
        textSize: 12
      },
      xAxis: {
        axisLineWidth: 0,
        drawLabels: false,
        position: 'bottom',
        drawGridLines: false
      },
      leftAxis: {
        customAxisMax: 1,
        customAxisMin: -1,
        labelCount: 11,
        startAtZero: false,
        spaceTop: 0.1,
        spaceBottom: 0.1
      },
      rightAxis: {
        enabled: false,
        drawGridLines: false
      },
      valueFormatter: {
        minimumSignificantDigits: 1,
        type: 'regular',
        maximumDecimalPlaces: 1
      }
    };
    return (
      <LineChart config={config} style={styles.container}/>
    );
  }
}
