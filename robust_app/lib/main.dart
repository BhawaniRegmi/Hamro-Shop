import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:robust_app/Password.dart/forgetPassword.dart';
import 'package:robust_app/Screens/homeScreen.dart';
import 'package:robust_app/Screens/signUp.dart';

import 'Blocs/CartBlocs/cartBloc.dart';
import 'Filter/filter.dart';

void main() {
  // runApp(const MyApp());
    runApp(
    BlocProvider(
      create: (_) => CartBloc(),
      child: MyApp(),
    ),
  );

 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Robust',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignInScreen(),
      
    );
  }
}

// class SignInScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Column(
//            // mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Logo
//               Column(
//                 children: [
//                   SizedBox(
//                     height: 50,
//                   ),
//                   Center(
//                     child: Image.asset(
//                       'assets/logo.png', // Replace with your logo asset path
//                       height: 80,
//                     ),
//                   ),
//                   const SizedBox(height: 3),
//                 ],
//               ),
      
//               // Welcome Text
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text(
//                     'Hello',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     'Welcome back',
//                     style: TextStyle(fontSize: 16, color: Colors.black54),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
      
//               // Mobile Number Input
//               TextField(
//                 keyboardType: TextInputType.phone,
//                 decoration: InputDecoration(
//                   labelText: 'Mobile Number',
//                   prefixIcon: const Icon(Icons.phone),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
      

//               PasswordField(),
//               const SizedBox(height: 5),
      
//               // Forgot Password
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: TextButton(
//                   onPressed: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPasswordScreen(),));
//                   },
//                   child: const Text('Forgot Password ?',style: TextStyle(color:  Color(0xFF1b447d),)),
//                 ),
//               ),
//               const SizedBox(height: 1),
      
//               // Sign In Button
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                                 Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => HomeScreen()),
//         );
//                   },
//                   style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF1b447d),
      
//                     padding: const EdgeInsets.symmetric(vertical: 12),
//                   ),
//                   child: const Text('Sign In'),
//                 ),
//               ),
//               const SizedBox(height: 8),
      
//               // OR CONTINUE WITH
//               Center(
//                 child: const Text(
//                   'OR CONTINUE WITH',
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
//               const SizedBox(height: 6),
      
//               // Social Buttons
//               Center(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                   Column(
//                     children: [
//                       SizedBox(height: 10,),
//                       MaterialButton(onPressed: (){},
//                         child: FaIcon(
//                           FontAwesomeIcons.google,
//                           size: 32.0, // Adjust the size
//                           color: Colors.red, // Adjust the color
//                         ),
//                       ),
//                     ],
//                   ),
//                     const SizedBox(width: 16),
//                     IconButton(
//                       onPressed: () {},
//                       icon: const Icon(Icons.facebook, size: 40,color: Colors.blue),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 1),
              
      
//               // Sign Up
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text("Don't have an account?"),
//                   TextButton(
//                     onPressed: () {
//                        Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => SignUpScreen()),
//         );
//                     },
//                     child: const Text('Sign Up',style: TextStyle(color:  Color(0xFF1b447d),)),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





// class PasswordField extends StatefulWidget {
//   @override
//   _PasswordFieldState createState() => _PasswordFieldState();
// }

// class _PasswordFieldState extends State<PasswordField> {
//   bool _obscureText = true; // State to toggle password visibility

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       obscureText: _obscureText,
//       decoration: InputDecoration(
//         labelText: 'Password',
//         prefixIcon: const Icon(Icons.lock),
//         suffixIcon: IconButton(
//           icon: Icon(
//             _obscureText ? Icons.visibility_off : Icons.visibility,
//           ),
//           onPressed: () {
//             setState(() {
//               _obscureText = !_obscureText; // Toggle visibility state
//             });
//           },
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//       ),
//     );
//   }
// }















class SignInScreen extends StatelessWidget {
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                controller: _mobileController,
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

              const SizedBox(height: 16),

              // Password Input
              ValueListenableBuilder<bool>(
                valueListenable: _obscurePassword,
                builder: (context, obscure, _) {
                  return TextField(
                    controller: _passwordController,
                    obscureText: obscure,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscure ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          _obscurePassword.value = !_obscurePassword.value;
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 5),
  // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgetPasswordScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Color(0xFF1b447d)),
                  ),
                ),
              ),
              const SizedBox(height: 1),

              // Sign In Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final mobile = _mobileController.text.trim();
                    final password = _passwordController.text.trim();

                    if (mobile.isEmpty && password.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Both mobile number and password are required'),
                        ),
                      );
                    } else if (mobile.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Mobile number is required'),
                        ),
                      );
                    } else if (password.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Password is required'),
                        ),
                      );
                    } else if (mobile != '9865731600' || password != 'admin@123') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Invalid mobile number or password'),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1b447d),
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
                        SizedBox(height: 10),
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                          },
                          child: FaIcon(
                            FontAwesomeIcons.google,
                            size: 32.0,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.facebook, size: 40, color: Colors.blue),
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
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Color(0xFF1b447d)),
                    ),
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








