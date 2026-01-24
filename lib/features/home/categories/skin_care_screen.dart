import 'package:final_project/core/constants/app_color.dart';
import 'package:final_project/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class SkinCareScreen extends StatelessWidget {
  const SkinCareScreen({super.key});

  // ✅ List صور منتجات العناية بالبشرة
  final List<String> productImages = const [
    'assets/medicines/bottle.png',
    'assets/medicines/cream_1.png',
    'assets/medicines/cream_2.jpg',
    'assets/medicines/skincare.png',
    'assets/medicines/download (7).jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,

      /// 🟢 AppBar
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColor.whiteColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Skin Care',
          style: TextStyles.subtitle(color: AppColor.whiteColor),
        ),
      ),

      /// 🟢 Body
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// 🔍 Search
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyles.caption(color: Colors.grey),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.filter_list),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// 📦 Products List
            Expanded(
              child: ListView.builder(
                itemCount: productImages.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        productImages[index],
                        width: 50,
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                      title: Text(
                        'Skin Product',
                        style: TextStyles.bodyLarge(
                          color: AppColor.secondaryColor,
                        ),
                      ),
                      subtitle: Text(
                        '4.6 ⭐ (320 Reviews)',
                        style: TextStyles.caption(color: Colors.grey),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      /// 🟢 Bottom Navigation Bar (نفس اللي في HairCare)
      bottomNavigationBar: Container(
        height: 70,
        color: AppColor.primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem('assets/images/Home_Fill.png'),
            _navItem('assets/images/Discover.png'),
            _navItem('assets/images/Cart.png'),
            _navItem('assets/images/Bell.png'),
            _navItem('assets/images/Person.png'),
          ],
        ),
      ),
    );
  }

  /// 🔻 Bottom Nav Item
  Widget _navItem(String imagePath) {
    return Image.asset(
      imagePath,
      width: 26,
      height: 26,
    );
  }
}
