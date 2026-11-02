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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("login successfully"),
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
       backgroundColor: const Color.fromARGB(255, 82, 148, 255) , 
      ),
      body: SafeArea(
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
                border: OutlineInputBorder()
              ),
            ),
          ),
          SizedBox(height: 50,),

          Center(
            child: TextField(
              controller: passwordcontroller,
              decoration: InputDecoration(
                labelText: "password",
                border: OutlineInputBorder()
              ),
              obscureText: true,
            ),
          ),
          SizedBox(height: 50,
          width: 50,
          child: ElevatedButton(onPressed: login, child: Text("login"),
          ),
          ),
          

        
        ],
        ),
      ),
    );
  }
   }