import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trading_app/core/routes/route_names.dart';
import 'package:trading_app/features/payment/presentation/widgets/method_container.dart';
import 'package:trading_app/features/payment/presentation/widgets/succses_diolog.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int selectedMethod = 0;

  final List<Map<String, String>> methods = [
    {'name': 'Humo', 'imagePath': 'assets/images/humo.png'},
    {'name': 'Uzcard', 'imagePath': 'assets/images/uzcard.png'},
    {'name': 'USDT (TRC20)', 'imagePath': 'assets/images/USDT.png'},
    {'name': 'Binance Pay (USDT)', 'imagePath': 'assets/images/Binance 1.png'},
  ];

  final TextEditingController field1 = TextEditingController();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController amount = TextEditingController();

  String getInputLabel() {
    switch (selectedMethod) {
      case 0:
      case 1:
        return "XXXX XXXX XXXX XXXX";
      case 2:
        return "USDT address (TRC20)";
      case 3:
        return "Binance (Pay ID)";
      default:
        return "Ma'lumot";
    }
  }

  Widget buildInput(
    String hint,
    TextEditingController controller,
    IconData icon,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1C1F2A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white70),
          prefixIcon: Icon(icon, color: Colors.white70),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            context.go(AppRoutesNames.payment);
          },
          icon: Icon(Icons.arrow_back_ios, size: 14, color: Colors.white),
        ),
        title: const Text(
          "Pul Chiqarish",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 13),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(methods.length, (index) {
                  final method = methods[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedMethod = index;
                      });
                    },
                    child: MethodContainer(
                      imagePath: method['imagePath']!,
                      name: method['name']!,
                      selected: selectedMethod == index,
                    ),
                  );
                }),
              ),
              const SizedBox(height: 24),
              const Text(
                "Ma'lumotlarni to'ldiring:",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              if (selectedMethod == 0 || selectedMethod == 1) ...[
                buildInput(getInputLabel(), field1, Icons.credit_card),
                const SizedBox(height: 12),
                buildInput("Ism Familiya", fullName, Icons.person),
                const SizedBox(height: 12),
              ] else ...[
                buildInput(getInputLabel(), field1, Icons.credit_card),
                const SizedBox(height: 12),
              ],

              buildInput("Telefon raqam", phone, Icons.phone),
              const SizedBox(height: 12),
              buildInput("Summa", amount, Icons.attach_money),
              const SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Icon(
                    Icons.account_balance_wallet,
                    color: Colors.white70,
                    size: 16,
                  ),
                  SizedBox(width: 4),
                  Text(
                    "Balans: 1250\$",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    showSuccessDialog(context);
                  },
                  icon: const Icon(Icons.send, color: Colors.white),
                  label: const Text(
                    "Chiqrarib olish",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
