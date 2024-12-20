import 'package:flutter/material.dart';
import 'package:robust_app/main.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

// class _SignUpScreenState extends State<SignUpScreen> {
//   bool _isChecked = false;
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _mobileController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();

//   String? _validateMobile(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Mobile number is required';
//     }
//     if (!RegExp(r'^(97|98)\d{8}$').hasMatch(value)) {
//       return 'Mobile number must start with 97 or 98 and be 10 digits long';
//     }
//     return null;
//   }

//   String? _validatePassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Password is required';
//     }
//     if (value.length < 6 || value.length > 15) {
//       return 'Password must be 6-15 characters long';
//     }
//     if (!RegExp(r'[a-z]').hasMatch(value)) {
//       return 'Password must contain at least one lowercase letter';
//     }
//     if (!RegExp(r'[A-Z]').hasMatch(value)) {
//       return 'Password must contain at least one uppercase letter';
//     }
//     if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
//       return 'Password must contain at least one special character';
//     }
//     return null;
//   }

//   // void _register() {
//   //   if (_formKey.currentState?.validate() == true) {
//   //     // If all validations pass, show success message and navigate to Sign In screen
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       const SnackBar(content: Text('Registered successfully')),
//   //     );
//   //     Navigator.push(
//   //       context,
//   //       MaterialPageRoute(builder: (context) => SignInScreen()),
//   //     );
//   //   }
//   // }
//   void _register() {
//   if (!_isChecked) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('You must agree to the Terms & Conditions')),
//     );
//     return;
//   }

//   if (_formKey.currentState?.validate() == true) {
//     // If all validations pass, show success message and navigate to Sign In screen
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Registered successfully')),
//     );
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => SignInScreen()),
//     );
//   }
// }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: MediaQuery.of(context).padding.top + 40),
//                 const Center(
//                   child: Text(
//                     'Sign Up',
//                     style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 const SizedBox(height: 15),

//                 // Name Input
//                 const SizedBox(
//                   height: 55,
//                   child: TextField(
//                     decoration: InputDecoration(
//                       labelText: 'Name',
//                       prefixIcon: Icon(Icons.person),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16),

//                 // Mobile Number Input
//                 SizedBox(
//                   height: 55,
//                   child: TextFormField(
//                     controller: _mobileController,
//                     keyboardType: TextInputType.phone,
//                     decoration: const InputDecoration(
//                       labelText: 'Mobile Number',
//                       prefixIcon: Icon(Icons.phone),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                       ),
//                     ),
//                     validator: _validateMobile,
//                   ),
//                 ),
//                 const SizedBox(height: 16),

//                 // Password Input
//                 SizedBox(
//                   height: 55,
//                   child: TextFormField(
//                     controller: _passwordController,
//                     obscureText: true,
//                     decoration: const InputDecoration(
//                       labelText: 'Password',
//                       prefixIcon: Icon(Icons.lock),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                       ),
//                     ),
//                     validator: _validatePassword,
//                   ),
//                 ),
//                 const SizedBox(height: 16),

//                 // Confirm Password Input
//                 SizedBox(
//                   height: 55,
//                   child: TextFormField(
//                     controller: _confirmPasswordController,
//                     obscureText: true,
//                     decoration: const InputDecoration(
//                       labelText: 'Confirm Password',
//                       prefixIcon: Icon(Icons.lock),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value != _passwordController.text) {
//                         return 'Passwords do not match';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 16),

//                 Row(
//                   children: [
//                     Checkbox(
//                       value: _isChecked,
//                       onChanged: (value) {
//                         setState(() {
//                           _isChecked = value ?? false;
//                         });
//                       },
//                     ),
//                     const Expanded(
//                       child: Text.rich(
//                         TextSpan(
//                           text: 'I agree with ',
//                           children: [
//                             TextSpan(
//                               text: 'Terms & Conditions',
//                               style: TextStyle(
//                                 color: Color(0xFF1b447d),
//                                 decoration: TextDecoration.underline,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 12),

//                 // Sign Up Button
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: _register,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xFF1b447d),
//                       padding: const EdgeInsets.symmetric(vertical: 14),
//                     ),
//                     child: const Text('Sign Up'),
//                   ),
//                 ),
//                 const SizedBox(height: 10),

//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text("Already have an account?"),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => SignInScreen()),
//                         );
//                       },
//                       child: const Text(
//                         'Sign in',
//                         style: TextStyle(color: Color(0xFF1b447d)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


class _SignUpScreenState extends State<SignUpScreen> {
  bool _isChecked = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String? _validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mobile number is required';
    }
    if (!RegExp(r'^(97|98)\d{8}$').hasMatch(value)) {
      return 'Mobile number must start with 97 or 98 and be 10 digits long';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6 || value.length > 15) {
      return 'Password must be 6-15 characters long';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  void _register() {
    if (!_isChecked) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You must agree to the Terms & Conditions')),
      );
      return;
    }

    if (_formKey.currentState?.validate() == true) {
      // Save data for future use
      final String name = _nameController.text;
      final String mobileNumber = _mobileController.text;
      final String password = _passwordController.text;

      // Display success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registered successfully')),
      );

      // Navigate to the Sign In screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top + 40),
                const Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 15),

                // Name Input
                SizedBox(
                  height: 55,
                  child: TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
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
                SizedBox(
                  height: 55,
                  child: TextFormField(
                    controller: _mobileController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Mobile Number',
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                    validator: _validateMobile,
                  ),
                ),
                const SizedBox(height: 16),

                // Password Input
                SizedBox(
                  height: 55,
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                    validator: _validatePassword,
                  ),
                ),
                const SizedBox(height: 16),

                // Confirm Password Input
                SizedBox(
                  height: 55,
                  child: TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: !_isConfirmPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                          });
                        },
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                    validator: (value) {
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                ),
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
                    onPressed: _register,
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
      ),
    );
  }
}
