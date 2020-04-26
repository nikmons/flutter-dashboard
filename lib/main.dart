import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:flutter_front/welcome.dart';

import 'package:flutter_front/common/apifunctions/reqLoginAPI.dart';

void main() => runApp(SignUpApp());

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => LoginScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/register': (context) => SignUpScreen(),
      },
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("images/8430.jpg"),
        fit: BoxFit.cover,
      )),
      child: Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: LoginForm(),
          ),
        ),
      ),
    ));
  }
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/8430.jpg"),
            fit: BoxFit.cover,
          )),
          child: Center(
            child: SizedBox(
              width: 400,
              child: Card(
                child: SignUpForm(),
              ),
            ),
          )
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _showWelcomeScreen() {
    Navigator.of(context).pushNamed('/welcome');
  }

  void _showSignUpScreen() {
    Navigator.of(context).pushNamed("/register");
  }

  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Sign In', style: Theme.of(context).textTheme.display1),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _usernameTextController,
              decoration: InputDecoration(hintText: 'Username'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: true,
              controller: _passwordTextController,
              decoration: InputDecoration(hintText: 'Password'),
            ),
          ),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              reqLoginAPI(context, _usernameTextController.text, _passwordTextController.text); },
            child: Text('Login'),
          ),
          FlatButton(
            color: Colors.red,
            textColor: Colors.white,
            onPressed: _showSignUpScreen,
            child: Text("Register"),
          )
        ],
      ),
    );
  }
}

class _SignUpFormState extends State<SignUpForm> {
  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _cpasswordTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  double _formProgress = 0;

  void _updateFormProgress() {
    var progress = 0.0;
    var controllers = [
      _firstNameTextController,
      _lastNameTextController,
      _usernameTextController,
      _passwordTextController,
      _cpasswordTextController
    ];

    for (var controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1 / controllers.length;
      }
    }

    setState(() {
      _formProgress = progress;
    });
  }

  void _showLoginScreen() {
    Navigator.of(context).pushNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: () => _updateFormProgress(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedProgressIndicator(value: _formProgress),
          Text('Sign Up', style: Theme.of(context).textTheme.display1),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _firstNameTextController,
              decoration: InputDecoration(hintText: 'First name'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _lastNameTextController,
              decoration: InputDecoration(hintText: 'Last name'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _usernameTextController,
              decoration: InputDecoration(hintText: 'Username'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: true,
              controller: _passwordTextController,
              decoration: InputDecoration(hintText: 'Password'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
                obscureText: true,
                controller: _cpasswordTextController,
                decoration: InputDecoration(hintText: 'Confirm Password'),
                validator: (val) {
                  if (val.isEmpty) return 'Empty';
                  if (val != _passwordTextController.text) return 'Not match';
                  return null;
                }),
          ),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: _formProgress == 1 ? _showLoginScreen : null,
            child: Text('Sign up'),
          ),
        ],
      ),
    );
  }
}

class AnimatedProgressIndicator extends StatefulWidget {
  final double value;

  AnimatedProgressIndicator({
    @required this.value,
  });

  @override
  State<StatefulWidget> createState() {
    return _AnimatedProgressIndicatorState();
  }
}

class _AnimatedProgressIndicatorState extends State<AnimatedProgressIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> _colorAnimation;
  Animation<double> _curveAnimation;

  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 1200), vsync: this);

    var colorTween = TweenSequence([
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.red, end: Colors.orange),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.orange, end: Colors.yellow),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.yellow, end: Colors.green),
        weight: 1,
      ),
    ]);

    _colorAnimation = _controller.drive(colorTween);
    _curveAnimation = _controller.drive(CurveTween(curve: Curves.easeIn));
  }

  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.animateTo(widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => LinearProgressIndicator(
        value: _curveAnimation.value,
        valueColor: _colorAnimation,
        backgroundColor: _colorAnimation.value.withOpacity(0.4),
      ),
    );
  }
}
