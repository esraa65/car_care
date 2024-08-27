import 'package:car_care/app/routing/routes.dart';
import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/core/constants/app_sizes.dart';
import 'package:car_care/core/extensions/media_query.dart';
import 'package:car_care/presentation/cubit/map/map_cubit.dart';
import 'package:car_care/presentation/cubit/map/map_state.dart';
import 'package:car_care/presentation/widget/custom/custom_arrow_forward.dart';
import 'package:car_care/presentation/widget/custom/default_button.dart';
import 'package:car_care/presentation/widget/custom/white_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart' as locate;
import '../../../widget/custom/custom_search_bar.dart';
import '../../../widget/custom/default_text.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapCubit()..getCuruntLocation(),
      child: BlocBuilder<MapCubit, MapState>(
        builder: (context, state) {
          final cubit = context.read<MapCubit>();
          return Scaffold(
            body: cubit.currentLocation == null
                ? const Center(child: CircularProgressIndicator())
                : Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      FlutterMap(
                        options: MapOptions(
                          initialCenter: LatLng(
                            cubit.currentLocation!.latitude!,
                            cubit.currentLocation!.longitude!,
                          ),
                          initialZoom: 15,
                          onTap: (tapPosition, latlng) {
                            setState(() {
                              cubit.currentLocation =
                                  locate.LocationData.fromMap({
                                'latitude': latlng.latitude,
                                'longitude': latlng.longitude,
                              });
                              cubit.marker.clear();
                              cubit.marker.add(
                                Marker(
                                  point: latlng,
                                  child: const Icon(
                                    Icons.location_on_outlined,
                                    size: 30,
                                    color: AppColors.black,
                                  ),
                                  height: 80,
                                  width: 80,
                                ),
                              );
                              cubit.mapController.move(latlng, 15);
                            });
                            cubit.getAddressFromLatLng(
                                locate.LocationData.fromMap({
                              'latitude': latlng.latitude,
                              'longitude': latlng.longitude,
                            }));
                          },
                        ),
                        mapController: cubit.mapController,
                        children: [
                          TileLayer(
                            urlTemplate:
                                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                            subdomains: const ['a', 'b', 'c'],
                          ),
                          MarkerLayer(
                            markers: cubit.marker,
                          ),
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
                                  CustomSearchBar(
                                    hintText: cubit.address ??
                                        cubit.locationString ??
                                        "بحث",
                                  ),
                                ],
                              ),
                            ),
                          ),
                          WhiteContainer(
                            widget: DefaultButton(
                              width: double.maxFinite,
                              title: "تاكيد",
                              onPressed: () {
                                context.push(Routes.filteration);
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
          );
        },
      ),
    );
  }
}
