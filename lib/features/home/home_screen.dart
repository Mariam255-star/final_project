import 'package:final_project/core/constants/app_color.dart';
import 'package:final_project/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      bottomNavigationBar: _bottomNavBar(context),
      body: Column(
        children: [
          /// 🔹 Header
          Container(
            height: 200,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
            decoration: const BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hello , Mariem",
                      style: TextStyles.titleMedium(
                        color: AppColor.whiteColor,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: AppColor.whiteColor,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/Bell.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                InkWell(
  borderRadius: BorderRadius.circular(30),
  onTap: () {
    context.push('/scan-prescription');
  },
  child: Container(
    height: 50,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: AppColor.whiteColor,
      borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
      children: [
        Expanded(
          child: Text(
            "Upload your Prescription",
            style: TextStyles.body(color: Colors.grey),
          ),
        ),
        Image.asset(
          'assets/images/uploadprecipes.png',
          width: 24,
          height: 24,
        ),
      ],
    ),
  ),
),

              ],
            ),
          ),

          const SizedBox(height: 16),

          /// 🔹 Search
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Search for medicine, pharmacy...",
                      style: TextStyles.body(color: Colors.grey),
                    ),
                  ),
                  const Icon(Icons.search, color: Colors.grey),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          /// 🔹 Top Categories
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Top Categories", style: TextStyles.titleSmall()),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _categoryItem(
                      context,
                      "Our pharm",
                      'assets/images/Our Pharme.png',
                      '/our-pharm',
                    ),
                    _categoryItem(
                      context,
                      "Hair care",
                      'assets/images/Hair Care.png',
                      '/hair-care',
                    ),
                    _categoryItem(
                      context,
                      "Skin Care",
                      'assets/images/Skin Care.png',
                      '/skin-care',
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          /// 🔹 Exclusive Offers
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Exclusive Offers", style: TextStyles.titleSmall()),
                  const SizedBox(height: 12),
                  _offerItem(
                    "Winter Wellness",
                    "30% Off",
                    'assets/medicines/bottles.png',
                  ),
                  const SizedBox(height: 12),
                  _offerItem(
                    "Winter Wellness",
                    "30% Off",
                    'assets/medicines/cream_1.png',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 Category Item
  Widget _categoryItem(
    BuildContext context,
    String title,
    String imagePath,
    String route,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(40),
      onTap: () {
        context.push(route);
      },
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              shape: BoxShape.circle,
            ),
            child: Image.asset(imagePath, width: 32, height: 32),
          ),
          const SizedBox(height: 8),
          Text(title, style: TextStyles.caption()),
        ],
      ),
    );
  }

  /// 🔹 Offer Item
  Widget _offerItem(String title, String discount, String imagePath) {
    return Container(
      height: 90,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColor.primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(imagePath, width: 36, height: 36),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: TextStyles.bodyLarge(color: Colors.black)),
              Text(
                discount,
                style: TextStyles.body(color: AppColor.primaryColor),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "Shop now",
              style: TextStyles.button(color: AppColor.whiteColor),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 Bottom Navigation Bar
  Widget _bottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      backgroundColor: AppColor.primaryColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });

        if (index == 4) {
          context.push('/profile');
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/Home_Fill.png', width: 24),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/Discover.png', width: 24),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/Cart.png', width: 24),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/Bell.png', width: 24),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/Person.png', width: 24),
          label: "",
        ),
      ],
    );
  }
}
