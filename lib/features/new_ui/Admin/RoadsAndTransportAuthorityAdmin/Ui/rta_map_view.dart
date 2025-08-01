import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RtaMapView extends StatefulWidget {
  final dynamic lat;
  final dynamic long;
  const RtaMapView({super.key, this.lat, this.long});

  @override
  State<RtaMapView> createState() => _RtaMapViewState();
}

class _RtaMapViewState extends State<RtaMapView> {
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
          'Map View'.tr(),
          style: TextStyle(fontSize: context.mh * 0.018, color: Colors.white),
        ),
        backgroundColor: Color(0xFFbd4753),
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
