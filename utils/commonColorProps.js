import { processColor } from 'react-native';

const processDataSetsColors = (config) => {
  const ret = JSON.parse(JSON.stringify(config));
  if ('dataSets' in ret) {
    ret.dataSets = ret.dataSets.map(function(set) {
      if ('colors' in set) {
        set.colors = set.colors.map(color => processColor(color));
      }
      if ('barShadowColor' in set) {
        set.barShadowColor = processColor(set.barShadowColor);
      }
      if ('circleColors' in set) {
        set.circleColors = set.circleColors.map(color => processColor(color));
      }
      if ('circleHoleColor' in set) {
        set.circleHoleColor = processColor(set.circleHoleColor);
      }
      if ('fillColor' in set) {
        set.fillColor = processColor(set.fillColor);
      }
      if ('highlightColor' in set) {
        set.highlightColor = processColor(set.highlightColor);
      }
      if ('valueTextColor' in set) {
        set.valueTextColor = processColor(set.valueTextColor);
      }
      if ('shadowColor' in set) {
        set.shadowColor = processColor(set.shadowColor);
      }
      if ('neutralColor' in set) {
        set.neutralColor = processColor(set.neutralColor);
      }
      if ('increasingColor' in set) {
        set.increasingColor = processColor(set.increasingColor);
      }
      if ('decreasingColor' in set) {
        set.decreasingColor = processColor(set.decreasingColor);
      }
      if ('scatterShapeHoleColor' in set) {
        set.scatterShapeHoleColor = processColor(set.scatterShapeHoleColor);
      }
      if ('webColor' in set) {
        set.webColor = processColor(set.webColor);
      }
      if ('innerWebColor' in set) {
        set.innerWebColor = processColor(set.innerWebColor);
      }
      return set;
    });
  }
  return ret;
};

export const processColors = (props) => {
  let config = JSON.parse(JSON.stringify(props));

  config = processDataSetsColors(config);

  if ('lineData' in config) {
    config.lineData = processDataSetsColors(config.lineData);
  }

  if ('barData' in config) {
    config.barData = processDataSetsColors(config.barData);
  }

  if ('bubbleData' in config) {
    config.bubbleData = processDataSetsColors(config.bubbleData);
  }

  if ('candleData' in config) {
    config.candleData = processDataSetsColors(config.candleData);
  }

  if ('scatterData' in config) {
    config.scatterData = processDataSetsColors(config.scatterData);
  }

  if ('backgroundColor' in config) {
    config.backgroundColor = processColor(config.backgroundColor);
  }

  if ('gridBackgroundColor' in config) {
    config.gridBackgroundColor = processColor(config.gridBackgroundColor);
  }

  if ('descriptionTextColor' in config) {
    config.descriptionTextColor = processColor(config.descriptionTextColor);
  }

  if ('infoTextColor' in config) {
    config.infoTextColor = processColor(config.infoTextColor);
  }

  if ('legend' in config && 'textColor' in config.legend) {
    config.legend.textColor = processColor(config.legend.textColor);
  }

  if ('legend' in config && 'colors' in config.legend) {
    config.legend.colors = config.legend.colors.map(color => processColor(color));
  }

  if ('xAxis' in config && 'textColor' in config.xAxis) {
    config.xAxis.textColor = processColor(config.xAxis.textColor);
  }

  if ('xAxis' in config && 'gridColor' in config.xAxis) {
    config.xAxis.gridColor = processColor(config.xAxis.gridColor);
  }

  if ('xAxis' in config && 'axisLineColor' in config.xAxis) {
    config.xAxis.axisLineColor = processColor(config.xAxis.axisLineColor);
  }

  if ('xAxis' in config && 'limitLines' in config.xAxis) {
    config.xAxis.limitLines = config.xAxis.limitLines.map(function(l) {
      if ('lineColor' in l) {
        l.lineColor = processColor(l.lineColor);
      }
      if ('valueTextColor' in l) {
        l.valueTextColor = processColor(l.valueTextColor);
      }
      return l;
    });
  }

  if ('leftAxis' in config && 'textColor' in config.leftAxis) {
    config.leftAxis.textColor = processColor(config.leftAxis.textColor);
  }

  if ('leftAxis' in config && 'gridColor' in config.leftAxis) {
    config.leftAxis.gridColor = processColor(config.leftAxis.gridColor);
  }

  if ('leftAxis' in config && 'axisLineColor' in config.leftAxis) {
    config.leftAxis.axisLineColor = processColor(config.leftAxis.axisLineColor);
  }

  if ('leftAxis' in config && 'limitLines' in config.leftAxis) {
    config.leftAxis.limitLines = config.leftAxis.limitLines.map(function(l) {
      if ('lineColor' in l) {
        l.lineColor = processColor(l.lineColor);
      }
      if ('valueTextColor' in l) {
        l.valueTextColor = processColor(l.valueTextColor);
      }
      return l;
    });
  }

  if ('rightAxis' in config && 'textColor' in config.rightAxis) {
    config.rightAxis.textColor = processColor(config.rightAxis.textColor);
  }

  if ('rightAxis' in config && 'gridColor' in config.rightAxis) {
    config.rightAxis.gridColor = processColor(config.rightAxis.gridColor);
  }

  if ('rightAxis' in config && 'axisLineColor' in config.rightAxis) {
    config.rightAxis.axisLineColor = processColor(config.rightAxis.axisLineColor);
  }

  if ('rightAxis' in config && 'limitLines' in config.rightAxis) {
    config.rightAxis.limitLines = config.rightAxis.limitLines.map(function(l) {
      if ('lineColor' in l) {
        l.lineColor = processColor(l.lineColor);
      }
      if ('valueTextColor' in l) {
        l.valueTextColor = processColor(l.valueTextColor);
      }
      return l;
    });
  }

  return config;
};
