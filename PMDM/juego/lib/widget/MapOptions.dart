var resolutions = <double>[32768, 16384, 8192, 4096, 2048, 1024, 512, 256, 128];
var maxZoom = (resolutions.length - 1).toDouble();

var epsg3413CRS = Proj4Crs.fromFactory(
  code: 'EPSG:3413',
  proj4Projection:
      proj4.Projection.add('EPSG:3413', '+proj=stere +lat_0=90 +lat_ts=70 +lon_0=-45 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs'),
  resolutions: resolutions
);


Widget build(BuildContext context) {
  return new FlutterMap(
    options: new MapOptions(
      center: new LatLng(51.5, -0.09),
      zoom: 13.0,
    ),layers: [
      MarkerLayerOptions(
        markers: [
          Marker(
            width: 80.0,
            height: 80.0,
            point: LatLng(51.5, -0.09),
            builder: (ctx) =>
            Container(
              child: FlutterLogo(),
            ),
          ),
        ],
      ),
    ]
    layers: [
      new TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c']),
      new MarkerLayerOptions(
        markers: [
          new Marker(
            width: 80.0,
            height: 80.0,
            point: new LatLng(51.5, -0.09),
            builder: (ctx) => new Container(
              child: new FlutterLogo(),
            ),
          ),
        ],
      ),
    ],
  );
}
