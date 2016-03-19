import React, {
  Component,
  StyleSheet
} from 'react-native';

import { CombinedChart } from 'react-native-ios-charts';

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'stretch'
  }
});

export default class Combined extends Component {
  static displayName = 'Combined';

  render() {
    const config = {
      barData: {
        dataSets: [{
          values: [5, 40, 77, 81, 43],
          drawValues: false,
          colors: ['rgb(107, 243, 174)'],
          label: 'Company A'
        }, {
          values: [40, 5, 50, 23, 79],
          drawValues: false,
          colors: ['rgb(166, 232, 255)'],
          label: 'Company B'
        }, {
          values: [10, 55, 35, 90, 82],
          drawValues: false,
          colors: ['rgb(248, 248, 157)'],
          label: 'Company C'
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
          lineWidth: 2
        }, {
          values: [10, 5, 10, 5, 10],
          drawValues: false,
          colors: ['blue'],
          label: 'Cosine function',
          drawCubic: true,
          drawCircles: false,
          lineWidth: 2
        }]
      },
      bubbleData: {
        dataSets: [{
          values: [{
            size: 23.4,
            value: 80
          }, {
            size: 17.4,
            value: 50
          }, {
            size: 6.0,
            value: 60
          }, {
            size: 52.0,
            value: 70
          }, {
            size: 40.1,
            value: 65
          }],
          colors: ['rgba(241, 152, 174, 0.7)'],
          label: 'Company A'
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
          drawValues: false,
          colors: ['red'],
          label: 'Company A'
        }],
      },
      scatterData: {
        dataSets: [{
          values: [5, 40, 77, 81, 43],
          drawValues: false,
          colors: ['rgb(197, 36, 82)'],
          label: 'Company A',
          scatterShape: 'Square'
        }, {
          values: [40, 5, 50, 23, 79],
          drawValues: false,
          colors: ['rgb(255, 101, 0)'],
          label: 'Company B',
          scatterShape: 'Circle'
        }, {
          values: [10, 55, 35, 90, 82],
          drawValues: false,
          colors: ['rgb(247, 198, 0)'],
          label: 'Company C',
          scatterShape: 'Triangle'
        }],
      },
      drawBarShadowEnabled: false,
      backgroundColor: 'transparent',
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
        spaceBottom: 0.05
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
