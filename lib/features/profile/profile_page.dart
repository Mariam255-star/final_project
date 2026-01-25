// import 'package:final_project/core/constants/app_color.dart';
// import 'package:final_project/core/utils/text_style.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   void initState() {
//     super.initState();

//     /// 👇 فتح الـ Drawer بعد ما الصفحة تترسم
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _scaffoldKey.currentState?.openDrawer();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       backgroundColor: AppColor.whiteColor,

//       drawer: Drawer(
//         backgroundColor: AppColor.primaryColor,
//         child: Column(
//           children: [
//             const SizedBox(height: 60),
//             const CircleAvatar(
//               radius: 45,
//               backgroundImage: AssetImage('assets/images/profile.png'),
//             ),
//             const SizedBox(height: 12),
//             Text(
//               'Welcome',
//               style: TextStyles.subtitle(color: AppColor.whiteColor),
//             ),
//             Text(
//               'Fatima Djamila',
//               style: TextStyles.body(color: AppColor.whiteColor),
//             ),
//             const SizedBox(height: 40),

//             _drawerItem(
//               icon: Icons.person,
//               title: 'My Profile',
//               onTap: () => context.push('/my-profile'),
//             ),
//             _drawerItem(icon: Icons.favorite, title: 'Favorites'),
//             _drawerItem(icon: Icons.settings, title: 'Settings'),

//             const Spacer(),

//             _drawerItem(icon: Icons.logout, title: 'Logout', isLogout: true),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),

//       appBar: AppBar(
//         backgroundColor: AppColor.primaryColor,
//         elevation: 0,
//         title: const Text("Profile"),
//       ),

//       body: const SizedBox(),
//     );
//   }

//   Widget _drawerItem({
//     required IconData icon,
//     required String title,
//     VoidCallback? onTap,
//     bool isLogout = false,
//   }) {
//     return ListTile(
//       leading: Icon(icon, color: isLogout ? Colors.red : AppColor.whiteColor),
//       title: Text(
//         title,
//         style: TextStyles.body(
//           color: isLogout ? Colors.red : AppColor.whiteColor,
//         ),
//       ),
//       onTap: onTap,
//     );
//   }
// }
