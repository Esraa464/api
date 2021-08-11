// import 'package:flutter/material.dart';
// import 'package:untitled/const/strings.dart';
//
// import 'package:untitled/widgets/bold_text.dart';
// import 'package:untitled/widgets/default_text_form_field.dart';
// import 'package:untitled/widgets/main_button.dart';
//
// class LoginWithEmail extends StatefulWidget {
//   @override
//   _LoginWithEmailState createState() => _LoginWithEmailState();
// }
//
// class _LoginWithEmailState extends State<LoginWithEmail> {
//   var formKey = GlobalKey<FormState>();
//
//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();
//   bool isLoading = false;
//
//   bool isPassword = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text(txt_sign_in),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Form(
//           key: formKey,
//           child: ListView(
//             children: [
//               boldText(contact_with_email),
//               DefaultTextFormField(
//                   controller: emailController,
//                   hintTxt: email,
//                   type: TextInputType.emailAddress,
//                   validator: (value) {
//                     if (value.isEmpty) return 'Email must not be empty';
//                     else if(!value.contains('@')) return 'missing @!';
//                     else return null;
//
//                   }),
//               DefaultTextFormField(
//                 controller: passwordController,
//                   isPassword: true,
//                   hintTxt: password,
//                   type: TextInputType.visiblePassword,
//                   validator: (value) {
//                     if (value.isEmpty) return 'Password must not be empty';
//                      else if(value.length < 4) return 'Length';
//                     else return null;
//
//                   }),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 19),
//                 child: isLoading
//                     ? Center(
//                         child: CircularProgressIndicator(),
//                       )
//                     : mainButton(
//                         text: txt_sign_in,
//                         press: ()async {
//                           if (formKey.currentState.validate()) {
//                             print(emailController.text);
//                             print(passwordController.text);
//                             setState(() {
//                              isLoading = true;
//                             });
//                           }
//                         }),
//               )
//
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:untitled/screens/home_page/view.dart';
import 'package:untitled/screens/login_screen/controller.dart';
class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}
class _LoginViewState extends State<LoginView> {
  LoginController _loginController = LoginController();
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
            Icon(Icons.phone, size: 100),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              validator: (value) {
                if (value.isEmpty)
                  return 'Empty field!';
                else if (!value.contains('@'))
                  return 'missing @!';
                else
                  return null;
              },
              controller: emailController,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            TextFormField(
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
                      final message = await _loginController.login(
                          emailController.text,
                          passwordController.text

                      );
                      if (message != 'ok')
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(message)));
                      else
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ));
                      setState(() {
                        _isLoading = false;
                      });
                    },
                    child: Text('Login')),
          ],
        ),
      ),
    );
  }
}
