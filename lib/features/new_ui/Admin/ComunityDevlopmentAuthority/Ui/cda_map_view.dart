import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CdaMapView extends StatefulWidget {
  final dynamic lat;
  final dynamic long;
  const CdaMapView({super.key, this.lat, this.long});

  @override
  State<CdaMapView> createState() => _CdaMapViewState();
}

class _CdaMapViewState extends State<CdaMapView> {
  List<Marker> markers = [];

  @override
  void initState() {
    List<Marker> _listOfMarkers = [
      Marker(
        markerId: MarkerId('1'),
        position: LatLng(double.tryParse(widget.lat) ?? 31.5204,
            double.tryParse(widget.long) ?? 74.3587),
      ),
    ];
    markers.addAll(_listOfMarkers);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Map View',
          style: TextStyle(fontSize: context.mh * 0.018, color: Colors.white),
        ),
        backgroundColor: Color(0xFF1e40af),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(double.tryParse(widget.lat) ?? 31.5204,
                double.tryParse(widget.long) ?? 74.3587),
            zoom: 14),
        markers: Set<Marker>.of(markers),
      ),
    );
  }
}
