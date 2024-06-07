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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            _buildBannerSlider(), // Memanggil widget untuk slider banner
            SizedBox(height: 16),
            _buildSearchBar(), // Memanggil widget untuk search bar
            SizedBox(height: 16),
            _buildTabs(), // Memanggil widget untuk tab kategori produk
            SizedBox(height: 20),
            _buildTabContent(), // Memanggil widget untuk menampilkan produk
          ],
        ),
      ),
    );
  }

  Widget _buildBannerSlider() {
    return Container(
      height: 200, // Tentukan tinggi slider
      child: PageView.builder(
        itemCount: _bannerImages.length,
        onPageChanged: (index) {
          setState(() {
            _currentBannerIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return Image.asset(
            _bannerImages[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                child: TextField(
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
    );
  }

  Widget _buildTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(_categories.length, (index) {
          return _buildTabItem(_categories[index]['name'], _categories[index]['id']);
        }),
      ),
    );
  }

  Widget _buildTabItem(String title, int id) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = id;
        });
        _fetchProducts(id.toString());
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: _selectedTabIndex == id ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(20.0),
          border: _selectedTabIndex == id ? null : Border.all(color: Colors.grey),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: _selectedTabIndex == id ? Colors.white : Colors.grey,
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
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailProductPage(
                productId: product['id'].toString(),
              ),
            ),
          );
        },
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
'Price: ${product['price'].toStringAsFixed(2)}',
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
backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
shape: WidgetStateProperty.all<RoundedRectangleBorder>(
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
),
);
}
}
