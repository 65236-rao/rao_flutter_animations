import 'package:flutter/material.dart';

String savedName = '';
String savedAge = '';
String savedSap = '';
String savedEmail = '';
String savedUser = '';
String savedPass = '';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUp(),
    ),
  );
}

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();

  final name = TextEditingController();
  final age = TextEditingController();
  final sap = TextEditingController();
  final email = TextEditingController();
  final user = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool landscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: landscape ? 600 : 350,
            padding: EdgeInsets.all(25),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),

                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 35),

                  TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                    ),
                    validator: (v) =>
                    v!.isEmpty ? 'Name is required' : null,
                    onSaved: (v) => savedName = v!,
                  ),

                  SizedBox(height: 25),

                  TextFormField(
                    controller: age,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Age',
                    ),
                    validator: (v) {
                      if (v!.isEmpty) return 'Age is required';
                      if (int.tryParse(v) == null) {
                        return 'Age must contain numbers only';
                      }
                      return null;
                    },
                    onSaved: (v) => savedAge = v!,
                  ),

                  SizedBox(height: 25),

                  TextFormField(
                    controller: sap,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'SAP ID',
                    ),
                    validator: (v) {
                      if (v!.isEmpty) return 'SAP ID is required';
                      if (int.tryParse(v) == null) {
                        return 'SAP ID must contain numbers only';
                      }
                      return null;
                    },
                    onSaved: (v) => savedSap = v!,
                  ),

                  SizedBox(height: 25),

                  TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (v) {
                      if (v!.isEmpty) return 'Email is required';
                      if (!v.contains('@')) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                    onSaved: (v) => savedEmail = v!,
                  ),

                  SizedBox(height: 25),

                  TextFormField(
                    controller: user,
                    decoration: InputDecoration(
                      labelText: 'Username',
                    ),
                    validator: (v) =>
                    v!.isEmpty ? 'Username is required' : null,
                    onSaved: (v) => savedUser = v!,
                  ),

                  SizedBox(height: 25),

                  TextFormField(
                    controller: pass,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    validator: (v) =>
                    v!.isEmpty ? 'Password is required' : null,
                    onSaved: (v) => savedPass = v!,
                  ),

                  SizedBox(height: 35),

                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => Login(),
                            ),
                          );
                        }
                      },
                      child: Text('Sign Up'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();

  final user = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool landscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: landscape ? 600 : 350,
            padding: EdgeInsets.all(25),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),

                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 35),

                  TextFormField(
                    controller: user,
                    decoration: InputDecoration(
                      labelText: 'Username',
                    ),
                    validator: (v) =>
                    v!.isEmpty ? 'Username is required' : null,
                  ),

                  SizedBox(height: 25),

                  TextFormField(
                    controller: pass,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    validator: (v) =>
                    v!.isEmpty ? 'Password is required' : null,
                  ),

                  SizedBox(height: 35),

                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (user.text == savedUser &&
                              pass.text == savedPass) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => MyProfile(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                Text('Wrong username or password'),
                              ),
                            );
                          }
                        }
                      },
                      child: Text('Login'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyProfile extends StatefulWidget {
  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool showPhone = false;

  @override
  Widget build(BuildContext context) {
    bool landscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),

            Text(
              'Profile',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 35),

            ClipOval(
              child: Image.asset(
                'assets/IMG_20240104_102554.jpg',
                width: landscape ? 130 : 170,
                height: landscape ? 130 : 170,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(height: 30),

            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: landscape ? 80 : 30,
              ),
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.blue.shade700,
              ),
              child: Column(
                children: [
                  Text(
                    'About me',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20),

                  Text(
                    'My name is Abdul Rehman Rao. I am a fifth-semester BSSE student currently studying Mobile Application Development. My hobbies include playing cricket and football.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            Text(
              'Details',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),

            Text(
              'Name:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

            SizedBox(height: 5),

            Text(
              savedName,
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 15),

            Text(
              'Age:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

            SizedBox(height: 5),

            Text(
              savedAge,
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 15),

            Text(
              'SAP ID:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

            SizedBox(height: 5),

            Text(
              savedSap,
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 15),

            Text(
              'Email:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

            SizedBox(height: 5),

            Text(
              savedEmail,
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 15),

            Text(
              'Location:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

            SizedBox(height: 5),

            Text(
              'Islamabad',
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 25),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  showPhone = true;
                });
              },
              child: Text('Show Phone Number'),
            ),

            SizedBox(height: 10),

            if (showPhone)
              Text(
                'Phone: 03199498095',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}