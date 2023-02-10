local node(tag, props={}, children=[]) = [tag, props] + children;
local svg(viewbox, elems, defs={}) = std.manifestXmlJsonml(node('svg',
  {
    viewBox: std.join(' ', std.map(std.toString, viewbox)),
    xmlns: 'http://www.w3.org/2000/svg',
  },
  [node('defs', children=[
    node(
      defs[k][0],
      defs[k][1] + {id: k},
      [defs[k][2]],
    ) for k in std.objectFields(defs)
  ])] + elems,
));
local circle(x, y, r, props={}) = node('circle', {
  cx: x,
  cy: y,
  r: r,
} + props);

{
  'index.svg': svg(
    [0, 0, 230, 100],
    [
      circle(50, 50, 50, {fill: 'url(#star)'}),
      circle(180, 50, 40, {
        fill: 'none',
        'stroke-width': 20,
        stroke: 'url(#star)',
      }),
    ],
    {
      'star': node('pattern',
        {
          id: 'star',
          viewBox: '0,0,10,10',
          width: '10%',
          height: '10%',
        },
        [
          node('polygon', {
            points: '0,0 2,5 0,10 5,8 10,10 8,5 10,0 5,2',
          }),
        ],
      ),
    },
  )
}
