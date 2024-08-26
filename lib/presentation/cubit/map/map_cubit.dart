import 'package:bloc/bloc.dart';
import 'package:car_care/presentation/cubit/map/map_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart' as locate;

import '../../../core/constants/app_colors.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitialState());

  final MapController mapController = MapController();
  locate.LocationData? currentLocation;
  List<Marker> marker = [];
  final String apiKey =
      '5b3ce3597851110001cf6248e817d0984a2f4eb697e7c58cbc9233df';
  String? address;
  String? locationString;

  Future<void> getAddressFromLatLng(locate.LocationData location) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        location.latitude!,
        location.longitude!,
      );
      Placemark place = placemarks[0];

      address = "${place.street}, ${place.locality}, ${place.country}";
      emit(ChangePickedLocationSuccessState());
    } catch (e) {
      address = "Unable to get address";
      emit(ChangePickedLocationFailuireState());
    }
  }

  Future<void> getCuruntLocation() async {
    var location = locate.Location();

    try {
      var userLocation = await location.getLocation();

      currentLocation = userLocation;
      updateLocationString(userLocation.latitude!, userLocation.longitude!);
      marker.add(Marker(
        point: LatLng(
          userLocation.latitude!,
          userLocation.longitude!,
        ),
        child: const Icon(
          Icons.location_on_outlined,
          size: 30,
          color: AppColors.black,
        ),
        height: 80,
        width: 80,
      ));
      emit(ChangeLocationMarkerOnMap());
    } on Exception {
      currentLocation = null;
      emit(ChangeLocationMarkerFailureOnMap());
    }

    location.onLocationChanged.listen((locate.LocationData newLocation) {
      newLocation = currentLocation!;
      updateLocationString(newLocation.latitude!, newLocation.longitude!);
      emit(ChangeLocationToNewLocation());
    });
  }

  Future<void> updateLocationString(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        final placemark = placemarks.first;

        locationString =
            '${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}';
        emit(ChangeCurrentLocationToStringSuccessState());
      } else {
        locationString = 'Address not found.';
        emit(ChangeCurrentLocationToStringFailureState());
      }
    } catch (e) {
      locationString = 'Unable to get address.';
      emit(ChangeCurrentLocationToStringFailureState());
    }
  }
}
