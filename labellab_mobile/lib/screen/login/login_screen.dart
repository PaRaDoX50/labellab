import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:labellab_mobile/model/auth_user.dart';
import 'package:labellab_mobile/widgets/label_text_field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _key = GlobalKey();

  AuthUser _user = AuthUser.just();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
      ),
      body: Theme(
        data: Theme.of(context)
            .copyWith(primaryColor: Theme.of(context).accentColor),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16, top: 54),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Sign In",
                style: Theme.of(context).textTheme.headline,
              ),
              Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      height: 16,
                    ),
                    LabelTextField(
                      labelText: "Username",
                      onSaved: (String value) {
                        _user.username = value;
                      },
                      validator: _validateUsername,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    LabelTextField(
                      labelText: "Password",
                      isObscure: true,
                      onSaved: (String value) {
                        _user.password = value;
                      },
                      validator: _validatePassword,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            elevation: 0,
                            color: Theme.of(context).accentColor,
                            colorBrightness: Brightness.dark,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Text("Sign In"),
                            onPressed: _onSubmit,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String _validateUsername(String username) {
    if (username.isEmpty) {
      return "Username can't be empty";
    }
    return null;
  }

  String _validatePassword(String password) {
    if (password.isEmpty) {
      return "Password can't be empty";
    }
    return null;
  }

  void _onSubmit() {
    if (_key.currentState.validate()) {
      _key.currentState.save();

      // TODO - Integrate repository login logic
    }
  }
}