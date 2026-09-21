import 'package:flutter/material.dart';
import 'package:khalti_checkout_flutter/khalti_checkout_flutter.dart';
import 'package:payment_gateway/utils/khalti_utils.dart';

class EpayScreen extends StatefulWidget {
  const EpayScreen({super.key});

  @override
  State<EpayScreen> createState() => _EpayScreenState();
}

class _EpayScreenState extends State<EpayScreen> {
  Khalti? khalti;
  bool isloading = false;
  Future<void> payWithKhalti() async {
    final pidx = await UtilsKhaltiService.generatePidx();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Khalti Utils Payment")),
      body: ElevatedButton(
        onPressed: () {
          UtilsKhaltiService.generatePidx(100);
        },
        child: Text('Payment Rs 100'),
      ),
    );
  }
}
