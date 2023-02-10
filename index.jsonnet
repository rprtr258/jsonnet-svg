local svg = import 'svg.libsonnet';

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
