import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    super.key,
    required this.mapController,
    this.latitude,
    this.longitude,
  });

  final MapController mapController;
  final double? latitude;
  final double? longitude;

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: FlutterMap(
        mapController: widget.mapController,
        options: MapOptions(
          // interactionOptions: const InteractionOptions(
          //   flags: InteractiveFlag.none,
          // ),
          initialCenter: LatLng(
            widget.latitude ?? -6.175312328638252,
            widget.longitude ?? 106.82716964518957,
          ),
          initialZoom: 9.2,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(
                  widget.latitude ?? -6.175312328638252,
                  widget.longitude ?? 106.82716964518957,
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
    );
  }
}
