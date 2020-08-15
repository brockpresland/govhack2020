import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String _username = '';
  String _password = '';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          textTheme: Theme.of(context).textTheme,
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          color: Theme.of(context).backgroundColor,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _usernameField(),
                  _passwordField(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _cancelButton(context),
                      _loginButton(context),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );

  Expanded _cancelButton(BuildContext context) => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            color: Theme.of(context).buttonColor,
            onPressed: () {
              debugPrint('Cancel pressed');
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
        ),
      );

  TextFormField _usernameField() => TextFormField(
        initialValue: "",
        decoration: InputDecoration(
          labelText: 'Username',
          hintText: 'Username',
          hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
        ),
        style: Theme.of(context).textTheme.headline6,
        // keyboardType: KeyboardType,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
        validator: (value) {
          return null;
        },
        onChanged: (value) => _username = value,
      );

  Expanded _loginButton(BuildContext context) => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            color: Theme.of(context).buttonColor,
            onPressed: () {
              debugPrint('Login pressed');
              if (_formKey.currentState.validate()) {
                debugPrint('email = "$_username", password = "$_password"');
              }
            },
            child: const Text('Login'),
          ),
        ),
      );

  TextFormField _passwordField() => TextFormField(
        initialValue: "",
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Password',
          hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
        ),
        style: Theme.of(context).textTheme.headline6,
        obscureText: true,
        // keyboardType: KeyboardType,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
        validator: (value) {
          return null;
        },
        onChanged: (value) => _password = value,
      );
}
