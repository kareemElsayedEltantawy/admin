import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utility/app_theme.dart';

class CustomRadioOption<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final Widget labelWidget;
  final ValueChanged<T> onChanged;

  const CustomRadioOption({
    required this.value,
    required this.groupValue,
    required this.labelWidget,
    required this.onChanged,
  });

  Widget BuildCircle() {
    final bool isSelected = value == groupValue;
    return CircleAvatar(
      radius: 10.r,
      backgroundColor:
      isSelected ? AppColors.mainColor : AppColors.black.withOpacity(.2),
      child: CircleAvatar(
        radius: 8.r,
        backgroundColor: AppColors.white,
        child: CircleAvatar(
          radius: 5.5.r,
          backgroundColor: isSelected
              ? AppColors.mainColor
              : AppColors.black.withOpacity(.2),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () => onChanged(value),
        child: Padding(
          padding: EdgeInsets.all(5.sp),
          child: Row(
            children: [ BuildCircle(), const SizedBox(width: 10), labelWidget],
          ),
        ),
      ),
    );
  }
}
