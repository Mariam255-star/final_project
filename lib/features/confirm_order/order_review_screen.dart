import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_color.dart';
import '../../core/utils/text_style.dart';

class OrderReviewScreen extends StatelessWidget {
  const OrderReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Order review',
          style: TextStyles.subtitle(color: Colors.black),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _stepper(),
            const SizedBox(height: 24),

            _sectionTitle('Shipment options'),
            _shipmentTile('Mon 30 April - Wed 2 May', '\$1.99', true),
            _shipmentTile('Mon 30 April - Fri 4 May', '\$0.99', false),
            _shipmentTile('Standard shipment', '\$2.99', false),

            const SizedBox(height: 16),
            _sectionTitle('Order detail'),
            _orderCard(),

            const SizedBox(height: 16),
            _editableTile(
              'Delivery address',
              '1457 Dorothea Street\n8500 Phoenix, AZ',
            ),
            _editableTile('Billing address', 'same as delivery'),
            _editableTile('Payment method', 'Card •••• 4563'),

            const SizedBox(height: 16),
            _discountCard(),

            const SizedBox(height: 24),
            _totalSection(),

            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => context.push('/confirmation'),
              child: _primaryButton('Next'),
            ),
          ],
        ),
      ),
    );
  }

  // ---------- Widgets ----------

  Widget _stepper() {
    return Row(
      children: [
        _done(),
        _line(),
        _done(),
        _line(),
        _done(),
        _line(),
        _active('4'),
      ],
    );
  }

  Widget _shipmentTile(String title, String price, bool selected) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        selected ? Icons.radio_button_checked : Icons.radio_button_off,
        color: selected ? AppColor.primaryColor : Colors.grey,
      ),
      title: Text(title),
      trailing: Text(price),
    );
  }

  /// 🔥 Order detail with image
  Widget _orderCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: _box(),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/medicines/cream_1.png', // 🖼️ مسار الصورة
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Panadol',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text('Pain relief tablets'),
                SizedBox(height: 6),
                Text(
                  '\$89.99',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _editableTile(String title, String value) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      subtitle: Text(value),
      trailing: const Icon(Icons.edit, size: 18),
    );
  }

  Widget _discountCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: _box(),
      child: Row(
        children: const [
          Icon(Icons.discount_outlined),
          SizedBox(width: 10),
          Text('Discount code'),
        ],
      ),
    );
  }

  Widget _totalSection() {
    return Column(
      children: const [
        _PriceRow('Items value', '\$89.99'),
        _PriceRow('Shipment', '\$1.99'),
        Divider(),
        _PriceRow('Total value', '\$91.98', bold: true),
      ],
    );
  }

  Widget _primaryButton(String text) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          text.toLowerCase(),
          style: TextStyles.button(color: Colors.white),
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text, style: TextStyles.subtitle()),
    );
  }

  BoxDecoration _box() {
    return BoxDecoration(
      border: Border.all(color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(12),
    );
  }

  Widget _done() => const CircleAvatar(
        radius: 14,
        backgroundColor: Colors.green,
        child: Icon(Icons.check, size: 14, color: Colors.white),
      );

  Widget _active(String t) => CircleAvatar(
        radius: 14,
        backgroundColor: AppColor.primaryColor,
        child: Text(
          t,
          style: const TextStyle(color: Colors.white),
        ),
      );

  Widget _line() => Expanded(
        child: Container(height: 1, color: Colors.grey),
      );
}

class _PriceRow extends StatelessWidget {
  final String title;
  final String value;
  final bool bold;

  const _PriceRow(this.title, this.value, {this.bold = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(
            value,
            style: TextStyle(
              fontWeight: bold ? FontWeight.bold : null,
            ),
          ),
        ],
      ),
    );
  }
}
