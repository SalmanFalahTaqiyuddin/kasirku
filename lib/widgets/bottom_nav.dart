import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:penugasan1/models/user_login.dart';

class BottomNav extends StatefulWidget {
  final int activePage;
  BottomNav(this.activePage);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  UserLogin userLogin = UserLogin();
  String? role;

  getDataLogin() async {
    var user = await userLogin.getUserLogin();
    if (user.status != false) {
      if (mounted) {
        setState(() {
          role = user.role;
        });
      }
    } else {
      Navigator.popAndPushNamed(context, '/login');
    }
  }

  @override
  void initState() {
    super.initState();
    getDataLogin();
  }

  void getLink(index) {
    if (role == "admin") {
      if (index == 0) {
        Navigator.pushReplacementNamed(context, '/dashboard');
      } else if (index == 1) {
        Navigator.pushReplacementNamed(context, '/kasir');
      }
    } else if (role == "user") {
      if (index == 0) {
        Navigator.pushReplacementNamed(context, '/dashboard');
      } else if (index == 1) {
        Navigator.pushReplacementNamed(context, '/pesan');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final labelStyle = GoogleFonts.plusJakartaSans(
      fontSize: 12,
      fontWeight: FontWeight.w700,
    );

    if (role == null) return const SizedBox.shrink();

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF556B2F),
        unselectedItemColor: const Color(0xFF795548).withOpacity(0.5),
        currentIndex: widget.activePage,
        onTap: (index) => getLink(index),
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: labelStyle,
        unselectedLabelStyle: labelStyle.copyWith(fontWeight: FontWeight.w500),
        elevation: 0,
        items: role == "admin"
            ? [
                const BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard_rounded),
                  activeIcon: Icon(Icons.dashboard_rounded),
                  label: 'Dashboard',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.inventory_2_outlined),
                  activeIcon: Icon(Icons.inventory_2_rounded),
                  label: 'Catalog',
                ),
              ]
            : [
                const BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home_rounded),
                  label: 'Home',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_outlined),
                  activeIcon: Icon(Icons.shopping_bag_rounded),
                  label: 'Orders',
                ),
              ],
      ),
    );
  }
}
