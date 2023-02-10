local _commaPoints(points) = std.map(
  function(p) "%(x)s,%(y)s" % {x: p[0], y: p[1]},
  points,
);
local _spacePointsList(points) = std.join(' ', _commaPoints(points));
local node(tag, props={}, children=[]) = [tag, props] + children;

{
  node:: node,
  svg(viewbox, elems, defs={}):: std.manifestXmlJsonml(node('svg',
    {
      viewBox: std.join(' ', std.map(std.toString, viewbox)),
      xmlns: 'http://www.w3.org/2000/svg',
      'xmlns:xlink': 'http://www.w3.org/1999/xlink',
    },
    [node('defs', children=[
      node(
      defs[k][0],
      defs[k][1] + {id: k},
      [defs[k][2]],
      ) for k in std.objectFields(defs)
    ])] + elems,
  )),
  circle(center=[0, 0], r=0, props={}):: node('circle', {
    cx: center[0],
    cy: center[1],
    r: r,
    } + props),
  ellipse(center=[0, 0], rx=0, ry=0, props={}):: node('ellipse', {
    x: center[0], y: center[1],
    rx: rx, ry: ry,
    } + props),
  rect(topleft=[0, 0], width, height, rx=0, ry=0, props={}):: node('rect', {
    x: topleft[0], y: topleft[1],
    width: width, height: height,
    rx: rx, ry: ry,
    } + props),
  line(begin, end, props={}):: node('line', {
    x1: begin[0], y1: begin[1],
    x2: end[0], y2: end[1],
    } + props),
  polyline(points, props={}):: node('polyline', {
    points: _spacePointsList(points),
    } + props),
  polygon(points, props={}):: node('polygon', {
    points: _spacePointsList(points),
    } + props),
  // path(points, props={}):: node('path', {
  //   d: _spacePointsList(points),
  //   } + props),
  pattern(viewbox, x=0, y=0, width=0, height=0, props={}, children=[]):: node('pattern', {
    viewBox: viewbox,
    x: 0, y: 0,
    width: width, height: height,
    } + props, children),
}
