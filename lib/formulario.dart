import 'package:flutter/material.dart';
class TelaFormulario extends StatefulWidget {
  @override
  _TelaFormularioState createState() => _TelaFormularioState();
}

class _TelaFormularioState extends State<TelaFormulario> {
  final TextEditingController _controller = TextEditingController();
  List<String> _itens = [];

  void _adicionarItem() {
    String texto = _controller.text;
    if (texto.isNotEmpty) {
      setState(() {
        _itens.add(texto);
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de itens'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Formulário simples com campo de texto
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Insira um item aqui',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            // Botão para adicionar item à lista
            ElevatedButton(
              onPressed: _adicionarItem,
              child: Text('Adicionar'),
            ),
            SizedBox(height: 20),
            // ListView dinâmico
            Expanded(
              child: ListView.builder(
                itemCount: _itens.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_itens[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
