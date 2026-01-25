import 'package:flutter/material.dart';
import 'package:final_project/core/constants/app_color.dart';
import 'package:final_project/core/utils/text_style.dart';
import 'package:go_router/go_router.dart';

class ScanPrescriptionScreen extends StatelessWidget {
  const ScanPrescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Stack(
        children: [
          /// 🖼 Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/scans/background.png',
              fit: BoxFit.cover,
            ),
          ),

          /// 🔲 Dark Overlay
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.35),
            ),
          ),

          /// 🟢 Content
          SafeArea(
            child: Column(
              children: [
                /// 🔙 Back Arrow
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          context.go('/home');
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                /// 📝 Title
                Text(
                  'Scan Your\nPrescription',
                  textAlign: TextAlign.center,
                  style: TextStyles.titleLarge(
                    color: AppColor.whiteColor,
                  ),
                ),

                const SizedBox(height: 32),

                /// 🟩 Scan Frame
                Expanded(
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/scans/scan.png',
                          width: 260,
                        ),

                        /// ✨ Scan Glow Effect
                        Positioned(
                          bottom: 40,
                          child: Container(
                            width: 200,
                            height: 80,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColor.primaryColor.withOpacity(0.0),
                                  AppColor.primaryColor.withOpacity(0.6),
                                  AppColor.primaryColor.withOpacity(0.0),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// 🔄 Analyzing Text
                Text(
                  'AI Analyzing Medication Names...',
                  style: TextStyles.caption(
                    color: AppColor.whiteColor.withOpacity(0.8),
                  ),
                ),

                const SizedBox(height: 20),

                /// ⚪ Capture Button
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColor.whiteColor,
                      width: 4,
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),

      /// 🟢 Bottom Navigation Bar (شغالة)
      bottomNavigationBar: Container(
        height: 70,
        color: AppColor.primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(
              context,
              'assets/images/Home_Fill.png',
              () => context.go('/home'),
            ),
            _navItem(
              context,
              'assets/images/Discover.png',
              () {},
            ),
            _navItem(
              context,
              'assets/images/Cart.png',
              () {},
            ),
            _navItem(
              context,
              'assets/images/Bell.png',
              () {},
            ),
            _navItem(
              context,
              'assets/images/Person.png',
              () => context.go('/profile'),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔻 Bottom Nav Item (Clickable)
  Widget _navItem(
    BuildContext context,
    String imagePath,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        imagePath,
        width: 26,
        height: 26,
      ),
    );
  }
}
