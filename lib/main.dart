import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Formulario'),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Center(
            child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Icon(Icons.app_registration,
                        color: Colors.blue[700], size: 130),
                    Text(
                      "Register",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.blue[700],
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 23),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            autofocus: true,
                            decoration: InputDecoration(
                              labelText: "User",
                              border: OutlineInputBorder(),
                              icon: Icon(Icons.person),
                            ),
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return "This field is required";
                              }
                              if (value!.length < 2) {
                                return "must be at least two characters";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "E-Mail",
                              border: OutlineInputBorder(),
                              icon: Icon(Icons.email),
                            ),
                            validator: (value) {
                              if (RegExp(
                                      r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                  .hasMatch(value!)) {
                                return null;
                              } else {
                                return "You must enter a valid email";
                              }
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "DNI",
                              border: OutlineInputBorder(),
                              icon: Icon(Icons.quick_contacts_mail_rounded),
                            ),
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return "This field is required";
                              }
                              if (value!.length < 6 || value.length > 10) {
                                return "must be between 6 and 10 characters";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 30),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: 80, vertical: 10),
                            child: TextButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(15)),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue[700]),
                              ),
                              onPressed: () {
                                if (_formKey.currentState?.validate() ?? true) {
                                  print("OK");
                                } else {
                                  print("Error");
                                }
                              },
                              child: Text(
                                "Confirm and Send",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
