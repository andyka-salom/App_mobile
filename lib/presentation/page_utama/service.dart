import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../page_utama/detailproduct.dart';

class ServicePage extends StatefulWidget {
  static const String servicePage = '/service_page';
  static const String profile = '/profile';
  static const String orderRecentScreen = '/order_recent_screen';

  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  late int _selectedTabIndex = 0;
  late List<dynamic> _categories = [];
  late List<dynamic> _products = [];
  TextEditingController _searchController = TextEditingController();
  int _currentBannerIndex = 0;

  final List<String> _bannerImages = [
    'assets/images/banner1.jpg',
    'assets/images/banner2.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _fetchCategories();
    _startBannerAnimation();
  }

  void _startBannerAnimation() {
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        _currentBannerIndex = (_currentBannerIndex + 1) % _bannerImages.length;
      });
      _startBannerAnimation();
    });
  }


  Future<void> _fetchCategories() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:5000/product-categories'));
    if (response.statusCode == 200) {
      setState(() {
        _categories = json.decode(response.body);
      });
      _fetchProducts(_categories[0]['id'].toString());
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<void> _fetchProducts(String categoryId) async {
    final response = await http.get(Uri.parse('http://10.0.2.2:5000/products/category/$categoryId'));
    if (response.statusCode == 200) {
      setState(() {
        _products = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load products');
    }
  }

Widget build(BuildContext context) {
  return SafeArea(
    child: Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              alignment: Alignment.topCenter, // Menambahkan alignment ke atas
              child: Image.asset(
                _bannerImages[0], // Menggunakan banner pertama saja
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 1.0, 16.0, 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
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
    ),
  );
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
          _selectedTabIndex = 0;
        });
        _fetchProducts(id.toString());
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: _selectedTabIndex == 0 ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(20.0),
          border: _selectedTabIndex == 0
              ? null
              : Border.all(color: Colors.grey),
        ),
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
        child: Text('No products available in this category'),
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                    child: Image.network(
                      user['photo_url'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      product['name'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailProductPage(
                                productId: product['id'].toString(),
                              ),
                            ),
                          );
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

