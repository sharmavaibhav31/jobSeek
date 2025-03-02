import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/custom_text_field.dart'; // Import reusable widget

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  void _register() {
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("All fields are required!")));
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Passwords do not match!")));
      return;
    }

    // TODO: Implement backend registration logic
    print("User Registered: $name, $email");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Register", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            CustomTextField(controller: _nameController, hintText: "Full Name", icon: Icons.person),
            SizedBox(height: 10),
            CustomTextField(controller: _emailController, hintText: "Email", icon: Icons.email),
            SizedBox(height: 10),
            _buildPasswordField(_passwordController, "Password", Icons.lock, true),
            SizedBox(height: 10),
            _buildPasswordField(_confirmPasswordController, "Confirm Password", Icons.lock, false),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _register,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: Text("Sign Up", style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialButton(FontAwesomeIcons.google, Colors.red),
                SizedBox(width: 20),
                _buildSocialButton(FontAwesomeIcons.apple, Colors.black),
                SizedBox(width: 20),
                _buildSocialButton(FontAwesomeIcons.facebook, Colors.blue),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField(TextEditingController controller, String hintText, IconData icon, bool isPasswordField) {
    return TextField(
      controller: controller,
      obscureText: isPasswordField ? _obscurePassword : _obscureConfirmPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        suffixIcon: IconButton(
          icon: Icon(isPasswordField ? (_obscurePassword ? Icons.visibility : Icons.visibility_off) : (_obscureConfirmPassword ? Icons.visibility : Icons.visibility_off)),
          onPressed: () {
            setState(() {
              if (isPasswordField) {
                _obscurePassword = !_obscurePassword;
              } else {
                _obscureConfirmPassword = !_obscureConfirmPassword;
              }
            });
          },
        ),
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, Color color) {
    return CircleAvatar(
      backgroundColor: color,
      radius: 25,
      child: Icon(icon, color: Colors.white),
    );
  }
}
