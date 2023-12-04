import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    super.key,
    required this.mapController,
    this.position,
  });

  final MapController mapController;
  final Position? position;

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: widget.position == null,
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: FlutterMap(
          mapController: widget.mapController,
          options: MapOptions(
              interactionOptions: const InteractionOptions(
                flags: InteractiveFlag.none,
              ),
              initialCenter: LatLng(
                widget.position?.latitude ?? -6.175312328638252,
                widget.position?.longitude ?? 106.82716964518957,
              ),
              initialZoom: 16),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: LatLng(
                    widget.position?.latitude ?? -6.175312328638252,
                    widget.position?.longitude ?? 106.82716964518957,
                  ),
                  child: const Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 40,
                  ),
                  alignment: Alignment.topLeft,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
