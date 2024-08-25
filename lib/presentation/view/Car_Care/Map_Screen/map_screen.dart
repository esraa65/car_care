import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/core/constants/app_sizes.dart';
import 'package:car_care/core/extensions/media_query.dart';
import 'package:car_care/presentation/widget/custom/custom_arrow_forward.dart';
import 'package:car_care/presentation/widget/custom/default_button.dart';
import 'package:car_care/presentation/widget/custom/white_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

import '../../../widget/custom/custom_search_bar.dart';
import '../../../widget/custom/default_text.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController mapController = MapController();
  LocationData? currentLocation;
  List<Marker> marker = [];
  final String apiKey =
      '5b3ce3597851110001cf6248e817d0984a2f4eb697e7c58cbc9233df';

  @override
  void initState() {
    getCuruntLocation();
    super.initState();
  }

  Future<void> getCuruntLocation() async {
    var location = Location();

    try {
      var userLocarion = await location.getLocation();
      setState(() {
        currentLocation = userLocarion;
        marker.add(Marker(
          point: LatLng(
            userLocarion.latitude!,
            userLocarion.longitude!,
          ),
          child: const Icon(
            Icons.location_on_outlined,
            size: 30,
            color: AppColors.black,
          ),
          height: 80,
          width: 80,
        ));
      });
    } on Exception {
      currentLocation = null;
    }

    location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        this.currentLocation = currentLocation;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentLocation == null
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                FlutterMap(
                  options: MapOptions(
                    initialCenter: LatLng(
                      currentLocation!.latitude!,
                      currentLocation!.longitude!,
                    ),
                    initialZoom: 15,
                  ),
                  mapController: mapController,
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: const ['a', 'b', 'c'],
                    ),
                    MarkerLayer(markers: marker),
                  ],
                ),
                Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 24),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const DefaultText(
                                  text: "موقعك علي الخريطة",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.black21,
                                ),
                                width(context.w * 0.18),
                                CustomArrowBack(
                                  onPressed: () {
                                    context.pop();
                                  },
                                ),
                              ],
                            ),
                            height(32),
                            const CustomSearchBar(),
                          ],
                        ),
                      ),
                    ),
                    WhiteContainer(
                      widget: DefaultButton(
                        width: double.maxFinite,
                        title: "تاكيد",
                        onPressed: () {},
                      ),
                    ),
                  ],
                )
              ],
            ),
    );
  }
}
