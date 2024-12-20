import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hariom/utils/app_color.dart';

class AppDialog {
  // Private constructor to prevent instantiation
  AppDialog._();

  // Static method to get an instance
  static AppDialog instance() => AppDialog._();

  // Method to show an adaptive info dialog
  void infoDialog({
    required BuildContext context,
    required String title,
    required String content,
    Function()? onActionPressed, // Added a function for button action
    bool dismissable=false,
    String actionName = 'Ok', // Default action button name
  }) {
    showDialog(
      context: context,
      barrierDismissible: dismissable,
      builder: (context) => AlertDialog.adaptive(
        title: Text(title), // Proper Text widget for title
        content: Text(content), // Proper Text widget for content
        actions: [
          TextButton(
            onPressed: () {
              // Call the passed function when the action button is pressed
              if (onActionPressed != null) {
                Navigator.of(context).pop(); // Close the dialog
                onActionPressed();
              }else {
                Navigator.of(context).pop(); // Close the dialog
              }
            },
            child: Text(actionName, style: GoogleFonts.exo(color: MyAppColors.instance().black),), // Display the action button text
          ),
        ],
      ),
    );
  }

  void confDialog({
    required BuildContext context,
    required String title,
    required String content,
    required Function() onActionPressed, // Added a function for button action
    bool dismissable=false,
    String actionName = 'Ok', // Default action button name
  }) {
    showDialog(
      context: context,
      barrierDismissible: dismissable,
      builder: (context) => AlertDialog.adaptive(
        title: Text(title), // Proper Text widget for title
        content: Text(content), // Proper Text widget for content
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Cancel', style: GoogleFonts.exo(color: MyAppColors.instance().black),), // Display the action button text
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onActionPressed();
            },
            child: Text(actionName, style: GoogleFonts.exo(color: MyAppColors.instance().black),), // Display the action button text
          ),
        ],
      ),
    );
  }
}
