// import 'package:flutter/material.dart';
// import 'package:robust_app/main.dart';



// class SignUpScreen extends StatefulWidget {
//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   bool _isChecked=false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
       
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Center(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Title
//               Center(
//                 child: Column(
//                   children: [
//                     SizedBox(height: 40,),
//                     const Text(
//                       'Sign Up',
//                       style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 15),
//               // Center(
//               //   child: const Text(
//               //     'Create an account',
//               //     style: TextStyle(fontSize: 16, color: Colors.black54),
//               //   ),
//               // ),
//               // const SizedBox(height: 12),

//               // Name Input
//               Container(height: 55,
//                 child: const TextField(
//                   decoration: InputDecoration(
//                     labelText: 'Name',
//                     prefixIcon: Icon(Icons.person),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),

//               // Mobile Number Input
//               Container(height: 55,
//                 child: const TextField(
//                   keyboardType: TextInputType.phone,
//                   decoration: InputDecoration(
//                     labelText: 'Mobile Number',
//                     prefixIcon: Icon(Icons.phone),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),

//               // Password Input
//               Container(height:55 ,
//                 child: PasswordField(label: 'Password')),
//               const SizedBox(height: 16),

//               // Confirm Password Input
//               Container(height: 55,
//                 child: PasswordField(label: 'Confirm Password')),
//               const SizedBox(height: 16),

              

//              Row(
//                 children: [
//                   Checkbox(
//                     value: _isChecked,
//                     onChanged: (value) {
//                       setState(() {
//                         _isChecked = value ?? false; // Update the state
//                       });
//                     },
//                   ),
//                   const Expanded(
//                     child: Text.rich(
//                       TextSpan(
//                         text: 'I agree with ',
//                         children: [
//                           TextSpan(
//                             text: 'Terms & Conditions',
//                             style: TextStyle(
//                               color:   Color(0xFF1b447d),
//                               decoration: TextDecoration.underline,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 12),

//               // Sign Up Button
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(backgroundColor:  Color(0xFF1b447d),
//                     padding: const EdgeInsets.symmetric(vertical: 14),
//                   ),
//                   child: const Text('Sign Up'),
//                 ),
//               ),
//               const SizedBox(height: 10),

//               // // OR Divider
//               // Row(
//               //   children: const [
//               //     Expanded(child: Divider(thickness: 1)),
//               //     Padding(
//               //       padding: EdgeInsets.symmetric(horizontal: 8),
//               //       child: Text('OR'),
//               //     ),
//               //     Expanded(child: Divider(thickness: 1)),
//               //   ],
//               // ),
//               // const SizedBox(height: 16),

//               // // Google and Facebook Buttons
//               // Column(
//               //   children: [
//               //     // Google Button
//               //     SizedBox(
//               //       width: double.infinity,
//               //       child: ElevatedButton.icon(
//               //         onPressed: () {},
//               //         icon: const Icon(Icons.g_mobiledata),
//               //         label: const Text('Sign up with Google'),
//               //         style: ElevatedButton.styleFrom(
//               //           backgroundColor: Colors.red,
//               //           foregroundColor: Colors.white,
//               //           padding: const EdgeInsets.symmetric(vertical: 14),
//               //         ),
//               //       ),
//               //     ),
//               //     const SizedBox(height: 8),

//               //     // Facebook Button
//               //     SizedBox(
//               //       width: double.infinity,
//               //       child: ElevatedButton.icon(
//               //         onPressed: () {},
//               //         icon: const Icon(Icons.facebook),
//               //         label: const Text('Sign up with Facebook'),
//               //         style: ElevatedButton.styleFrom(
//               //           backgroundColor: Colors.blue,
//               //           foregroundColor: Colors.white,
//               //           padding: const EdgeInsets.symmetric(vertical: 14),
//               //         ),
//               //       ),
//               //     ),
//               //   ],
//               // ),
             

//               // Already Have an Account
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text("Already have an account?"),
//                   TextButton(
//                     onPressed: () {
//                                   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => SignInScreen()),
//   );
//                     },
//                     child: const Text('Sign in',style: TextStyle(color:  Color(0xFF1b447d),)),
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
//   final String label;

//   const PasswordField({required this.label});

//   @override
//   _PasswordFieldState createState() => _PasswordFieldState();
// }

// class _PasswordFieldState extends State<PasswordField> {
//   bool _obscureText = true;

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       obscureText: _obscureText,
//       decoration: InputDecoration(
//         labelText: widget.label,
//         prefixIcon: const Icon(Icons.lock),
//         suffixIcon: IconButton(
//           icon: Icon(
//             _obscureText ? Icons.visibility_off : Icons.visibility,
//           ),
//           onPressed: () {
//             setState(() {
//               _obscureText = !_obscureText;
//             });
//           },
//         ),
//         border: const OutlineInputBorder(
//           borderRadius: BorderRadius.all(Radius.circular(8.0)),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:robust_app/main.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Added to prevent overflow
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top + 40),
              Center(
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 15),

              // Name Input
              const SizedBox(
                height: 55,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Mobile Number Input
              const SizedBox(
                height: 55,
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Mobile Number',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Password Input
             SizedBox(height: 55, child: PasswordField()),
              const SizedBox(height: 16),

              // Confirm Password Input
               SizedBox(
                  height: 55, child: PasswordField()),
              const SizedBox(height: 16),

              Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value ?? false;
                      });
                    },
                  ),
                  const Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'I agree with ',
                        children: [
                          TextSpan(
                            text: 'Terms & Conditions',
                            style: TextStyle(
                              color: Color(0xFF1b447d),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1b447d),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text('Sign Up'),
                ),
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                      );
                    },
                    child: const Text(
                      'Sign in',
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
