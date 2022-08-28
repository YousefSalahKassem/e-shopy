import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_boilerplate/helpers/remote_util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressProvider with ChangeNotifier {
  static final provider = Provider<AddressProvider>((ref) {
    return AddressProvider._(
      ref.read(RemoteUtil.provider),
    );
  });

  final RemoteUtil _remoteUtil;
  String _address = '';

  String get address => _address;
  Completer<GoogleMapController> addressController = Completer();

  final List<Marker> markers = <Marker>[];
  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(33.6844, 73.0479),
    zoom: 14,
  );

  List<Marker> list = const [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(33.6844, 73.0479),
      infoWindow: InfoWindow(title: 'some Info '),
    ),
  ];

  Future<void> getUserCurrentLocation() async {
    /// TODO no need for then and error here
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {});

    await Geolocator.getCurrentPosition().then((value) async {
      markers.add(
        Marker(
          markerId: const MarkerId('SomeId'),
          position: LatLng(value.latitude, value.longitude),
          infoWindow: InfoWindow(
            title: address,
          ),
        ),
      );
      final GoogleMapController controller = await addressController.future;

      kGooglePlex = CameraPosition(
        target: LatLng(value.latitude, value.longitude),
        zoom: 14,
      );
      controller.animateCamera(CameraUpdate.newCameraPosition(kGooglePlex));

      final List<Placemark> placeMarks =
          await placemarkFromCoordinates(value.latitude, value.longitude);

      final add = placeMarks.first;
      _address =
          "${add.locality} ${add.administrativeArea} ${add.subAdministrativeArea} ${add.country}";
      _remoteUtil.countryController.text = add.country!;
      _remoteUtil.cityController.text = add.subAdministrativeArea!;
      _remoteUtil.streetController.text = add.locality!;
      _remoteUtil.postalCodeController.text = add.postalCode!;
      notifyListeners();
    });
  }

  AddressProvider._(this._remoteUtil) {
    markers.addAll(list);
  }
}
