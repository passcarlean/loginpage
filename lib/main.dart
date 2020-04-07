import 'package:flutter/material.dart';

void main() => runApp(MyApp());

enum AuthMode { LOGIN, SIGNUP }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Screen',
      home: LoginPage(),
    theme: ThemeData(
    primarySwatch: Colors.lightGreen,
    accentColor: Colors.greenAccent,
    cursorColor: Colors.lightGreen,
    textTheme: TextTheme(
    display2: TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 45.0,
    color: Colors.brown,
    ),
      button: TextStyle(
        fontFamily: 'OpenSans',
      ),
      subhead: TextStyle(fontFamily: 'NotoSans'),
      body1: TextStyle(fontFamily: 'NotoSans'),
    ),
    ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();

}
class _LoginPageState extends State<LoginPage>  {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // calculate the screen height
  double screenHeight;

  //
// Set initial mode to login
  AuthMode _authMode = AuthMode.LOGIN;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            lowerHalf(context),
            upperHalf(context),
            _authMode == AuthMode.LOGIN
                ? loginCard(context)
                : signUpCard(context),
            pageTitle(),
          ],
        ),
      ),
    );
  }

  Widget pageTitle() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[


        ],
      ),
    );
  }

  @override
  Widget loginCard(BuildContext context) {
    return Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: screenHeight / 4),
              padding: EdgeInsets.only(left: 10, right: 10),

              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),

                          child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email ',
                            ),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.all(10),


                          child: TextField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                            ),
                          ),
                        ),

                        FlatButton(
                          onPressed: () {
                            //forgot password screen
                          },
                          textColor: Colors.greenAccent,
                          child: Text('Forgot Password?'),
                        ),

                        Container(
                            height: 50,
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: FlatButton(
                              textColor: Colors.white,
                              color: Colors.deepOrangeAccent,
                              padding: EdgeInsets.only(
                                  left: 38, right: 38, top: 15, bottom: 15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text('Login'),
                              onPressed: () {

                                print(nameController.text);
                                print(passwordController.text);
                              },
                            )),

                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 40,
                              ),

                              Text(
                                "No account?",
                                style: TextStyle(color: Colors.greenAccent),
                              ),
              ]),
                            Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 40,
                              ),




                FlatButton(
                                    child: Text("Sign Up"),
                                    color: Colors.deepOrangeAccent,
                                    textColor: Colors.white,

                                    onPressed: () {
                                      setState(() {
                                        _authMode = AuthMode.SIGNUP;
                                      });
                                    }
                                  ),
                            ]
                        ),
                      ],
                    ),
                  )))
        ],);
    }

  Widget signUpCard(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: screenHeight / 5),
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Username " ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(

                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Your Email"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Password"),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Container(),
                      ),
                      FlatButton(
                        child: Text("Sign Up"),
                        color: Colors.deepOrangeAccent,
                        textColor: Colors.white,
                        padding: EdgeInsets.only(
                            left: 38, right: 38, top: 15, bottom: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
              "Already have an account?",
              style: TextStyle(color: Colors.brown),
            ),



    FlatButton(
    child: Text("Login"),
    color: Colors.deepOrangeAccent,
    textColor: Colors.white,

    onPressed: () {
    setState(() {
    _authMode = AuthMode.LOGIN;
    });
    }
    ),
    ],
    ),
        Align(
          alignment: Alignment.bottomCenter,
          child: FlatButton(
            child: Text(
              "Terms & Conditions",
              style: TextStyle(
                color: Colors.greenAccent,
              ),
            ),
            onPressed: () {},
          ),
        ),
      ],

    );


  }
  Widget upperHalf(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),

//      height: screenHeight / 2,
      child: Image.asset(
        'assets/images/login.png',

        fit: BoxFit.cover,
      ),
    );
  }

  Widget lowerHalf(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: screenHeight / 2,
        color: Color(0xFFECF0F3),
      ),
    );
  }
}