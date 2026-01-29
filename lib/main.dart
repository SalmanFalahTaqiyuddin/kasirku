import 'package:flutter/material.dart';
import 'package:penugasan1/views/dashboard.dart';
import 'package:penugasan1/views/kasir__view.dart';
import 'package:penugasan1/views/login_view.dart';
import 'package:penugasan1/views/pesan_view.dart';
import 'package:penugasan1/views/register_user_view.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => RegisterUserView(),
        '/login': (context) => LoginView(),
        '/dashboard': (context) => DashboardView(),
        '/kasir': (context) => KasirView(),
        '/pesan': (context) => PesanView(),
      },
    ),
  );
}
