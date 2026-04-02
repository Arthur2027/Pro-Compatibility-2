import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pro Compatibility',
      theme: ThemeData(primarySwatch: Colors.green),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final user = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: user,
              decoration: InputDecoration(labelText: "Usuário"),
            ),
            TextField(
              controller: pass,
              decoration: InputDecoration(labelText: "Senha"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Home()),
                );
              },
              child: Text("Entrar"),
            )
          ],
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double score = 0;
  String texto = "";

  void analisar() {
    score = 72;
    texto = "Compatibilidade média. Ajustar pH.";
    setState(() {});
  }

  Color cor() {
    if (score >= 80) return Colors.green;
    if (score >= 50) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pro Compatibility")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: analisar,
              child: Text("ANALISAR"),
            ),
            SizedBox(height: 20),
            Container(
              height: 100,
              width: double.infinity,
              color: cor(),
              child: Center(
                child: Text(
                  "${score.toInt()}%",
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(texto)
          ],
        ),
      ),
    );
  }
}
