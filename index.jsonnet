local svg = import 'svg.libsonnet';

{
  'heart.svg': svg.svg(
    [-40, 0, 150, 100],
    [
      svg.node('g', {
        fill: 'grey',
        transform: 'rotate(-10 50 100)
                  translate(-36 45.5)
                  skewX(40)
                  scale(1 0.5)'
      }, [svg.node('path', {
        id: 'heart',
        d: std.join(' ', [
          'M 10,30',
          'A 20,20 0,0,1 50,30',
          'A 20,20 0,0,1 90,30',
          'Q 90,60 50,90',
          'Q 10,60 10,30',
          'z',
        ]),
      })]),
      '<use xlink:href="#heart" fill="none" stroke="black" />',
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
      'star': svg.pattern(
        [0, 0, 10, 10],
        width='10',
        height='10',
        props={
          patternUnits: 'userSpaceOnUse',
        },
        children=[
          svg.polygon([
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
