import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SignUpRegionStep extends StatefulWidget {
  const SignUpRegionStep({super.key});

  @override
  State<SignUpRegionStep> createState() => _SignUpRegionStepState();
}

class _SignUpRegionStepState extends State<SignUpRegionStep> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  // Define regions and their corresponding coordinates
  Map<String, LatLng> regionCoordinates = {
    'Alsace-Champagne-Ardenne-Lorraine': LatLng(48.7032, 6.9384),
    'Aquitaine-Limousin-Poitou-Charentes': LatLng(45.8333, 0.5833),
    'Auvergne-Rhône-Alpes': LatLng(45.75, 3.1167),
    'Bourgogne-Franche-Comté': LatLng(47.1167, 3.4167),
    'Bretagne': LatLng(48.2025, -2.9326),
    'Centre-Val de Loire': LatLng(47.2536, 1.6493),
    'Ile-de-France': LatLng(48.8566, 2.3522),
    'Languedoc-Roussillon-Midi-Pyrénées': LatLng(43.6045, 1.4442),
    'Nord-Pas-de-Calais-Picardie': LatLng(50.6292, 3.0573),
    'Normandie': LatLng(49.1811, -0.3725),
    'Pays de la Loire': LatLng(47.4833, -0.9333),
    'Provence-Alpes-Côte d\'Azur': LatLng(43.5296, 5.4474),
  };

  // Default selected region
  String _selectedRegion = 'Ile-de-France'; // Initial value

  // Default camera position
  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(48.8566, 2.3522), // Default to Ile-de-France
    zoom: 6.0,
  );

  // Variable to store tapped position
  LatLng? _tappedPosition;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Dropdown button for region selection
          DropdownButton<String>(
            value: _selectedRegion,
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.deepPurple),
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  _selectedRegion = newValue;
                  _kGooglePlex = CameraPosition(
                    target: regionCoordinates[newValue]!,
                    zoom: 6.0,
                  );
                });
              }
            },
            items: regionCoordinates.keys.map((String region) {
              return DropdownMenuItem<String>(
                value: region,
                child: Text(region),
              );
            }).toList(),
          ),
          // Container for GoogleMap
          Container(
            height: 500,
            child: GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: _kGooglePlex,
              onTap: _onMapTapped,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          // Display tapped position if available
          if (_tappedPosition != null)
            Text('Tapped Position: $_tappedPosition'),
        ],
      ),
    );
  }

  // Callback function for onTap on the map
  void _onMapTapped(LatLng latLng) {
    setState(() {
      _tappedPosition = latLng;
    });
  }
}
