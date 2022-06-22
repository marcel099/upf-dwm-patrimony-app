import 'package:flutter/material.dart';
import 'package:patrimony_app/components/InputForm.dart';
import 'package:patrimony_app/screens/Dashboard.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 50,
            ),
            child: Form(
              key: _formkey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Login Patrimônio', style: TextStyle(fontSize: 22)),
                    const SizedBox(
                      height: 50,
                    ),
                    InputFormApp(
                      controller: emailController,
                      labelText: 'Email',
                      hintText: 'Informe seu email',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value != "admin@patrimonio.com.br") {
                          return '';
                        }
                        return null;
                      },
                      onSaved: (value) => value,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InputFormApp(
                      controller: passwordController,
                      labelText: 'Senha',
                      hintText: 'Informe sua senha',
                      validator: (value) {
                        if (value != "123") {
                          return '';
                        }
                        return null;
                      },
                      onSaved: (value) => value,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          final invalidFormSnackBar = SnackBar(
                            content: const Text(
                                'Dados de acesso inválidos. Verifique!'),
                            action: SnackBarAction(
                              label: 'Fechar',
                              onPressed: () {
                                // Some code to undo the change.
                              },
                            ),
                          );

                          if (_formkey.currentState!.validate()) {
                            _formkey.currentState!.save();

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const DashboardPage()));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(invalidFormSnackBar);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50)),
                        child: Text("ENTRAR", style: TextStyle(fontSize: 22)))
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
