import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hariom/utils/app_assets.dart';

import '../../../../model/dashboard_model.dart';

class OverviewUi extends StatelessWidget {
  const OverviewUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Image.asset(MyAppAssets.instance().png_attendance),
    );
  }
}
