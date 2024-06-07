import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../presentation/order_history.dart';

class PaymentMethodScreen extends StatefulWidget {
  final int transactionId;

  PaymentMethodScreen({Key? key, required this.transactionId}) : super(key: key);
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  bool _showBankOptions = false;

 Future<void> _updateTransactionStatus() async {
  final response = await http.patch(
    Uri.parse('http://10.0.2.2:5000/transactions/${widget.transactionId}/status'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode({'status': 'In Process'}),
  );

  if (response.statusCode == 200) {
    // Tampilkan notifikasi pembayaran berhasil
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Success'),
          content: Text('Your payment has been successfully processed.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Tunggu 5 detik sebelum berpindah ke halaman OrderRecentScreen
                Future.delayed(Duration(seconds: 5), () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => OrderRecentScreen()),
                  );
                });
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  } else {
    // Handle error
    print('Failed to update transaction status: ${response.statusCode}');
    print('Response body: ${response.body}');
    throw Exception('Failed to update transaction status');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose Payment Method',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          PaymentMethodTile(
            title: 'Credit Card',
            icon: Icons.credit_card,
            onTap: () {
              _showCreditCardForm(context);
            },
          ),
          SizedBox(height: 20),
          PaymentMethodTile(
            title: 'PayPal',
            icon: Icons.payment,
            onTap: () {
              _showPayPalForm(context);
            },
          ),
          SizedBox(height: 20),
          PaymentMethodTile(
            title: 'Bank Transfer',
            icon: Icons.account_balance,
            onTap: () {
              setState(() {
                _showBankOptions = !_showBankOptions;
              });
            },
          ),
          if (_showBankOptions) ...[
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BankOptionTile(
                  title: 'BCA',
                  onTap: () {
                    _updateTransactionStatus();
                    Navigator.pop(context, 'BCA');
                  },
                ),
                SizedBox(height: 10),
                BankOptionTile(
                  title: 'Mandiri',
                  onTap: () {
                    _updateTransactionStatus();
                    Navigator.pop(context, 'Mandiri');
                  },
                ),
                SizedBox(height: 10),
                BankOptionTile(
                  title: 'BRI',
                  onTap: () {
                    _updateTransactionStatus();
                    Navigator.pop(context, 'BRI');
                  },
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  void _showCreditCardForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Credit Card Payment'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildCreditCardTextField('Card Number'),
                SizedBox(height: 10),
                _buildCreditCardTextField('Expiration Date (MM/YY)'),
                SizedBox(height: 10),
                _buildCreditCardTextField('CVV'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                await _updateTransactionStatus();
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              ),
              child: Text(
                'Make Payment',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showPayPalForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('PayPal Payment'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildPayPalTextField('PayPal Email'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                await _updateTransactionStatus();
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              ),
              child: Text(
                'Make Payment',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCreditCardTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildPayPalTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
    );
  }
}

class PaymentMethodTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const PaymentMethodTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.blue,
                size: 30,
              ),
              SizedBox(width: 20),
              Text(
                title,
                style: TextStyle(fontSize: 20),
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}

class BankOptionTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const BankOptionTile({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18),
            ),
            Icon(Icons.arrow_forward_ios, size: 16),
],
),
),
);
}
}
