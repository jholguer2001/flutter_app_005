import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final TextEditingController _controller = TextEditingController();
  String? _messageFromSecondPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Primera pagina')),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Ingrese un texto'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_controller.text.isNotEmpty) {
                  final result = await Navigator.pushNamed(
                    context,
                    '/second',
                    arguments: _controller.text,
                  );
                  if (result != null) {
                    //Actualizar la pantalla
                    setState(() {
                      _messageFromSecondPage = result as String;
                    });
                  }
                }
              },
              child: Text('Ir a la segunda pagina'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
              child: Text('Ir a la tercera pagina'),
            ),

            // ...spread
            //Crear la siguiente UI
            if (_messageFromSecondPage != null) ...[
              SizedBox(height: 25),
              Text(
                'Mensaje regresado',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(_messageFromSecondPage!),
            ],
          ],
        ),
      ),
    );
  }
}
