import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../utils/app_assets.dart';
import '../bottom_nav_1_cubit.dart';
import '../bottom_nav_1_state.dart';

class CheckOutUi extends StatelessWidget {
  const CheckOutUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DateFormat('hh:mm a').format(DateTime.now()),
            textAlign: TextAlign.center,
            style: GoogleFonts.exo(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            DateFormat('EEEE, MMM d').format(DateTime.now()),
            textAlign: TextAlign.center,
            style: GoogleFonts.exo(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.04,
          ),
          BlocBuilder<BottomNav1Cubit, BottomNav1State>(
            builder: (context, state) {
              return GestureDetector(
                  onTapDown: (_) {
                    context
                        .read<BottomNav1Cubit>()
                        .check_in_tab_check_in_button_clicked(context: context);
                  },
                  onTapCancel: () {
                    context
                        .read<BottomNav1Cubit>()
                        .check_in_tab_check_in_button_released();
                  },
                  onTapUp: (_) {
                    context
                        .read<BottomNav1Cubit>()
                        .check_in_tab_check_in_button_released();
                  },
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    height: MediaQuery.sizeOf(context).width * 0.4,
                    child: Container(
                      decoration: state.is_check_in_tab_check_in_button_clicked
                          ? ShapeDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment(-0.66, -0.75),
                                end: Alignment(0.66, 0.75),
                                colors: [Color(0xFFEF7E22), Color(0xFFC35700)],
                              ),
                              shadows: const [
                                BoxShadow(
                                    color: Color.fromRGBO(239, 126, 34, 0.3),
                                    spreadRadius: 10,
                                    blurRadius: 10)
                              ],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(160),
                              ),
                            )
                          : ShapeDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment(-0.66, -0.75),
                                end: Alignment(0.66, 0.75),
                                colors: [Color(0xFFEF7E22), Color(0xFFC35700)],
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(160),
                              ),
                            ),
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                                MyAppAssets.instance().svg_check_in),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Check Out',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.exo(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ));
            },
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.06,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildColumn('10:00 Am', 'Check In'),
              const SizedBox(width: 48),
              _buildColumn('08:00 Pm', 'Check Out'),
              const SizedBox(width: 48),
              _buildColumn('10:00', 'Working Hrs'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildColumn(String time, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          time,
          textAlign: TextAlign.center,
          style: GoogleFonts.exo(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 1.0, // Adjusted for better readability
          ),
        ),
        const SizedBox(height: 7),
        AutoSizeText(
          maxLines: 1,
          label,
          textAlign: TextAlign.center,
          style: GoogleFonts.exo(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            height: 1.2, // Adjusted for better spacing
          ),
        ),
      ],
    );
  }
}
