local svg = import 'svg.libsonnet';

local heart = std.join(' ', [
  'M 10,30',
  'A 20,20 0,0,1 50,30',
  'A 20,20 0,0,1 90,30',
  'Q 90,60 50,90',
  'Q 10,60 10,30',
  'z',
]);
local text = svg.node('text', {
  x: 60,
  y: 340,
  style: 'fill: red;font: bold 70px sans-serif;',
}, ['КУПЕРТИНО']);

local triangle(base, width, height, props={}) = svg.polygon([
  [base[0], base[1]-height],
  [base[0]+width/2, base[1]],
  [base[0]-width/2, base[1]],
], props);

local tile(w, color) =  svg.pattern(
  [0, 0, w, w],
  width=w,
  height=w,
  props={
    patternUnits: 'userSpaceOnUse',
  },
  children=[
    svg.polygon([
      [w*0.5, w*0.0],
      [w*0.0, w*0.5],
      [w*0.5, w*1.0],
      [w*1.0, w*0.5],
    ], {fill: color}),
    svg.node('g', children=[
      triangle([w/2, w*0.4], w/4, w*0.15, {fill: 'white'}),
      triangle([w/2, w*0.55], w/3, w*0.25, {fill: 'white'}),
      triangle([w/2, w*0.7], w/2.4, w*0.25, {fill: 'white'}),
      svg.rect([w/2-w/20, w*0.65], w/10, w/9, props={fill: 'white'}),
    ]),
  ],
);

{
  'christmas.svg': svg.svg(
    [0, 0, '100%', '100%'],
    [
      svg.rect(width='100%', height='100%', props={fill: 'red'}),
      svg.rect(width='100%', height='100%', props={fill: 'url(#tile1)'}),
      svg.rect(width='200%', height='200%', props={transform: 'translate(%(dx)f %(dy)f)' % {dx: -71, dy: -71}, fill: 'url(#tile2)'}),
    ],
    defs={
      'tile1': tile(71*2, 'none'),
      'tile2': tile(71*2, 'black'),
    },
  ),
  'heart.svg': svg.svg(
    [-40, 0, 150, 100],
    [
      svg.node('path', {
        d: heart,
        fill: 'grey',
        transform: std.join(' ', [
          'rotate(-10 50 100)',
          'translate(-36 45.5)',
          'skewX(40)',
          'scale(1 0.5)',
        ]),
      }),
      svg.node('path', {
        d: heart,
        fill: 'none',
        stroke: 'black',
      }),
    ],
  ),
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
        [0, 0, w, w],
        width=w,
        height=w,
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
