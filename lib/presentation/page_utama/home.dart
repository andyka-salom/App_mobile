import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  static const String splashScreen = '/splash_screen';
  static const String signinScreenOneScreen = '/signin_screen_one_screen';
  static const String signupPageOneScreen = '/signup_page_one_screen';
  static const String service_page = '/service_page';
  static const String Profile = '/profil';
  static const String orderRecentScreen = '/order_recent_screen';
  static const String homepage = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String _greeting = '';
  String _userName = '';
  String _userPhotoUrl = '';
  late int _selectedTabIndex = 0; // Represent the index of bottom navigation tab
  late List<dynamic> _categories = [];
  late List<dynamic> _products = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _setGreeting();
    _fetchCategories();
    _getUserData();
  }

  void _setGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      setState(() {
        _greeting = 'Good Morning';
      });
    } else if (hour < 17) {
      setState(() {
        _greeting = 'Good Afternoon';
      });
    } else {
      setState(() {
        _greeting = 'Good Evening';
      });
    }
  }

  Future<void> _fetchCategories() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:5000/product-categories'));
    if (response.statusCode == 200) {
      setState(() {
        _categories = json.decode(response.body);
      });
      // Fetch products for the first category
      _fetchProducts(_categories[0]['id'].toString());
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<void> _fetchProducts(String categoryId) async {
    final response = await http.get(
        Uri.parse('http://10.0.2.2:5000/products/category/$categoryId'));
    if (response.statusCode == 200) {
      setState(() {
        _products = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<void> _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('username') ?? '';
      _userPhotoUrl = prefs.getString('photoUrl') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100], // Changed background color
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _greeting,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Hello, $_userName',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(_userPhotoUrl),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Changed container color
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            // Handle search button tap
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              _buildTabs(),
              SizedBox(height: 20),
              _buildTabContent(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTabIndex,
          onTap: (index) {
            // Only navigate if the selected tab is not already active
            if (index != _selectedTabIndex) {
              setState(() {
                _selectedTabIndex = index;
              });
              _navigateToPage(index);
            }
          },
          backgroundColor: Colors.blue[300], // Changed navigation bar background color
          selectedItemColor: Colors.blue, // Changed selected item color
          unselectedItemColor: Colors.grey[300], // Changed unselected item color
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_offer),
              label: 'Service',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Order History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        // Fetch products for the first category when returning to Home page
        _fetchProducts(_categories[0]['id'].toString());
        break;
      case 1:
        Navigator.pushNamed(context, HomePage.service_page);
        break;
      case 2:
        Navigator.pushNamed(context, HomePage.orderRecentScreen);
        break;
      case 3:
        Navigator.pushNamed(context, HomePage.Profile);
        break;
    }
  }

  Widget _buildTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < _categories.length; i++)
            _buildTabItem(_categories[i]['name'], _categories[i]['id'], i),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, int id, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // Set the selected tab index to the bottom navigation tab index
          _selectedTabIndex = 0;
        });
        _fetchProducts(id.toString());
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        color: _selectedTabIndex == 0 ? Colors.blue : null, // Changed tab item color
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: _selectedTabIndex == 0 ? Colors.white : Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    if (_products.isEmpty) {
      return Center(
        child: Text('Tidak ada produk pada kategori ini'),
      );
    } else {
      return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: _products.length,
        itemBuilder: (context, index) {
          return _buildProductCard(_products[index]);
        },
      );
    }
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    final Map<String, dynamic> user = product['user'];

    return Card(
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
                    child: Image.network(
                      user['photo_url'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Text(
                    product['name'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Price: \$${product['price'].toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 100,
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () {
                          // Action when order button is pressed
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        child: Text(
                          'Order',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
