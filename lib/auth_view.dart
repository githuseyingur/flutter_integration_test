import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isErrorVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'LOG IN',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 30,
              ),
              Visibility(
                  visible: isErrorVisible,
                  child: Container(
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xFFC13D34),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Invalid username or password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.length < 8) {
                    return 'cannot be smaller than 8 characters!';
                  }
                  return null;
                },
                controller: usernameController,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  labelText: 'username',
                  labelStyle:
                      const TextStyle(color: Colors.black45, fontSize: 12),
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black38),
                      borderRadius: BorderRadius.circular(12)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black38),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.blue),
                      borderRadius: BorderRadius.circular(12)),
                  errorStyle: const TextStyle(color: Colors.red, fontSize: 10),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                style: const TextStyle(
                  fontSize: 14,
                ),
                validator: (value) {
                  if (isPassword(value!) == false) {
                    return 'minimum 8 characters, at least one letter and one number.';
                  }
                  return null;
                },
                controller: passwordController,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  labelText: 'password',
                  labelStyle:
                      const TextStyle(color: Colors.black45, fontSize: 12),
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black38),
                      borderRadius: BorderRadius.circular(12)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black38),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.blue),
                      borderRadius: BorderRadius.circular(12)),
                  errorStyle: const TextStyle(color: Colors.red, fontSize: 10),
                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (usernameController.text == 'username' &&
                        passwordController.text == 'pass1234') {
                      setState(() {
                        isErrorVisible = false;
                      });
                      Navigator.pushReplacementNamed(context, '/home');
                    } else {
                      setState(() {
                        isErrorVisible = true;
                      });
                      Future.delayed(const Duration(seconds: 3)).then((value) {
                        setState(() {
                          isErrorVisible = false;
                        });
                      });
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                    )),
                child: const Text(
                  'LOG IN',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

bool isPassword(String password) {
  RegExp regex = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$'); //=> en az 8 karakter en fazla 16 karakter olarak ayarlandı
  return regex.hasMatch(password);
}
