import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:penugasan1/services/user.dart';
import 'package:penugasan1/widgets/alert.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  UserService user = UserService();
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  bool showPass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFBF9),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),

              Text(
                "Welcome\nBack",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 38,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF3E2723),
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: 50,
                height: 6,
                decoration: BoxDecoration(
                  color: const Color(0xFF556B2F),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 40),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      style: GoogleFonts.plusJakartaSans(
                        color: const Color(0xFF3E2723),
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        labelText: "Email Address",
                        labelStyle: GoogleFonts.plusJakartaSans(
                          color: const Color(0xFF795548),
                          fontSize: 14,
                        ),
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: Color(0xFF3E2723),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: const Color(0xFF795548).withOpacity(0.2),
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: Color(0xFF556B2F),
                            width: 2,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email harus diisi';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    TextFormField(
                      controller: password,
                      obscureText: showPass,
                      style: GoogleFonts.plusJakartaSans(
                        color: const Color(0xFF3E2723),
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: GoogleFonts.plusJakartaSans(
                          color: const Color(0xFF795548),
                          fontSize: 14,
                        ),
                        prefixIcon: const Icon(
                          Icons.lock_outline_rounded,
                          color: Color(0xFF3E2723),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              showPass = !showPass;
                            });
                          },
                          icon: Icon(
                            showPass
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Color(0xFF3E2723),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: const Color(0xFF795548).withOpacity(0.2),
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: Color(0xFF556B2F),
                            width: 2,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password harus diisi';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 40),

                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: isLoading
                            ? null
                            : () async {
                                if (formKey.currentState!.validate()) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  var data = {
                                    "email": email.text,
                                    "password": password.text,
                                  };
                                  var result = await user.loginUser(data);
                                  setState(() {
                                    isLoading = false;
                                  });
                                  if (result.status == true) {
                                    AlertMessage().showAlert(
                                      context,
                                      result.message,
                                      true,
                                    );
                                    Future.delayed(
                                      const Duration(seconds: 2),
                                      () {
                                        Navigator.pushReplacementNamed(
                                          context,
                                          '/dashboard',
                                        );
                                      },
                                    );
                                  } else {
                                    AlertMessage().showAlert(
                                      context,
                                      result.message,
                                      false,
                                    );
                                  }
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF556B2F),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                "Sign In",
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 25),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: GoogleFonts.plusJakartaSans(
                            color: const Color(0xFF795548),
                            fontSize: 14,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: Text(
                            " Sign up here",
                            style: GoogleFonts.plusJakartaSans(
                              color: const Color(0xFF556B2F),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
