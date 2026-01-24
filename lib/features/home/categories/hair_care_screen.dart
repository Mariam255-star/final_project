import 'package:flutter/material.dart';
import 'package:final_project/core/constants/app_color.dart';
import 'package:final_project/core/utils/text_style.dart';

class HairCareScreen extends StatelessWidget {
  const HairCareScreen({super.key});

  // ✅ قائمة مسارات صور المنتجات
  final List<String> productImages = const [
    'assets/medicines/shampoo.png',
    'assets/medicines/hair_mask.png',
    'assets/medicines/balsam.png',
    'assets/medicines/serum.png',
    'assets/medicines/oil.png',
    'assets/medicines/cream.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,

      /// 🟢 BODY
      body: Column(
        children: [
          /// 🟢 Header Image
          Stack(
            children: [
              Image.asset(
                'assets/images/navbar.png',
                width: double.infinity,
                height: 140,
                fit: BoxFit.cover,
              ),
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon:
                            const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Text(
                        'Hair Care',
                        style:
                            TextStyles.subtitle(color: AppColor.whiteColor),
                      ),
                      const Icon(Icons.notifications_none,
                          color: Colors.white),
                    ],
                  ),
                ),
              ),
            ],
          ),

          /// 🟢 CONTENT
          Expanded(
            child: Padding(
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

                  const SizedBox(height: 12),

                  /// 🏷 Filters
                  SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _chip('All', true),
                        _chip('Shampoo', false),
                        _chip('Hair mask', false),
                        _chip('Balsam', false),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// 📦 Products Grid
                  Expanded(
                    child: GridView.builder(
                      itemCount: productImages.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (context, index) {
                        return _productGridItem(productImages[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      /// 🟢 Bottom Navigation Bar
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

  /// 🏷 Chip
  Widget _chip(String text, bool selected) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(
          text,
          style: TextStyles.caption(
            color:
                selected ? AppColor.whiteColor : AppColor.secondaryColor,
          ),
        ),
        selected: selected,
        selectedColor: AppColor.primaryColor,
        backgroundColor: Colors.grey.shade200,
      ),
    );
  }

  /// 📦 Product Grid Item
  Widget _productGridItem(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
          ),
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Hair Product',
            style: TextStyles.bodyLarge(
              color: AppColor.secondaryColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '4.8 ⭐  •  158 left',
            style: TextStyles.caption(color: Colors.grey),
          ),
        ],
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
