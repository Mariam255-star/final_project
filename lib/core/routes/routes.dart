import 'package:final_project/features/auth/forgetpassword_screen.dart';
import 'package:final_project/features/auth/login_screen.dart';
import 'package:final_project/features/auth/register_screen.dart';
import 'package:final_project/features/home/categories/hair_care_screen.dart';
import 'package:final_project/features/home/categories/pharma_screen.dart';
import 'package:final_project/features/home/categories/skin_care_screen.dart';
import 'package:final_project/features/home/home_screen.dart';
import 'package:final_project/features/home/prescription/scan_prescription_screen.dart';
import 'package:final_project/features/profile/edit_profile_page.dart';
import 'package:final_project/features/profile/my_profile_page.dart';
import 'package:final_project/features/profile/profile_page.dart';
import 'package:final_project/features/welcome/welcome_screen.dart';
import 'package:final_project/features/splash/splashscreen.dart';

import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    /// 🔹 Splash
    GoRoute(path: '/', builder: (context, state) => const Splashscreen()),

    /// 🔹 Welcome
    GoRoute(
      path: '/welcome',
      builder: (context, state) => const WelcomeScreen(),
    ),

    /// 🔹 Login
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),

    /// 🔹 Register
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/forget-password',
      builder: (context, state) => const ForgetPasswordScreen(),
    ),
    GoRoute(path: '/home', builder: (context, state) => const HomePage()),

    GoRoute(
      path: '/our-pharm',
      builder: (context, state) => const PharmaScreen(),
    ),
    GoRoute(
      path: '/hair-care',
      builder: (context, state) => const HairCareScreen(),
    ),
    GoRoute(
      path: '/skin-care',
      builder: (context, state) => const SkinCareScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const MyProfilePage(),
    ),

    // GoRoute(
    //   path: '/my-profile',
    //   builder: (context, state) => const MyProfilePage(),
    // ),
    GoRoute(
      path: '/edit-profile',
      builder: (context, state) => const EditProfilePage(),
    ),
    GoRoute(
      path: '/scan-prescription',
      builder: (context, state) => const ScanPrescriptionScreen(),
    ),
  ],
);
