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

let RNCandleStickChart = requireNativeComponent('RNCandleStickChartSwift', CandleStickChart);

class CandleStickChart extends Component {
  render() {
    let {config, ...otherProps} = this.props;
    config = processColors(config);
    return <RNCandleStickChart
      config={JSON.stringify(config)}
      {...otherProps}/>;
  }
};

CandleStickChart.propTypes = {
  config: React.PropTypes.shape({
    ...globalCommonProps,
    ...barLineCommonProps,
    dataSets: React.PropTypes.arrayOf(React.PropTypes.shape({
      ...commonDataSetProps,
      values: React.PropTypes.arrayOf(React.PropTypes.shape({
        shadowH: React.PropTypes.number,
        shadowL: React.PropTypes.number,
        open: React.PropTypes.number,
        close: React.PropTypes.number,
        value: React.PropTypes.number
      })).isRequired,
      barSpace: React.PropTypes.number,
      showCandleBar: React.PropTypes.bool,
      shadowWidth: React.PropTypes.number,
      shadowColor: React.PropTypes.string,
      shadowColorSameAsCandle: React.PropTypes.bool,
      neutralColor: React.PropTypes.string,
      increasingColor: React.PropTypes.string,
      decreasingColor: React.PropTypes.string,
      increasingFilled: React.PropTypes.bool,
      decreasingFilled: React.PropTypes.bool
    }))
  })
};

export default CandleStickChart;
