import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';

import '../../../common/utils/appcolors.dart';

class AccessoriesWidget extends StatelessWidget {
  const AccessoriesWidget(
      {Key? key, required this.text, required this.onTap, this.color})
      : super(key: key);

  final String text;
  final Function(String) onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(text);
      },
      child: Container(
        height: 45,
        width: 102,
        margin: const EdgeInsets.only(left: 6, bottom: 6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13), color: color),
        child: Center(
          child: Text(
            //  "12344",
            // text,
            DateTime.parse(text)
                .format(DateTimeFormats.american)
                .toString()
                .substring(17)
                .toUpperCase()
                .toString(),
            style: const TextStyle(
                // textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 11,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                color: AppColors.whitecolor),
          ),
        ),
      ),
    );
  }
}
