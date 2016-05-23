import React, { Component } from 'react';
import { StyleSheet } from 'react-native';

import { LineChart } from 'react-native-ios-charts';

const colors = ['red', 'blue', 'green', 'yellow', 'purple', 'pink'];

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'stretch',
    backgroundColor: 'transparent'
  }
});

const getConfig = (values, color) => {
  return {
    dataSets: [{
      values: values,
      drawValues: false,
      colors: [colors[color]],
      label: 'Sine function',
      drawCubic: true,
      drawCircles: false,
      lineWidth: 2
    }],
    labels: values.map(v => v.toString()),
    minOffset: 20,
    scaleYEnabled: false,
    showLegend: false,
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
};

export default class LiveUpdating extends Component {
  static displayName = 'LiveUpdating';

  constructor(props) {
    super(props);
    this.state = {
      values: [],
      color: 0
    }
  }

  componentDidMount() {
    this.interval = setInterval(() => {
      if (this.state.values.length >= 20) {
        this.setState({
          values: []
        });
      } else {
        this.setState({
          values: this.state.values.concat([Math.floor((Math.random() * 100) + 1)]),
          color: (this.state.color + 1) % colors.length
        });
      }
    }, 500);
  }

  componentWillUnmount() {
    clearInterval(this.interval);
  }

  render() {
    const { values, color } = this.state;
    const config = getConfig(values, color);
    return (
      <LineChart config={config} style={styles.container}/>
    );
  }
}
