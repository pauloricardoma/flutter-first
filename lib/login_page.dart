
import 'package:flutter/material.dart';
import 'package:my_first_app/app_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  Widget _body() {
    return Column(
      children: [
        SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      'assets/images/logo.png', 
                      color: Colors.white
                    ),
                  ),
                  Container(height: 20),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 12,
                        top: 16,
                        bottom: 16,
                      ),
                      child: Column(
                        children: [
                          TextField(
                            onChanged:((value) {
                              email = value;
                            }),
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 15),
                          TextField(
                            onChanged:((value) {
                              password = value;
                            }),
                            
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            height: 50,
                            // borderRadius: BorderRadius.circular(40),
                            child: AnimatedBuilder(
                              animation: AppController.instance,
                              builder: (context, child) {
                                return ElevatedButton(
                                  style: TextButton.styleFrom(
                                    foregroundColor: AppController.instance.isDarkTheme ? Colors.black87 : Colors.white, 
                                    backgroundColor: AppController.instance.isDarkTheme ? Colors.white70 : Colors.black87,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    shadowColor: AppController.instance.isDarkTheme ? Colors.white : Colors.black,
                                    elevation: 5.0,
                                  ),
                                  onPressed: (() { 
                                    if (email == 'teste@email.com' && password == '123') {
                                      Navigator.of(context).pushNamed('/home');
                                    } else {
                                      print('invalid');
                                    }
                                  }),
                                  child: const SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      'Entrar',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/images/bg.jpg', 
              fit: BoxFit.fill,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          _body(),
        ],
      ),
    );
  }
}
