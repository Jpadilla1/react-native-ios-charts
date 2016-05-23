import React, { Component } from 'react';
import { StyleSheet } from 'react-native';

import { HorizontalBarChart } from 'react-native-ios-charts';



const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'stretch',
    backgroundColor: 'transparent'
  }
});

export default class HorizontalBar extends Component {
  static displayName = 'HorizontalBar';

  render() {
    const config = {
      dataSets: [{
        values: [89.7, 20.7, 43.7, 54.7, 34.7, 16.7, 66.7, 86.7, 65.7, 76.7, 96.7, 106.7],
        valueTextFontSize: 12
      }],
      labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Oct', 'Sep', 'Nov', 'Dec'],
      showLegend: false,
      minOffset: 20,
      xAxis: {
        axisLineWidth: 0,
        position: 'bottom'
      },
      leftAxis: {
        spaceTop: 0.18
      },
      rightAxis: {
        enabled: false,
        drawGridLines: false
      }
    };
    return (
      <HorizontalBarChart config={config} style={styles.container}/>
    );
  }
}
