import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gumsmile_dental_care/const/constant.dart';
import 'package:gumsmile_dental_care/viewmodel/provider/login_provider.dart';
import 'package:gumsmile_dental_care/view/screen/registerscreen.dart';
import 'package:gumsmile_dental_care/view/widgets/navbar_widget.dart';
import 'package:provider/provider.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final LoginProvider _loginProvider = LoginProvider();

  @override
  void dispose() {
    _loginProvider.emailController.dispose();
    _loginProvider.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<LoginProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: prov.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 80.0,
                  horizontal: 15.0,
                ),
                child: Form(
                  key: prov.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 25.0,
                        ),
                        child: Center(
                          child: Image.asset('assets/loginscrenn.jpg'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20.0,
                        ),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: prov.emailController,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                                borderSide: const BorderSide(
                                  width: 2.0,
                                  color: Colors.black,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                                borderSide: const BorderSide(
                                  width: 2.0,
                                  color: Colors.black,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                                borderSide: const BorderSide(
                                  width: 2.0,
                                  color: Colors.black,
                                ),
                              ),
                              prefixIcon: const Icon(
                                Icons.person,
                              ),
                              labelText: 'Email',
                              labelStyle: GoogleFonts.lexendDeca()),
                          validator: (value) => prov.validatorEmail(value),
                          keyboardType: TextInputType.emailAddress,
                          style: GoogleFonts.lexendDeca(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                        ),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: prov.passwordController,
                          obscureText: true,
                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                                borderSide: const BorderSide(
                                  width: 2.0,
                                  color: Colors.black,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                                borderSide: const BorderSide(
                                  width: 2.0,
                                  color: Colors.black,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                                borderSide: const BorderSide(
                                  width: 2.0,
                                  color: Colors.black,
                                ),
                              ),
                              prefixIcon: const Icon(
                                Icons.lock,
                              ),
                              labelText: 'Password',
                              labelStyle: GoogleFonts.lexendDeca()),
                          validator: (value) => prov.validatorPassword(value),
                          keyboardType: TextInputType.visiblePassword,
                          style: GoogleFonts.lexendDeca(),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 30.0,
                        ),
                        width: double.infinity,
                        height: 60.0,
                        child: Consumer<LoginProvider>(
                          builder: (context, regProv, child) {
                            return ElevatedButton(
                              onPressed: () {
                                if (regProv.formKey.currentState!.validate()) {
                                  regProv
                                      .checkLogin(regProv.emailController.text,
                                          regProv.passwordController.text)
                                      .then((value) {
                                    if (value) {
                                      var snackBar = const SnackBar(
                                        content: Text(
                                          'Success to Login',
                                        ),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const NavigationBarWidget(),
                                        ),
                                      );
                                    } else {
                                      var snackBar = const SnackBar(
                                        content: Text(
                                          'Failed to Login',
                                        ),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  });
                                }
                              },
                              child: Text(
                                'Login',
                                style: Constant().textButton,
                              ),
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Dont have any account?',
                            style: GoogleFonts.lexendDeca(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const RegisterScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Register now',
                              style: GoogleFonts.lexendDeca(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                  color: Constant().colorButton),
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
