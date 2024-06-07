import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../presentation/payment.dart';
class OrderScreen extends StatelessWidget {
  final String productId;

  OrderScreen({Key? key, required this.productId}) : super(key: key);

  final TextEditingController dateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0),
              _buildCard(
                children: [
                  _buildDatePicker(context),
                ],
              ),
              SizedBox(height: 20.0),
              _buildCard(
                children: [
                  _buildTimePicker(context, "Start time", startTimeController),
                  SizedBox(height: 20.0),
                  _buildTimePicker(context, "End time", endTimeController),
                ],
              ),
              SizedBox(height: 30.0),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // Handle order button pressed
                        _handleOrder(context);
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(vertical: 25.0, horizontal: 120.0), // Sesuaikan dengan preferensi Anda
                      ),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // Ubah sesuai keinginan Anda
                        ),
                      ),
                    ),
                    child: Text('Order', style: TextStyle(color: Colors.white)),
                  ),
                ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({required List<Widget> children}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 3,
      shadowColor: Colors.grey.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return TextButton(
      onPressed: () {
        _selectDate(context);
      },
      child: TextFormField(
        controller: dateController,
        enabled: false,
        decoration: InputDecoration(
          labelText: 'Date',
          suffixIcon: Icon(Icons.calendar_today),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }

  Widget _buildTimePicker(BuildContext context, String timeType, TextEditingController controller) {
    return TextButton(
      onPressed: () {
        _selectTime(context, timeType, controller);
      },
      child: TextFormField(
        controller: controller,
        enabled: false,
        decoration: InputDecoration(
          labelText: timeType,
          suffixIcon: Icon(Icons.access_time),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (picked != null) {
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formattedDate = formatter.format(picked);
      dateController.text = formattedDate;
    }
  }

  Future<void> _selectTime(BuildContext context, String timeType, TextEditingController controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      final hour = picked.hour.toString().padLeft(2, '0');
      final minute = picked.minute.toString().padLeft(2, '0');
      controller.text = '$hour:$minute';
    }
  }

  void _handleOrder(BuildContext context) {
    _sendOrderDetailsToServer(context);
  }

void _sendOrderDetailsToServer(BuildContext context) async {
  // Send order details to server
  final apiUrl = 'http://10.0.2.2:5000/transactions';
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final userId = prefs.getInt('id') ?? 0;

  final DateTime now = DateTime.now();
  final DateFormat dateFormatter = DateFormat('yyyy-MM-dd');
  final DateFormat timeFormatter = DateFormat('HH:mm');

  final String bookingDate = dateFormatter.format(now);
  final String startTime = timeFormatter.format(DateTime.parse('${dateFormatter.format(now)} ${startTimeController.text}'));
  final String endTime = timeFormatter.format(DateTime.parse('${dateFormatter.format(now)} ${endTimeController.text}'));
  final int productIdValue = int.tryParse(productId) ?? 0; // Convert to int, use default value 0 if parsing fails

  final Map<String, dynamic> payload = {
    "user_id": userId,
    "status": "Waiting for Payment",
    "booking_date": bookingDate,
    "start_time": startTime,
    "end_time": endTime,
    "items": [
      {
        "product_id": productIdValue, // Use the converted value
        "quantity": 1, 
      }
    ]
  };

  // Print data payload
  print('Payload: $payload');

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(payload),
  );

  // Handle response
  if (response.statusCode == 201) {
    // Order successful
    // Extract transaction ID from response
    final Map<String, dynamic> responseData = jsonDecode(response.body);
    final int transactionId = responseData['id'];

    // Navigate to another page with transaction ID
    Navigator.push(
      context,
      MaterialPageRoute(
       builder: (context) => PaymentMethodScreen(transactionId: transactionId),
      ),
    );
  } else {
    // Order failed
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to place order')));
  }
}

}
