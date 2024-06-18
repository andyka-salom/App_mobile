import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../payment.dart';
import '../../config.dart';

class OrderRecentScreen extends StatefulWidget {
  @override
  _OrderRecentScreenState createState() => _OrderRecentScreenState();
}

class _OrderRecentScreenState extends State<OrderRecentScreen> {
  List<dynamic> orders = [];
  int userId = 0;

  @override
  void initState() {
    super.initState();
    _loadUserId();
  }

  _loadUserId() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final userId = prefs.getInt('id') ?? 0;
      setState(() {
        this.userId = userId;
      });
      fetchOrders();
    } catch (error) {
      print("Error: $error");
    }
  }

  Future<void> fetchOrders() async {
    final response = await http.get(Uri.parse('${Config.baseUrl}/transactions/user/$userId'));

    if (response.statusCode == 200) {
      setState(() {
        orders = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load orders');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recent Orders'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min, // Menyesuaikan ukuran Column dengan kontennya
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (BuildContext context, int index) {
                dynamic order = orders[index];
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 3,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16.0),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage('${Config.profilePhotoUrl}${order['items'][0]['user_photo']}'),
                      ),
                      title: Text(
                        order['items'][0]['product_name'],
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${order['booking_date']}'),
                          Text('${order['status']}'),
                        ],
                      ),
                      trailing: Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              _showOrderDetails(context, order);
                            },
                            child: Text(
                              'Detail',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          if (order['status'] == 'Waiting for Payment')
                            TextButton(
                              onPressed: () {
                                _payOrder(order);
                              },
                              child: Text(
                                'Pay',
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showOrderDetails(BuildContext context, dynamic order) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Order Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Price: \$${order['items'][0]['price']}'),
              SizedBox(height: 8.0),
              Text('Booking Date: ${order['booking_date']}'),
              SizedBox(height: 8.0),
              Text('Start Time: ${order['start_time']}'),
              SizedBox(height: 8.0),
              Text('End Time: ${order['end_time']}'),
              SizedBox(height: 8.0),
              Text('Status: ${order['status']}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _payOrder(dynamic order) {
    final int transactionId = order['transaction_id'];
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentMethodScreen(transactionId: transactionId),
      ),
    );
  }
}
