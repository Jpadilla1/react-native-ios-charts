import React, { Component } from 'react';
import { StyleSheet } from 'react-native';

import { BubbleChart } from 'react-native-ios-charts';

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'stretch',
    backgroundColor: 'transparent'
  }
});

export default class Bubble extends Component {
  static displayName = 'Bubble';

  render() {
    const config = {
      dataSets: [{
        values: [{
          size: 23.4,
          value: 8
        }, {
          size: 17.4,
          value: 5
        }, {
          size: 6.0,
          value: 2
        }, {
          size: 52.0,
          value: 12
        }, {
          size: 40.1,
          value: 10
        }],
        colors: ['rgba(241, 152, 174, 0.7)'],
        label: 'Company A'
      }],
      labels: ['1990', '1991', '1992', '1993', '1994'],
      legend: {
        showLegend: false
      },
      xAxis: {
        position: 'bottom'
      },
      leftAxis: {
        spaceBottom: 0.05
      },
      rightAxis: {
        spaceBottom: 0.05
      }
    };
    return (
      <BubbleChart config={config} style={styles.container}/>
    );
  }
}
