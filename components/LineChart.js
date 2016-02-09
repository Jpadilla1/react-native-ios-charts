import React, {
  Component,
  requireNativeComponent,
  processColor
} from 'react-native';

import {
  globalCommonProps,
  barLineCommonProps,
  commonDataSetProps
} from '../utils/commonProps';

import { processColors } from '../utils/commonColorProps';

let RNLineChart = requireNativeComponent('RNLineChartSwift', LineChart);

class LineChart extends Component {
  render() {
    let { config, ...otherProps} = this.props;
    config = processColors(config);
    return <RNLineChart
      config={JSON.stringify(config)}
      {...otherProps}/>;
  }
};

LineChart.propTypes = {
  config: React.PropTypes.shape({
    ...globalCommonProps,
    ...barLineCommonProps,
    dataSets: React.PropTypes.arrayOf(React.PropTypes.shape({
      ...commonDataSetProps,
      drawCircles: React.PropTypes.bool,
      lineWidth: React.PropTypes.number,
      circleColors: React.PropTypes.arrayOf(React.PropTypes.string),
      circleHoleColor: React.PropTypes.string,
      circleRadius: React.PropTypes.number,
      cubicIntensity: React.PropTypes.number,
      drawCircleHole: React.PropTypes.bool,
      drawCubic: React.PropTypes.bool,
      drawFilled: React.PropTypes.bool,
      drawHorizontalHighlightIndicator: React.PropTypes.bool,
      drawVerticalHighlightIndicator: React.PropTypes.bool,
      fillAlpha: React.PropTypes.number,
      fillColor: React.PropTypes.number,
      highlightColor: React.PropTypes.string,
      highlightLineDashLengths: React.PropTypes.number,
      highlightLineDashPhase: React.PropTypes.number,
      highlightLineWidth: React.PropTypes.number,
      lineDashLengths: React.PropTypes.number,
      lineDashPhase: React.PropTypes.number,
      lineWidth: React.PropTypes.number,
    }))
  })
};
export default LineChart;
