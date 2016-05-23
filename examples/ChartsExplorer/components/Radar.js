import React, { Component } from 'react';
import { StyleSheet } from 'react-native';

import { RadarChart } from 'react-native-ios-charts';


const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'stretch',
    backgroundColor: 'transparent'
  }
});

export default class Radar extends Component {
  static displayName = 'Radar';

  render() {
    const config = {
      dataSets: [{
        values: [230, 100, 150, 145, 160, 150, 100, 185, 200],
        colors: ['rgb(197, 254, 144)'],
        label: '2014',
        drawFilledEnabled: true,
        fillColor: 'green',
        drawValues: false
      }, {
        values: [120, 160, 110, 115, 220, 120, 250, 100, 220],
        colors: ['rgb(255, 133, 153)'],
        label: '2015',
        drawFilledEnabled: true,
        fillColor: 'red',
        drawValues: false
      }],
      labels: ['Party A', 'Party B', 'Party C', 'Party D', 'Party E', 'Party F', 'Party G', 'Party H', 'Party I']
    };
    return (
      <RadarChart config={config} style={styles.container}/>
    );
  }
}
