import 'package:car_care/presentation/cubit/filteration/filteration_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../cubit/filteration/filteration_state.dart';

class CustomRating extends StatelessWidget {
  const CustomRating({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterationCubit, FilterationState>(
      builder: (context, state) {
        final cubit = context.read<FilterationCubit>();
        return RatingBar.builder(
          initialRating: cubit.rating,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            cubit.changeRatingValue(rating);
          },
        );
      },
    );
  }
}
