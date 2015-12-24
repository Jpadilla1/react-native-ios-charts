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
            // values: [20.9, 10, 40, 39.1],
            // labels: ['Q1', 'Q2', 'Q3', 'Q4'],
            backgroundColor: 'black',
            gridBackgroundColor: 'white',
            showBackgroundGrid: false,
            descriptionText: 'hi Mom',
            dataSetLabel: 'I am a label',
            descriptionTextColor: 'black',
            descriptionFontSize: 10,
            descriptionTextPosition: {
              x: 175, y: 0
            },
            infoTextFontSize: 16,
            infoTextColor: 'lightgray'
          }}
          style={styles.chart}/>
      </View>
    );
  }
});

var styles = StyleSheet.create({
  chart: {
    position: 'absolute',
    top: 100,
    left: 10,
    right: 10,
    bottom: 100
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
