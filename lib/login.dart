import 'package:flipkart_ui/home.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
   TextEditingController usernamecontroller = TextEditingController();
   TextEditingController passwordcontroller = TextEditingController();

   void login(){ 
    if(usernamecontroller.text.trim() == "thanha" && passwordcontroller.text == "1234" ){
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage()
     ),
     );
        }else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Login Failed"),
            content: const Text(
              "Wrong username or password",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }
  @override
    void dispose(){
      usernamecontroller.dispose();
      passwordcontroller.dispose();
      super.dispose();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: const Color.fromARGB(255, 187, 205, 234) , 
      title:Center(
        child: Image.asset('assets/images/logo.png',
         height: 200,
        ),
      ),
      ),

      body: SafeArea(
        child:Center(
          child:SingleChildScrollView(
            child:Padding(
              padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Text("Login",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.black, 
            ),      
            ),
          ),
          SizedBox(height: 50,),
          Center(
            child: TextField(
              controller: usernamecontroller,
              decoration: InputDecoration(
                labelText: "username",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )
              ),
            ),
          ),
          SizedBox(height: 50,),

          Center(
            child: TextField(
              controller: passwordcontroller,
              decoration: InputDecoration(
                labelText: "password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )
              ),
              obscureText: true,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child:TextButton(onPressed: (){
              print("create new account or forget password clicked");
            }, 
            child: const Text("create new account or forget password"),
            ),
          ),

          SizedBox(height: 50,),

           ElevatedButton(onPressed: login,
            child: Center(
            child: Text("Login",

          style:TextStyle(
            fontSize:20,
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
          ),
          ),
          ),
          ),
        ],
          ),
        ),
          ),
        ),
      ),
    );
  }
   }