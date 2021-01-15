import 'dart:math' as mathdart;
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart' as mb;
import 'package:geolocator/geolocator.dart' as geo;

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  var token =
      'pk.eyJ1IjoicmlmYWxyaXpraSIsImEiOiJja2p3aWRodWMwN3ZlMnhwZ3NrdXdubWN6In0.1syOrvt7Yzs1fplwtIlcPg';

  mb.MapboxMapController mapController;
  mb.LatLng gpsLoc;
  mb.Circle curPosCircle;

  @override
  void initState() {
    super.initState();
    // checkPermissionGps();
  }

  void msgLocError(String msg) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return new AlertDialog(
          title: Text('Error'),
          content: Text(msg),
          actions: [
            RaisedButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void getCurrentLoc() async {
    geo.Geolocator.getCurrentPosition().then((geo.Position pos) {
      print('GPS LOCATION: ${pos.latitude} ${pos.longitude}');
      if (mapController != null) {
        gpsLoc = new mb.LatLng(pos.latitude, pos.longitude);
        var newCamLoc = mb.CameraUpdate.newLatLng(gpsLoc);
      }
    });
  }

  void checkPermissionGps() async {
    print("CHECKING LOCATION BEGIN");
    var locEnabled = await geo.Geolocator.isLocationServiceEnabled();
    if (locEnabled == false) {
      msgLocError('Layanan Lokasi tidak aktif');
    } else {
      // msgLocError('Layanan Lokasi aktif');
      geo.LocationPermission punyaIjin = await geo.Geolocator.checkPermission();

      if (punyaIjin == geo.LocationPermission.deniedForever) {
        msgLocError('aplikasi diblokir permanen');
      } else if (punyaIjin == geo.LocationPermission.denied) {
        // meminta konfirmasi ijn user
        geo.LocationPermission req = await geo.Geolocator.requestPermission();

        if (req == geo.LocationPermission.always ||
            req == geo.LocationPermission.whileInUse) {
          // msgLocError('user mengijinkan');
          getCurrentLoc();
        } else {
          msgLocError('user tidak mengizinkan');
        }
      } else {
        getCurrentLoc();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            buildMap(),
            buildBtnBottomRow(),
          ],
        ),
      ),
    );
  }

  Widget buildMap() {
    return Container(
      height: 550,
      child: mb.MapboxMap(
        accessToken: token,
        styleString: 'mapbox://styles/mapbox/streets-v11',
        initialCameraPosition: new mb.CameraPosition(
          target: mb.LatLng(-8.1766639, 113.6916075),
          zoom: 8,
        ),
        onMapCreated: mapCreated,
        onMapClick: mapClicked,
      ),
    );
  }

  void mapClicked(mathdart.Point<double> point, mb.LatLng latlng) {
    print('lat lng clicked: ${latlng.latitude}, ${latlng.longitude}');
    if (mapController != null) {
      mapController.addCircle(
        new mb.CircleOptions(
          circleRadius: 8,
          circleColor: 'red',
          circleOpacity: 1,
          geometry: latlng,
          draggable: false,
        ),
      );
    }
  }

  void mapCreated(mb.MapboxMapController controller) {
    mapController = controller;
    print('map created');

    var lokasi = mb.LatLng(-8.1766639, 113.6916075);

    mapController.addCircle(new mb.CircleOptions(
      circleRadius: 8,
      circleColor: 'blue',
      circleOpacity: 1,
      geometry: lokasi,
      draggable: false,
    ));

    checkPermissionGps();
  }

  Widget buildBtnBottomRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RaisedButton(
          child: Text('Re-center'),
          onPressed: () {
            var center = new mb.LatLng(-8.1766639, 113.6916075);
            var updatedLoc = mb.CameraUpdate.newLatLng(center);
            if (mapController != null) {
              mapController.animateCamera(updatedLoc);
            } else {
              print('map controller is null');
            }
          },
        ),
        RaisedButton(onPressed: () {}, child: Text('Lokasi saya')),
      ],
    );
  }
}
