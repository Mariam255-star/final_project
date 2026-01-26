import 'package:final_project/core/constants/app_color.dart';
import 'package:final_project/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:final_project/core/routes/routes.dart';
import 'package:go_router/go_router.dart';

class PharmaScreen extends StatelessWidget {
  const PharmaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,

      body: Column(
        children: [
          /// 🔹 TOP IMAGE (بدل AppBar)
          Stack(
            children: [
              Image.asset(
                'assets/images/navbar.png',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),

              Positioned(
                top: 45,
                left: 16,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back,
                      color: AppColor.whiteColor),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              Positioned(
                top: 50,
                left: 70,
                child: Text(
                  'Pharma',
                  style: TextStyles.titleMedium(
                    color: AppColor.whiteColor,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// 🔍 Search
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search pharmacy',
                hintStyle: TextStyles.caption(color: Colors.grey),
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          /// 🏥 Pharmacies Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                itemCount: 9,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColor.secondaryColor,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(14),
                    child: Image.asset(
                      'assets/images/Elazapy.png',
                      fit: BoxFit.contain,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
        
      /// 🔹 Bottom Navigation Bar (صور)
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: AppColor.primaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
        onTap: () {
          context.go('/home');
        },  
        child: _navItem('assets/images/Home_Fill.png'),
      ),
            _navItem('assets/images/Discover.png'),
            _navItem('assets/images/Cart.png'),
            _navItem('assets/images/Bell.png'),
            // _navItem('assets/images/Person.png'),
             GestureDetector(
        onTap: () {
          context.go('/profile');
        },
        child: _navItem('assets/images/Person.png'),
      ),
          ],
        ),
      ),
    );
  }

  Widget _navItem(String imagePath) {
    return Image.asset(
      imagePath,
      width: 26,
      height: 26,
    );
  }
}
