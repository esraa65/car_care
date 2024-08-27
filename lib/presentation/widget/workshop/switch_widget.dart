import 'package:car_care/app/routing/routes.dart';
import 'package:car_care/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SwitchWidget extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const SwitchWidget({
    super.key,
    this.initialValue = true,
    required this.onChanged,
  });

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  late bool _isIcon1Selected;

  @override
  void initState() {
    super.initState();
    _isIcon1Selected = widget.initialValue;
  }

  void _toggle() {
    setState(() {
      _isIcon1Selected = !_isIcon1Selected;
      widget.onChanged(_isIcon1Selected);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.width * 0.13,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24), color: AppColors.greyD8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              iconSize: 30,
              icon: const Icon(Icons.map_outlined),
              color: !_isIcon1Selected ? Colors.blue : Colors.grey,
              onPressed: () {
                context.pushNamed(
                  Routes.workshopOnMapView,
                );
              },
            ),
            const SizedBox(width: 16),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 4),
              child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.white),
                child: IconButton(
                  iconSize: 30,
                  icon: const Icon(Icons.list_outlined),
                  color: _isIcon1Selected ? Colors.blue : Colors.grey,
                  onPressed: () {
                    context.pushNamed(Routes.workShop);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
