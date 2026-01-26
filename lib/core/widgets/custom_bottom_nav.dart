import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_color.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColor.primaryColor,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        switch (index) {
          case 0:
            context.go('/home');
            break;
          case 1:
            // Discover (لسه فاضية أو Categories)
            break;
          case 2:
            context.go('/cart'); // 🛒 Cart Items
            break;
          case 3:
            // Notifications
            break;
          case 4:
            context.go('/profile');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/Home_Fill.png'),
            color: Colors.white,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/Discover.png'),
            color: Colors.white,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/Cart.png'),
            color: Colors.white,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/Bell.png'),
            color: Colors.white,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/Person.png'),
            color: Colors.white,
          ),
          label: '',
        ),
      ],
    );
  }
}
