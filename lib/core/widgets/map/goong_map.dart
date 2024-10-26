import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/gen/assets.gen.dart';

class GoongMap extends StatefulWidget {
  final LocationData? initialLocation;
  final void Function(double lng, double lat)? onPickLocation;
  const GoongMap({
    super.key,
    this.initialLocation,
    this.onPickLocation,
  });

  @override
  State<GoongMap> createState() => _GoongMapState();
}

class _GoongMapState extends State<GoongMap> {
  MapboxMap? mapboxMap;

  void _onMapCreated(MapboxMap mapboxMap) async {
    this.mapboxMap = mapboxMap;
    _moveToInitialLocation();
  }

  Future<void> _moveToInitialLocation() async {
    if (widget.initialLocation == null) {
      showErrorSnackbar(context, 'Không thể xác định vị trí');
      return;
    }

    final longitude = widget.initialLocation!.longitude!;
    final latitude = widget.initialLocation!.latitude!;

    await mapboxMap?.setCamera(
      CameraOptions(
        center: Point(
          coordinates: Position(longitude, latitude),
        ),
        zoom: 18.0,
      ),
    );

    final pointAnnotationManager =
        await mapboxMap!.annotations.createPointAnnotationManager();
    final ByteData bytes =
        await rootBundle.load(Assets.images.currentLocationMark.path);
    final Uint8List list = bytes.buffer.asUint8List();

    var options = PointAnnotationOptions(
      geometry: Point(
        coordinates: Position(longitude, latitude),
      ),
      image: list,
      iconSize: 2.0,
    );

    pointAnnotationManager.create(options);
  }

  // @override
  // void dispose() {
  //   mapboxMap?.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return MapWidget(
      onMapCreated: _onMapCreated,
      onTapListener: widget.onPickLocation != null
          ? (mapContentGestureContext) {
              widget.onPickLocation!(
                mapContentGestureContext.point.coordinates.lng.toDouble(),
                mapContentGestureContext.point.coordinates.lat.toDouble(),
              );
            }
          : null,
    );
  }
}
