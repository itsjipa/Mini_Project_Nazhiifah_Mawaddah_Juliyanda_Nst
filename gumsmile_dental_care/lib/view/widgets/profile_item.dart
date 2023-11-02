import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gumsmile_dental_care/const/constant.dart';

class Profilesetting extends StatelessWidget {
  const Profilesetting({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Constant().colorButton.withOpacity((0.1))),
          child: Icon(
            icon,
            color: Constant().colorIcon,
          ),
        ),
        title: Text(
          title,
          style: GoogleFonts.rubik(fontWeight: FontWeight.w600)
              .apply(color: textColor),
        ),
        trailing: endIcon
            ? Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Constant().colorButton.withOpacity(0.1)),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18.0,
                  color: Constant().colorIcon,
                ),
              )
            : null);
  }
}
