import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool isErrorVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  child: Text(
                    usernameController.text.length < 8
                        ? 'Username cannot be smaller than 8 characters!'
                        : !isPassword(passwordController.text)
                            ? 'Password must contain min 8 chars, at least one letter and one number.'
                            : 'Invalid username or password',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
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
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
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
                ),
                obscureText: true,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (usernameController.text == 'username' &&
                    passwordController.text == 'Pass1234') {
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
    );
  }
}

bool isPassword(String password) {
  RegExp regex = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$'); //=> en az 8 karakter en fazla 16 karakter olarak ayarlandı
  return regex.hasMatch(password);
}
