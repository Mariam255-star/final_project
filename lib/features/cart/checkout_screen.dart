import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_color.dart';
import '../../core/utils/text_style.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,

      /// 🟢 AppBar
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.go('/cart'),
        ),
        title: Text(
          'Checkout',
          style: TextStyles.subtitle(color: Colors.black),
        ),
        centerTitle: true,
      ),

      /// 🟢 Body
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _checkoutRow('SHIPPING', 'Add shipping address'),
            _checkoutRow('DELIVERY', 'Free\nStandard | 3-4 days'),
            _checkoutRow('PAYMENT', 'Visa *1234'),
            _checkoutRow('PROMOS', 'Apply promo code'),

            const SizedBox(height: 16),

            _itemsHeader(),

            Expanded(
              child: ListView(
                children: const [
                  _ItemRow(),
                  _ItemRow(),
                ],
              ),
            ),

            _summaryRow('Subtotal (2)', '\$19.98'),
            _summaryRow('Shipping total', 'Free'),
            _summaryRow('Taxes', '\$2.00'),
            _summaryRow('Total', '\$21.98', bold: true),

            const SizedBox(height: 12),

            /// 🟢 Place Order Button (FIXED ✅)
            _greenButton(
              title: 'Place order',
              onTap: () {
                context.go('/address');
              },
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 Top rows
  Widget _checkoutRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyles.caption()),
          Row(
            children: [
              Text(value, style: TextStyles.caption()),
              const SizedBox(width: 6),
              const Icon(Icons.arrow_forward_ios, size: 14),
            ],
          ),
        ],
      ),
    );
  }

  /// 🔹 Items header
  Widget _itemsHeader() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('ITEMS'),
          Text('DESCRIPTION'),
          Text('PRICE'),
        ],
      ),
    );
  }

  /// 🔹 Summary row
  Widget _summaryRow(String title, String value, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(
            value,
            style: TextStyle(
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 Green Button (Clickable)
  Widget _greenButton({
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyles.button(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

/// 🟢 Item Row Widget
class _ItemRow extends StatelessWidget {
  const _ItemRow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Image.asset(
            'assets/medicines/cream_3.jpg',
            height: 45,
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Brand'),
                Text('DISPRIN'),
                Text('Quantity: 01'),
              ],
            ),
          ),
          const Text('\$10.99'),
        ],
      ),
    );
  }
}
