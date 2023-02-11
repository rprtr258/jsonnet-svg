local svg = import 'svg.libsonnet';

local triangle(base, width, height, props={}) = svg.polygon([
  [base[0], base[1]-height],
  [base[0]+width/2, base[1]],
  [base[0]-width/2, base[1]],
], props);

local tile(w, color) =  svg.pattern(
  w, w,
  props={patternUnits: 'userSpaceOnUse'},
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
}
