import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const kGoogleApiKey = 'AIzaSyASI3gnTSvqew4NK-B7CmJMVio3PcgqpbQ';
GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

class StoreLocator extends StatefulWidget {
  @override
  _StoreLocatorState createState() => _StoreLocatorState();
}

class _StoreLocatorState extends State<StoreLocator> {
  GoogleMapController mapController;
  List<PlacesSearchResult> places = [];
  PlacesDetailsResponse place;

  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(45.521563, -122.677433);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            zoom: 11,
            target: _center,
          ),
        )
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }
}