import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlertMessage {
  showAlert(BuildContext context, message, status) {
    Color warnafill;
    Color warnagaris;
    IconData ikon;

    if (status) {
      warnafill = const Color(0xFFE8EDDE);
      warnagaris = const Color(0xFF556B2F);
      ikon = Icons.check_circle_outline_rounded;
    } else {
      warnafill = const Color(0xFFF5EBE0);
      warnagaris = const Color(0xFF3E2723);
      ikon = Icons.error_outline_rounded;
    }

    SnackBar snackBar = SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: warnafill,
          border: Border.all(color: warnagaris, width: 2),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0x11000000),
              spreadRadius: 1.0,
              blurRadius: 10.0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(ikon, color: warnagaris),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: GoogleFonts.plusJakartaSans(
                  color: const Color(0xFF3E2723),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              icon: Icon(Icons.close, size: 18, color: warnagaris),
            ),
          ],
        ),
      ),
    );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
