import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page_toshal/home_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:login_page_toshal/register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              opacity: 0.7,
              fit: BoxFit.cover,
              image: AssetImage("assets/plant.jpg")),
        ),
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            AnimatedBuilder(
              animation: _opacityAnimation,
              builder: (context, child) => Opacity(
                opacity: _opacityAnimation.value,
                child: Form(
                  key: _formKey,
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            } else if (RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value) ==
                                false) {
                              return 'Please enter Valid E-mail!!';
                            } else {
                              return null;
                            }
                          },
                          style: GoogleFonts.montserrat(
                              color: Colors.white70,
                              fontSize: 20,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(

                            labelText: "Enter Email",
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        TextFormField(
                          validator:(value) {
                            if (value == null || value.isEmpty ) {
                              return 'Please enter some text';
                            }else if(value.length < 8) {
                              return 'Please Enter Minimum 8 character!!';
                            } else {
                              return null;
                            }
                          } ,
                          keyboardType: TextInputType.text,
                          obscureText: !passwordVisible,
                          style: GoogleFonts.montserrat(
                              color: Colors.white70,
                              fontSize: 20,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            labelText: "Enter Password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.white70,
                              ),
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 40.0),
                        ),
                        Row(
                          children: [
                            SizedBox(width: 100),
                            MaterialButton(
                              height: 50.0,
                              minWidth: 150.0,
                              color: Colors.green.shade900,
                              textColor: Colors.white,
                              child: Text(
                                "Login",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              onPressed: () => {
                                if (_formKey.currentState!.validate())
                                  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomePage(),
                                      ),
                                    ),
                                  }
                              },
                              splashColor: Colors.white30,
                            ),
                            SizedBox(height: 10,),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage())),
                            child: RichText(text: TextSpan(
                              text: "Didn't have Account? ",
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,

                              ),
                              children: [
                                TextSpan(text: "Sign Up",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                    color: Colors.green.shade900,
                                    fontWeight: FontWeight.bold),),
                              ],
                            ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
