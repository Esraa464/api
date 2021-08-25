import 'package:flutter/material.dart';
import 'package:untitled/screens/login_screen/view.dart';
import 'package:untitled/screens/register/register_controller.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  SignUpController signUpController = SignUpController();
  final formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: InputDecoration(hintText: 'Email'),
              validator: (value) {
                if (value.isEmpty)
                  return 'Empty field!';
                else if (!value.contains('@'))
                  return 'missing @!';
                else
                  return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                if (value.isEmpty)
                  return 'Empty field!';
                else if (value.length < 6)
                  return 'Length';
                else
                  return null;
              },
              controller: passwordController,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            SizedBox(
              height: 30,
            ),
            _isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ElevatedButton(
                    onPressed: () async {
                      if (!formKey.currentState.validate()) return;
                      setState(() {
                        _isLoading = true;
                      });
                      final message = await SignUpController().signUp(
                          emailController.text, passwordController.text);
                      if (message != 'ok') {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(message)));
                      } else {
                        print(emailController.text * 9);
                        print(passwordController.text * 29);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginView(),
                            ));
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    },
                    child: Text('Register')),
          ],
        ),
      ),
    );
  }
}
