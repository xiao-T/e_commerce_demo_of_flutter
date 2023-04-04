// login page
import 'package:e_mall_demo/models/login.dart';
import 'package:e_mall_demo/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// hardcode test login account
// only for demo
// need be removed in PROD
final Map<String, String> testAccount = {
  'username': 'test',
  'pwd': 'tset',
};

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Map<String, String> _loginInfo = {
    'username': '',
    'pwd': '',
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _disabled = true;
  bool _showPwd = false;

  void _updatePwdStatus() {
    setState(() {
      _showPwd = !_showPwd;
    });
  }

  void _updateButtonStatus() {
    setState(() {
      _disabled = (_loginInfo['username'] == '' || _loginInfo['pwd'] == '');
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = context.watch<LoginModel>();
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Container(
            padding: EdgeInsets.all(gap['xl']!),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Login',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(
                  height: gap['l']!,
                ),
                TextFormField(
                  autofocus: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username is required';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _loginInfo['username'] = value;
                    });
                    _updateButtonStatus();
                  },
                  decoration: const InputDecoration(
                    hintText: 'Please enter username',
                    icon: Icon(Icons.person),
                    labelText: 'Username',
                  ),
                ),
                TextFormField(
                  obscureText: !_showPwd,
                  enableSuggestions: false,
                  autocorrect: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _loginInfo['pwd'] = value;
                    });
                    _updateButtonStatus();
                  },
                  decoration: InputDecoration(
                    hintText: 'Please enter password',
                    labelText: 'Password',
                    icon: const Icon(Icons.lock),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _updatePwdStatus();
                      },
                      child: _showPwd
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    ),
                  ),
                ),
                SizedBox(
                  height: gap['l']!,
                ),
                SizedBox(
                  width: setResponseSize(175.0),
                  child: ElevatedButton(
                    onPressed: _disabled
                        ? null
                        : () {
                            setState(() {
                              _disabled = true;
                            });
                            if (_formKey.currentState!.validate()) {
                              if (_loginInfo['username'] ==
                                      testAccount['username'] &&
                                  _loginInfo['pwd'] == testAccount['pwd']) {
                                loginProvider.update(true);
                                String? from = GoRouterState.of(context)
                                    .queryParams['from'];
                                context.go(from!);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text('Incorrect username or password.'),
                                  ),
                                );
                              }
                            }
                          },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
