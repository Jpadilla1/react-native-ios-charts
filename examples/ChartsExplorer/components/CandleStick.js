import React, { Component } from 'react';
import { StyleSheet } from 'react-native';

import { CandleStickChart } from 'react-native-ios-charts';


const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'stretch',
    backgroundColor: 'transparent'
  }
});

export default class CandleStick extends Component {
  static displayName = 'CandleStick';

  render() {
    const config = {
      dataSets: [{
        values: [{
          shadowH: 20,
          shadowL: 0,
          open: 15,
          close: 5
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
          shadowL: 30,
          open: 25,
          close: 15
        }],
        drawValues: false,
        colors: ['red'],
        label: 'Company A'
      }],
      labels: ['1990', '1991', '1992', '1993', '1994'],
      legend: {
      },
      xAxis: {
        position: 'bottom'
      },
      leftAxis: {
        drawGridLines: false,
        spaceBottom: 0
      },
      rightAxis: {
        drawGridLines: false,
        spaceBottom: 0
      },
      valueFormatter: {
        type: 'regular',
        maximumDecimalPlaces: 0
      }
    };
    return (
      <CandleStickChart config={config} style={styles.container}/>
    );
  }
}
