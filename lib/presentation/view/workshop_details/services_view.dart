import 'package:car_care/core/constants/app_colors.dart';
import 'package:car_care/presentation/cubit/workshop/cubit/nearestworkshop_cubit.dart';
import 'package:car_care/presentation/widget/custom/default_button.dart';
import 'package:car_care/presentation/widget/custom/white_container.dart';
import 'package:car_care/presentation/widget/workshop_details/list_services_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesView extends StatefulWidget {
  const ServicesView({
    super.key,
  });

  @override
  State<ServicesView> createState() => _ServicesViewState();
}

class _ServicesViewState extends State<ServicesView> {
  List<bool> _selectedServices = []; // To track checkbox states

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NearestWorkshopCubit, NearestWorkshopState>(
        builder: (context, state) {
          if (state is WorkshopByIdLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is WorkshopByIdSuccess) {
            final details = state.workshopDetailsEntity;

            // Initialize _selectedServices based on the services count
            if (_selectedServices.length != details.services!.length) {
              _selectedServices =
                  List.generate(details.services!.length, (index) => false);
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: details.services!.length,
                    itemBuilder: (context, index) {
                      return ListServicesWidget(
                        pic: details.services![index].serviceImage ??
                            'https://via.placeholder.com/150',
                        title: details.services![index].arName ?? "لا يوجد",
                        value: _selectedServices[index],
                        onChanged: (value) {
                          setState(() {
                            _selectedServices[index] = value ?? false;
                          });
                        },
                      );
                    },
                  ),
                ),
                WhiteContainer(
                    widget: DefaultButton(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        height: MediaQuery.sizeOf(context).height * 0.06,
                        containerColor: AppColors.primary,
                        title: 'احجز ',
                        onPressed: () {}))
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
