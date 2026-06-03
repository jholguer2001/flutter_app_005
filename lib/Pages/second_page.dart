import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  //final String messageFromFirstPage;
  //const SecondPage({super.key, required this.messageFromFirstPage});
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late String messageFromFirstPage;
  final TextEditingController _controller = TextEditingController();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments;
    messageFromFirstPage = args != null ? args as String : 'No data';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Segunda pagina')),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Text('Datos enviados desde la primera pagina:'),
            SizedBox(height: 25),
            Text(
              messageFromFirstPage,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 25),
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Ingrese un texto'),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                // mostrar la pagina que esta en la pila de llamadas a las paginas
                Navigator.pop(context, _controller.text);
              },
              child: Text('Regresar a la primera pagina con datos'),
            ),
          ],
        ),
      ),
    );
  }
}
