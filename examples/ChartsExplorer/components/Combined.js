import React, { Component } from 'react';
import { StyleSheet } from 'react-native';

import { CombinedChart } from 'react-native-ios-charts';

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'stretch',
    backgroundColor: 'transparent'
  }
});

export default class Combined extends Component {
  static displayName = 'Combined';

  render() {
    const config = {
      barData: {
        dataSets: [{
          values: [40, 5, 50, 23, 79],
          drawValues: false,
          colors: ['rgb(166, 232, 255)'],
          label: 'Company B',
          axisDependency: 'right'
        }]
      },
      lineData: {
        dataSets: [{
          values: [5, 10, 5, 10, 5],
          drawValues: false,
          colors: ['red'],
          label: 'Sine function',
          drawCubic: true,
          drawCircles: false,
          lineWidth: 2,
          axisDependency: 'right'
        }, {
          values: [10, 5, 10, 5, 10],
          drawValues: false,
          colors: ['blue'],
          label: 'Cosine function',
          drawCubic: true,
          drawCircles: false,
          lineWidth: 2,
          axisDependency: 'right'
        }],
      },
      bubbleData: {
        dataSets: [{
          values: [{
            size: 23.4,
            value: 10080
          }, {
            size: 17.4,
            value: 10050
          }, {
            size: 6.0,
            value: 1060
          }, {
            size: 52.0,
            value: 7100
          }, {
            size: 40.1,
            value: 6005
          }],
          colors: ['rgba(241, 152, 174, 0.7)'],
          label: 'Company A',
          axisDependency: 'left',
        }],
      },
      candleData: {
        dataSets: [{
          values: [{
            shadowH: 20,
            shadowL: 5,
            open: 15,
            close: 10
          }, {
            shadowH: 30,
            shadowL: 10,
            open: 25,
            close: 15
          }, {
            shadowH: 10,
            shadowL: 5,
            open: 15,
            close: 10
          }, {
            shadowH: 50,
            shadowL: 5,
            open: 25,
            close: 15
          }],
          axisDependency: 'right',
          drawValues: false,
          colors: ['red'],
          label: 'Company A'
        }],
      },
      scatterData: {
        dataSets: [{
          values: [15, 40, 77, 81, 43],
          drawValues: false,
          colors: ['rgb(197, 36, 82)'],
          label: 'Company A',
          scatterShape: 'Square',
          axisDependency: 'right'
        }, {
          values: [40, 5, 50, 23, 79],
          drawValues: false,
          colors: ['rgb(255, 101, 0)'],
          label: 'Company B',
          scatterShape: 'Circle',
          axisDependency: 'right'
        }, {
          values: [10, 55, 35, 90, 82],
          drawValues: false,
          colors: ['rgb(247, 198, 0)'],
          label: 'Company C',
          scatterShape: 'Triangle',
          axisDependency: 'right'
        }],
      },
      drawBarShadowEnabled: false,
      labels: ['1990', '1991', '1992', '1993', '1994'],
      showLegend: false,
      xAxis: {
        position: 'bottom'
      },
      leftAxis: {
        drawGridLines: false,
        spaceBottom: 0.05
      },
      rightAxis: {
        drawGridLines: false,
        spaceBottom: 0.05,
        axisMaximum: 100,
        axisMaximum: 0
      },
      valueFormatter: {
        type: 'regular',
        maximumDecimalPlaces: 0
      }
    };
    return (
      <CombinedChart config={config} style={styles.container}/>
    );
  }
}
