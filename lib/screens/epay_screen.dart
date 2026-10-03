import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:khalti_checkout_flutter/khalti_checkout_flutter.dart';
import 'package:payment_gateway/utils/khalti_utils.dart';

class EpayScreen extends StatefulWidget {
  const EpayScreen({super.key});

  @override
  State<EpayScreen> createState() => _EpayScreenState();
}

class _EpayScreenState extends State<EpayScreen> {
  Khalti? _khalti;
  bool isloading = false;
  Future<void> payWithKhalti(int amount) async {
    final pidx = await UtilsKhaltiService.generatePidx(amount);
    print(pidx);
    // generate pidx
    if (pidx == null) {
      print('pidx is Empty');
    } else {
      final config = KhaltiPayConfig(
        publicKey: '2e1b40bd59824b8d995f0cc63a24c06d',
        pidx: pidx,
        environment: Environment.test,
        paymentUrl:
            'https://test-pay.khalti.com/?pidx=$pidx&return_url=https%3A%2F%2Fdocs.khalti.com%2Fkhalti-epayment&mode=wallet',
      );
      // 3. Initialize Khalti
      _khalti = await Khalti.init(
        enableDebugging: true,
        payConfig: config,

        onPaymentResult: (paymentResult, khalti) {
          log("Payment Result: ${paymentResult.payload}");

          log("Transaction ID: ${paymentResult.payload?.transactionId}");

          if (!mounted) return;

          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Payment Successful!")));

          khalti.close(context);
        },

        onMessage:
            (
              khalti, {
              description,
              statusCode,
              event,
              needsPaymentConfirmation,
            }) async {
              log(
                "Message: $description, "
                "Status Code: $statusCode, "
                "Event: $event",
              );

              if (needsPaymentConfirmation == true) {
                await khalti.verify();
              }

              if (!mounted) return;

              khalti.close(context);
            },

        onReturn: () {
          log("Returned from Khalti Gateway Interface");
        },
      );

      // 4. Open Khalti payment screen
      if (!mounted) return;

      _khalti?.open(context);
    }
  }
  // Configuring khalti

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Khalti Utils Payment")),
      body: ElevatedButton(
        onPressed: () async {
          await payWithKhalti(100);
        },
        child: Text('Payment Rs 100'),
      ),
    );
  }
}
