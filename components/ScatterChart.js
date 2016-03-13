import React, {
  Component,
  requireNativeComponent
} from 'react-native';

import {
  globalCommonProps,
  barLineCommonProps,
  commonDataSetProps
} from '../utils/commonProps';

import { processColors } from '../utils/commonColorProps';

let RNScatterChart = requireNativeComponent('RNScatterChartSwift', ScatterChart);

class ScatterChart extends Component {
  render() {
    let {config, ...otherProps} = this.props;
    config = processColors(config);
    return <RNScatterChart
      config={JSON.stringify(config)}
      {...otherProps}/>;
  }
};

ScatterChart.propTypes = {
  config: React.PropTypes.shape({
    ...globalCommonProps,
    ...barLineCommonProps,
    dataSets: React.PropTypes.arrayOf(React.PropTypes.shape({
      ...commonDataSetProps,
      scatterShapeSize: React.PropTypes.number,
      scatterShapeHoleRadius: React.PropTypes.number,
      scatterShapeHoleColor: React.PropTypes.string,
      scatterShape: React.PropTypes.oneOf([
        'Square',
        'Circle',
        'Triangle',
        'Cross',
        'X'
      ])
    }))
  })
};

export default ScatterChart;
