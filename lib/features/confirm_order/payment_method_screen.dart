import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_color.dart';
import '../../core/utils/text_style.dart';

enum PaymentType { paypal, card, cash }

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  PaymentType selected = PaymentType.paypal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,

      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Payment method',
          style: TextStyles.subtitle(color: Colors.black),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _stepper(),
            const SizedBox(height: 24),

            _radioTile('Pay Pal', PaymentType.paypal),
            _radioTile('Pay with Card', PaymentType.card),

            if (selected == PaymentType.card) _cardForm(),

            _radioTile('Cash on delivery', PaymentType.cash),

            const SizedBox(height: 20),
            _summary(),

            const Spacer(),

            GestureDetector(
              onTap: () => context.push('/order-review'), // ✅ FIXED
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
        _doneCircle(),
        _line(),
        _doneCircle(),
        _line(),
        _activeCircle('3'),
        _line(),
        _inactiveCircle('4'),
      ],
    );
  }

  Widget _radioTile(String title, PaymentType value) {
    return RadioListTile<PaymentType>(
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      value: value,
      groupValue: selected,
      onChanged: (val) => setState(() => selected = val!),
    );
  }

  Widget _cardForm() {
    return Column(
      children: [
        _textField('John Doe'),
        _textField('1234 4566 5567 4563'),
        Row(
          children: [
            Expanded(child: _textField('MM/YY')),
            const SizedBox(width: 10),
            Expanded(child: _textField('CVV')),
          ],
        ),
        CheckboxListTile(
          value: true,
          onChanged: (_) {},
          title: const Text('Save card details for later'),
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
        ),
      ],
    );
  }

  Widget _summary() {
    return Column(
      children: const [
        _SummaryRow(title: 'Items value', value: '\$89.99'),
        _SummaryRow(title: 'Shipment', value: '\$1.99'),
        Divider(),
        _SummaryRow(title: 'Total value', value: '\$91.98'),
      ],
    );
  }

  Widget _textField(String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _primaryButton(String title) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          title.toLowerCase(),
          style: TextStyles.button(color: Colors.white),
        ),
      ),
    );
  }

  Widget _doneCircle() => const CircleAvatar(
        radius: 14,
        backgroundColor: Colors.green,
        child: Icon(Icons.check, size: 14, color: Colors.white),
      );

  Widget _activeCircle(String text) => CircleAvatar(
        radius: 14,
        backgroundColor: AppColor.primaryColor,
        child: Text(text, style: const TextStyle(color: Colors.white)),
      );

  Widget _inactiveCircle(String text) => CircleAvatar(
        radius: 14,
        backgroundColor: Colors.grey,
        child: Text(text),
      );

  Widget _line() => Expanded(
        child: Container(height: 1, color: Colors.grey),
      );
}

// ---------- Summary Row ----------
class _SummaryRow extends StatelessWidget {
  final String title;
  final String value;

  const _SummaryRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
