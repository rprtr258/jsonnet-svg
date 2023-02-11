local svg = import 'svg.libsonnet';

local text = svg.node('text', {
  x: 60,
  y: 340,
  style: 'fill: red;font: bold 70px sans-serif;',
}, ['КУПЕРТИНО']);

{
  'index.svg': svg.svg(
    [0, 0, 230, 100],
    [
      svg.rect([0, 0], 230, 100, props={fill: 'violet'}),
      // rect([0, 0], 230, 100, props={fill: 'url(#star)'}),
      svg.circle([50, 50], 50, {fill: 'url(#star)'}),
      svg.circle([180, 50], 40, {
        fill: 'none',
        'stroke-width': 20,
        stroke: 'url(#star)',
      }),
      svg.polygon([
        [std.cos(a) * 40 + 40, std.sin(a) * 40 + 40]
        for a in std.map(function(x)x*2*2*3.14159265/5, std.range(0, 5))
      ], {stroke: 'red'}),
    ],
    {
      'star': (function(w) svg.pattern(
        w, w,
        props={
          patternUnits: 'userSpaceOnUse',
        },
        children=[
          svg.polygon([
            [w*0.0, w*0.0],
            [w*0.2, w*0.5],
            [w*0.0, w*1.0],
            [w*0.5, w*0.8],
            [w*1.0, w*1.0],
            [w*0.8, w*0.5],
            [w*1.0, w*0.0],
            [w*0.5, w*0.2],
          ]),
        ],
      ))(10),
    },
  )
}
