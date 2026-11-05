import 'package:flipkart_ui/cart.dart';
import 'package:flipkart_ui/order.dart';
import 'package:flipkart_ui/profile.dart';
import 'package:flipkart_ui/whishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const new({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final screenWidth =MediaQuery.of(context).size.width;
    final List<Map<String, String>> products = [
      {
        "image":"assets/images/dress.png",
        "name":"Denim Dress",
        "price":"799",
        "rating":"5.2",
      },
         {
        "image":"assets/images/fashion.png",
        "name":"Kurta",
        "price":"899",
        "rating":"3.2",
      },
         {
        "image":"assets/images/lap.png",
        "name":"Laptop",
        "price":"60,000",
        "rating":"5.2",
      },
         {
        "image":"assets/images/headphone.png",
        "name":"Headphone",
        "price":"999",
        "rating":"4.2",
      },
         {
        "image":"assets/images/books.png",
        "name":"HARRY POTTER books",
        "price":"800",
        "rating":"5.2",
      },
         {
        "image":"assets/images/tshirt.png",
        "name":"T-shirt for girls",
        "price":"299",
        "rating":"2.2",
      },
    ];
    final List<Map<String, dynamic>> Caterories =[
      {"icon": Icons.smartphone,"title":"Mobile phone",},
      {"icon": Icons.laptop,"title":"Laptop",},
      {"icon": Icons.watch,"title":"Watch",},
      {"icon": Icons.headphones,"title":"Headphone",},
      {"icon": Icons.chair,"title":"Furniture",},
      {"icon": Icons.book,"title":"Books",},
      
    ];

    return Scaffold(
      key: scaffoldkey,
     appBar: AppBar(
        backgroundColor: Colors.white,   
        title: Image.asset('assets/images/logo.png',
        height: 200,
        ),
        actions: [
          IconButton(
            onPressed: () { 
           },
            icon:  Icon(CupertinoIcons.bell),
          ),
          IconButton(
            onPressed: () { 
              scaffoldkey.currentState!.openDrawer();
           },
    
            icon:  Icon(CupertinoIcons.person),
          
          ),
        ],
     ),
     drawer: Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: CircleAvatar(
              child: Icon(Icons.person,
              size: 80,
              color: const Color.fromARGB(255, 12, 1, 111),
              ),
            ),
            
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("Cart"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=> Cartpage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.receipt_long),
            title: Text("Order"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> orderpage()));
            },
          ),
          ListTile(
            leading: Icon(CupertinoIcons.heart),
            title: Text("Wishlist"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Wishlistpage()));
            },
          )
        ],
      ),
     ),
    body:SafeArea(
      child:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         Padding(
        padding: const EdgeInsets.all(10),
       child:TextField(
      decoration: InputDecoration(
        hintText: 'Search for products, brands and more',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    ),
        ),
       Container(
          height:220,
          width:380,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage('assets/images/offer.png'),
              fit: BoxFit.cover,
            ),
          ),
         ),
         SizedBox(height: 20,),

         Padding(
          padding: 
          EdgeInsets.symmetric(horizontal: 15),
          child: Text("Suggestion For You",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          ),
         
         ),
         SizedBox(height: 20,),
          GridView.builder(
  shrinkWrap: true,
  physics: NeverScrollableScrollPhysics(),
  padding: EdgeInsets.all(10),
  itemCount: products.length,
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
    childAspectRatio: 0.60,
  ),
  itemBuilder: (context, index) {
    final product = products[index];

    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                product['image']!,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 8),
            Text(
              product['name']!,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '₹${product['price']}',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Icon(
                  CupertinoIcons.star_fill,
                  color: Colors.amber,
                  size: 18,
                ),
                SizedBox(width: 5),
                Text(product['rating']!),
         ],
         ),
          ],
          ),
         ),
    );
  }
          ),
          ],
        ),
      ),
    ),
          );
  }
}