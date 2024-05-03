import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ServicePage extends StatefulWidget {
  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Future<List<Category>> _categoryFuture;
  late Map<int, Future<List<Product>>> _productFutures;

  @override
  void initState() {
    super.initState();
    _productFutures = {};
    _categoryFuture = fetchCategories();
    _categoryFuture.then((categories) {
      _tabController =
          TabController(length: categories.length, vsync: this);
      setState(() {});
    });
  }

  Future<List<Category>> fetchCategories() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:5000/product-categories'));
    if (response.statusCode == 200) {
      Iterable data = json.decode(response.body);
      return List<Category>.from(
          data.map((model) => Category.fromJson(model)));
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<Product>> fetchProductsByCategory(int categoryId) async {
    final response = await http.get(
        Uri.parse('http://10.0.2.2:5000/products/category/$categoryId'));
    if (response.statusCode == 200) {
      Iterable data = json.decode(response.body);
      return List<Product>.from(
          data.map((model) => Product.fromJson(model)));
    } else {
      throw Exception('Failed to load products for category $categoryId');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Expanded(
              child: Text("Service"),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight + 50),
          child: Column(
            children: [
              _buildSearchInput(),
              FutureBuilder(
                future: _categoryFuture,
                builder: (context, AsyncSnapshot<List<Category>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return snapshot.hasData
                        ? Container(
                            color: Colors.white,
                            padding: EdgeInsets.only(top: 8),
                            child: TabBar(
                              controller: _tabController,
                              indicatorColor: Colors.black,
                              tabs: snapshot.data!
                                  .map((category) => Tab(text: category.name))
                                  .toList(),
                            ),
                          )
                        : Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder(
        future: _categoryFuture,
        builder: (context, AsyncSnapshot<List<Category>> categorySnapshot) {
          if (categorySnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (categorySnapshot.hasError) {
            return Center(child: Text('Error: ${categorySnapshot.error}'));
          } else {
            return TabBarView(
              controller: _tabController,
              children: categorySnapshot.data!.map((category) {
                return _buildProductList(category.id);
              }).toList(),
            );
          }
        },
      ),
    );
  }

  Widget _buildSearchInput() {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
        ),
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _buildProductList(int categoryId) {
    if (!_productFutures.containsKey(categoryId)) {
      _productFutures[categoryId] = fetchProductsByCategory(categoryId);
    }

    return FutureBuilder(
      future: _productFutures[categoryId],
      builder: (context, AsyncSnapshot<List<Product>> productSnapshot) {
        if (productSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (productSnapshot.hasError) {
          return Center(child: Text('Error: ${productSnapshot.error}'));
        } else {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: productSnapshot.data!.length,
            itemBuilder: (context, index) {
              final product = productSnapshot.data![index];
              return _buildProductCard(product);
            },
          );
        }
      },
    );
  }

  Widget _buildProductCard(Product product) {
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
                      product.user.photoUrl, // Gunakan photoUrl dari user
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Text(
                    product.name, // Tampilkan nama produk
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
                    'Price: \$${product.price.toStringAsFixed(2)}', // Tampilkan harga produk
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

class Category {
  final int id;
  final String name;

  Category({required this.id, required this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Product {
  final int id;
  final String name;
  final double price;
  final User user;

  Product({required this.id, required this.name, required this.price, required this.user});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      user: User.fromJson(json['user']),
    );
  }
}

class User {
  final int id;
  final String username;
  final String photoUrl; // Ubah menjadi photoUrl

  User({required this.id, required this.username, required this.photoUrl});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      photoUrl: json['photo_url'], // Sesuaikan dengan struktur JSON
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ServicePage(),
  ));
}
