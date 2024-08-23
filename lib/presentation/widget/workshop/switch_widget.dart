import 'package:car_care/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

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
        width: MediaQuery.of(context).size.width * 0.28,
        height: MediaQuery.of(context).size.width * 0.12,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24), color: AppColors.greyD8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.map_outlined,
              color: !_isIcon1Selected ? Colors.blue : Colors.grey,
              size: 30,
            ),
            const SizedBox(width: 16),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.white),
              child: Icon(
                Icons.list_outlined,
                color: _isIcon1Selected ? Colors.blue : Colors.grey,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
