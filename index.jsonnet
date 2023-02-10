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
local circle(center=[0, 0], r=0, props={}) = node('circle', {
  cx: center[0],
  cy: center[1],
  r: r,
} + props);
local ellipse(center=[0, 0], rx=0, ry=0, props={}) = node('ellipse', {
  x: center[0], y: center[1],
  rx: rx, ry: ry,
} + props);
local rect(topleft=[0, 0], width, height, rx=0, ry=0, props={}) = node('rect', {
  x: topleft[0], y: topleft[1],
  width: width, height: height,
  rx: rx, ry: ry,
} + props);
local line(begin, end, props={}) = node('line', {
  x1: begin[0], y1: begin[1],
  x2: end[0], y2: end[1],
} + props);
local _commaPoints(points) = std.map(
  function(p) "%(x)s,%(y)s" % {x: p[0], y: p[1]},
  points,
);
local _spacePointsList(points) = std.join(' ', _commaPoints(points));
local polyline(points, props={}) = node('polyline', {
  points: _spacePointsList(points),
} + props);
local polygon(points, props={}) = node('polygon', {
  points: _spacePointsList(points),
} + props);
local path(points, props={}) = node('path', {
  d: _spacePointsList(points),
} + props);
local pattern(viewbox, x=0, y=0, width=0, height=0, props={}, children=[]) = node('pattern', {
  viewBox: viewbox,
  x: 0, y: 0,
  width: width, height: height,
} + props, children);

{
  'index.svg': svg(
    [0, 0, 230, 100],
    [
      rect([0, 0], 230, 100, props={fill: 'violet'}),
      // rect([0, 0], 230, 100, props={fill: 'url(#star)'}),
      circle([50, 50], 50, {fill: 'url(#star)'}),
      circle([180, 50], 40, {
        fill: 'none',
        'stroke-width': 20,
        stroke: 'url(#star)',
      }),
      polygon([
        [std.cos(a) * 40 + 40, std.sin(a) * 40 + 40]
        for a in std.map(function(x)x*2*2*3.14159265/5, std.range(0, 5))
      ], {stroke: 'red'}),
    ],
    {
      'star': pattern(
        [0, 0, 10, 10],
        width='10',
        height='10',
        props={
          patternUnits: 'userSpaceOnUse',
        },
        children=[
          polygon([
            [0, 0],
            [2, 5],
            [0, 10],
            [5, 8],
            [10, 10],
            [8, 5],
            [10, 0],
            [5, 2],
          ]),
        ],
      ),
    },
  )
}
