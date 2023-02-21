import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:todo/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.purple,
          centerTitle: true,
          title: const Text(
            "Login",
          )),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Image.asset(
                "assets/images/login.png",
                fit: BoxFit.contain,
                height: 200,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 70, right: 70, bottom: 20, top: 0),
              child: TextFormField(
                  decoration: const InputDecoration(
                      // icon: Icon(Icons.person),
                      hintText: 'Name',
                      labelText: 'Name *',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple)))),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 70, right: 70, bottom: 20, top: 0),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    // icon: Icon(Icons.person),
                    hintText: 'password',
                    labelText: 'password *',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple))),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(
                    left: 70, right: 70, bottom: 10, top: 0),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () async {
                      // print("Helloooooooo");
                      // var url = "https://realvedic-api.andaal.com/search_bar";
                      // final response = await http.get(Uri.parse(url));
                      // var responseData = json.decode(response.body);
                      // // print(responseData);

                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomePage()));
                      //
                    },
                    child: const Text('Login'),
                  ),
                )),
            Container(
              margin: const EdgeInsets.only(
                  left: 70, right: 70, bottom: 10, top: 0),
              child: const Text(
                "forgot password ?",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(children: [
                const Expanded(
                    child: Divider(
                  thickness: 2,
                )),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: const Text(
                      "OR",
                      style: TextStyle(color: Colors.grey),
                    )),
                const Expanded(
                    child: Divider(
                  thickness: 2,
                )),
              ]),
            ),
            Container(
              height: 100,
              // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 150,
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.save),
                        label: const Text("Google"), //label text
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                        ),
                        child: const Text("Sign Up"),
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
