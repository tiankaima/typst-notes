= 符号计算软件大作业报告

PB21000030 马天开

#table(
  columns: (1fr, 1fr),
  align: center,
  [ Input ],
  [ Output ],
  image("imgs/input.jpg", width: 100%),
  image("imgs/output.png", width: 100%),
)

做了个简单的图像风格化的程序，最后代码大概100行左右，效果如上图所示。

== 处理思路

- Possion Disk Sampling，这个或许 Mathematica 有库函数，对照伪代码，自己搓了一个。
- Delaunay 三角剖分，这个 Mathematica 有现成的，拿来主义。
- 对每个三角形取中心点，取中心点的颜色，填充三角形。
- Manipulate 调整参数，可以调整采样半径。

== 使用方法

需要调整一下 `img=Import["~/Source/tiankaima/Notebooks/mma/cropped_img.jpg"];` 这一行，把图片路径改成自己的图片路径。

（当然，星空的图片我也附带打包进去了，这个效果还是美一点的）

== 亮点

我也不清楚要说什么了，总之有些地方可能顺手一点用了 lambda 函数，有些地方写的也比较别扭（#strike[可能正常的编程语言写多了是这样的]）

#pagebreak()

== Code

```wolfram
ClearAll["Global`"]
img = Import["~/Source/tiankaima/Notebooks/mma/cropped_img.jpg"];
imageWidth = ImageDimensions[img][[1]];

Manipulate[
 Module[
  {radius = selectedRadius,
   width = 1.0, height = 1.0,
   k = 30,
   gridSize, grid, activeList, samplePoints, initialPoint, point,
   found, newPoint, idxIdx, idx, gi, gj, triangles, scaledPoints,
   coloredTriangles},

  gridSize = radius/Sqrt[2];
  grid =
   Table[-1, {i, Ceiling[height/gridSize]}, {j,
     Ceiling[width/gridSize]}];
  activeList = {};
  samplePoints = {};

  distance[a_, b_] := Norm[a - b];
  gridPos[p_] := Floor[p/gridSize] + 1;

  randomPointAround[{x_, y_}] := With[
    {r = RandomReal[{radius, 2 radius}],
     theta = RandomReal[{0, 2 Pi}]},
    {x + r Cos[theta], y + r Sin[theta]}
    ];

  isValidPoint[p : {x_, y_}] :=
   0 <= x <= width &&
    0 <= y <= height &&
    AllTrue[Flatten[
      Table[
       If[grid[[i, j]] != -1,
        distance[samplePoints[[grid[[i, j]]]], p] >= radius,
        True
        ],
       {i, Max[1, gridPos[p][[1]] - 2],
        Min[Length[grid], gridPos[p][[1]] + 2]}, {j,
        Max[1, gridPos[p][[2]] - 2],
        Min[Length[grid[[1]]], gridPos[p][[2]] + 2]}],
      2],
     Identity
     ];

  initialPoint = {RandomReal[width], RandomReal[height]};
  AppendTo[samplePoints, initialPoint];
  AppendTo[activeList, initialPoint]; {gi, gj} =
   gridPos[initialPoint]; grid[[gi, gj]] = 1;

  While[activeList != {},
   idx = RandomInteger[{1, Length[activeList]}];
   point = activeList[[idx]];
   found = False;
   Do[newPoint = randomPointAround[point];
    If[isValidPoint[newPoint],
     AppendTo[samplePoints, newPoint];
     AppendTo[activeList, newPoint];
     {gi, gj} = gridPos[newPoint];
     grid[[gi, gj]] = Length[samplePoints];
     found = True;
     Break[];
     ], {k}];
   If[! found,
    activeList = Delete[activeList, idx]
    ];
   ];


  scaledPoints = samplePoints*imageWidth;
  triangles = DelaunayMesh[scaledPoints];
  triangleCentroid[pts_] := Mean[pts];
  sampleColor[pt_] := PixelValue[img, pt];
  coloredTriangles = Graphics[{
     EdgeForm[],
     Table[{
       RGBColor[
        sampleColor[
         triangleCentroid[MeshCoordinates[triangles][[triangle]]]]],
       Triangle[MeshCoordinates[triangles][[triangle]]]
       }, {
       triangle, First /@ MeshCells[triangles, 2]}]
     }, Frame -> False
    ];
  Show[coloredTriangles, Frame -> False]
  ],
 {{selectedRadius, 0.02, "Radius"}, {0.01, 0.02, 0.04, 0.08, 0.16,
   0.32}}
 ]
```