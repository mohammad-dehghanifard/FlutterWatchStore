import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_watch_store/core/resources/extension.dart';
import 'package:flutter_watch_store/core/widgets/watch_main_button_widget.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class MapDialog extends StatefulWidget {
  const MapDialog({super.key, required this.onSelect});
  final Function(double latitude , double longitude) onSelect;
  @override
  State<MapDialog> createState() => _MapDialogState();
}



class _MapDialogState extends State<MapDialog> {
  final MapController mapController = MapController();
  LatLng? selectedPosition;
  List<Marker> markers = [];

  @override
  void initState() {
    _determinePosition();
    super.initState();
  }


  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {

      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition();
    selectedPosition = LatLng(position.latitude, position.longitude);
    mapController.move(LatLng(position.latitude, position.longitude), 15);
    markers.add(Marker(point: LatLng(position.latitude, position.longitude), child: Icon(Icons.location_on,color: Theme.of(context).primaryColor)));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(12),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height / 1.4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: FlutterMap(
                    mapController: mapController,
                    options:  MapOptions(
                      onTap: (tapPosition, point) {
                        selectedPosition = point;
                        markers.clear();
                        markers.add(Marker(point: point, child: Icon(Icons.location_on,color: Theme.of(context).primaryColor)));
                        setState(() {});
                      },
                      initialCenter: const LatLng(28.916822, 50.823544),
                      initialZoom: 9.2,
                    ),
                    children: [
                      TileLayer(urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png'),
                      MarkerLayer(markers: markers)
                    ],
                  ),
                ),
              ),
              16.0.height,
              WatchMainButton(title: "ثبت موقعیت", onTap: () {
                if(selectedPosition != null) {
                  widget.onSelect(selectedPosition!.latitude,selectedPosition!.longitude);
                }
              }),
              8.0.height,
            ],
          ),
        ),
      ),
    );
  }
}




