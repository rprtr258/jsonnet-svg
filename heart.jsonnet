local svg = import 'svg.libsonnet';

local heart = std.join(' ', [
  'M 10,30',
  'A 20,20 0,0,1 50,30',
  'A 20,20 0,0,1 90,30',
  'Q 90,60 50,90',
  'Q 10,60 10,30',
  'z',
]);

{
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
}
