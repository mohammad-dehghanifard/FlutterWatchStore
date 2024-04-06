import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_watch_store/core/resources/extension.dart';
import 'package:flutter_watch_store/core/widgets/watch_main_button_widget.dart';
import 'package:latlong2/latlong.dart';

class MapDialog extends StatelessWidget {
  const MapDialog({super.key});

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
                    options: const MapOptions(
                      initialCenter: LatLng(28.916822, 50.823544),
                      initialZoom: 9.2,
                    ),
                    children: [
                      TileLayer(urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png'),
                    ],
                  ),
                ),
              ),
              16.0.height,
              WatchMainButton(title: "ثبت موقعیت", onTap: () {}),
              8.0.height,
            ],
          ),
        ),
      ),
    );
  }
}
