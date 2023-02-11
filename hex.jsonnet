local svg = import 'svg.libsonnet';

{
  'hex.svg': svg.svg(
    [0, 0, '100%', '100%'],
    [
      svg.rect(width='100%', height='100%', props={fill: '#2d142d'}),
      svg.rect(width='100%', height='100%', props={fill: 'url(#tile)'}),
    ],
    defs={
      'tile': (function(w) svg.pattern(
        w*3, w*2,
        {patternUnits: 'userSpaceOnUse'},
        [
          svg.polyline([
            [-w*0.5, 0],
            [0, w],
            [w, w],
            [w*1.5, 0],
            [w*2.5, 0],
            [w*3.0, w],
            [w*2.5, w*2.0],
            [w*1.5, w*2.0],
            [w, w],
            [0, w],
            [-w*0.5, w*2.0],
          ], props={
            fill: 'none',
            stroke: '#ff6dff',
            'stroke-width': w/3,
          }),
        ],
      ))(50),
    },
  ),
}
