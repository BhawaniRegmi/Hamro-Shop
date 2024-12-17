import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:robust_app/Password.dart/forgetPassword.dart';
import 'package:robust_app/Screens/homeScreen.dart';
import 'package:robust_app/Screens/signUp.dart';

import 'Filter/filter.dart';

void main() {
  runApp(const MyApp());
}
// void main() {
//   runApp(MaterialApp(
//     home: FilterItemsPage(),
//   ));
// }


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: SignInScreen(),
      
    );
  }
}

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo
              Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/logo.png', // Replace with your logo asset path
                      height: 80,
                    ),
                  ),
                  const SizedBox(height: 3),
                ],
              ),
      
              // Welcome Text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Hello',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Welcome back',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
              const SizedBox(height: 16),
      
              // Mobile Number Input
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  prefixIcon: const Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 16),
      
              // Password Input
              // TextField(
              //   obscureText: true,
              //   decoration: InputDecoration(
              //     labelText: 'Password',
              //     prefixIcon: const Icon(Icons.lock),
              //     suffixIcon: const Icon(Icons.visibility_off),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(8.0),
              //     ),
              //   ),
              // ),
              PasswordField(),
              const SizedBox(height: 5),
      
              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPasswordScreen(),));
                  },
                  child: const Text('Forgot Password ?',style: TextStyle(color:  Color(0xFF1b447d),)),
                ),
              ),
              const SizedBox(height: 1),
      
              // Sign In Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                                Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF1b447d),
      
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text('Sign In'),
                ),
              ),
              const SizedBox(height: 8),
      
              // OR CONTINUE WITH
              Center(
                child: const Text(
                  'OR CONTINUE WITH',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 6),
      
              // Social Buttons
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Column(
                    children: [
                      SizedBox(height: 10,),
                      MaterialButton(onPressed: (){},
                        child: FaIcon(
                          FontAwesomeIcons.google,
                          size: 32.0, // Adjust the size
                          color: Colors.red, // Adjust the color
                        ),
                      ),
                    ],
                  ),
                    const SizedBox(width: 16),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.facebook, size: 40,color: Colors.blue),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 1),
              
      
              // Sign Up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                       Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignUpScreen()),
        );
                    },
                    child: const Text('Sign Up',style: TextStyle(color:  Color(0xFF1b447d),)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}





class PasswordField extends StatefulWidget {
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true; // State to toggle password visibility

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText; // Toggle visibility state
            });
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}




















