import 'package:car_care/app/routing/app_routing.dart';
import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/presentation/cubit/workshop/cubit/nearestworkshop_cubit.dart';
import 'package:car_care/presentation/widget/custom/custom_arrow_forward.dart';
import 'package:car_care/presentation/widget/workshop/search_and_filter_icon.dart';
import 'package:car_care/presentation/widget/workshop/switch_widget.dart';
import 'package:car_care/presentation/widget/workshop/workshop_list_view_on_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class WorkshopOnMapView extends StatefulWidget {
  const WorkshopOnMapView({super.key});

  @override
  State<WorkshopOnMapView> createState() => _WorkshopOnMapViewState();
}

class _WorkshopOnMapViewState extends State<WorkshopOnMapView> {
  // Controller to move the camera on the map
  final MapController _mapController = MapController();

  // Default center point for the map
  final LatLng _defaultCenter = const LatLng(40.7128, -74.0060);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NearestWorkshopCubit, NearestWorkshopState>(
        builder: (context, state) {
          List<Marker> markers = [];

          if (state is NearestWorkshopSuccess) {
            markers = state.workshops
                .map((workshop) => Marker(
                      point: LatLng(double.parse(workshop.geoLat.toString()),
                          double.parse(workshop.geoLng.toString())),
                      width: 40,
                      height: 40,
                      child: const Icon(
                        Icons.location_on,
                        color: AppColors.primary,
                        size: 40,
                      ),
                    ))
                .toList();
          }

          return Stack(
            children: [
              FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter:
                        markers.isNotEmpty ? markers[0].point : _defaultCenter,
                    initialZoom: 13.0,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: const ['a', 'b', 'c'],
                    ),
                    MarkerLayer(markers: markers),
                  ]),
              Positioned(
                  top: 20,
                  right: 16,
                  child: CustomArrowBack(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )),
              const Positioned(
                top: 100,
                right: 5,
                child: Row(
                  children: [
                    SearchAndFilterIcon(),
                  ],
                ),
              ),
              Positioned(
                top: 170,
                right: 16,
                child: SwitchWidget(
                  initialValue: true,
                  onChanged: (value) {},
                ),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: state is NearestWorkshopSuccess
                    ? WorkshopListViewOnMap(workshops: state.workshops)
                    : const Center(child: CircularProgressIndicator()),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.my_location),
        onPressed: () {
          // Move to default center or adjust if needed
          _mapController.move(_defaultCenter, 15.0);
        },
      ),
    );
  }
}
