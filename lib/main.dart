import 'package:balta7184/models/item.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  var items = new List<Item>();
  HomePage() {
    items = [];
    items.add(
      Item(title: 'Item 1', done: false, key: '1'),
    );
    items.add(
      Item(title: 'Item 2', done: true, key: '2'),
    );
    items.add(
      Item(title: 'Item 3', done: false, key: '3'),
    );
  }
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var newTaskCtrl = TextEditingController();
  void add() {
    if (newTaskCtrl.text.isEmpty) return;
    var newItem = Item(
      title: newTaskCtrl.text,
      done: false,
      key: (int.parse(widget.items.last.key) + 1).toString(),
    );
    setState(() {
      widget.items.indexOf(newItem);
      widget.items.add(newItem);
      newTaskCtrl.clear();
    });
  }

  void del(int index) {
    setState(() {
      widget.items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: newTaskCtrl,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
          decoration: InputDecoration(
            labelText: "Nova Tarefa",
            labelStyle: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext ctxt, int index) {
          final item = widget.items[index];
          return Dismissible(
            direction: DismissDirection.startToEnd,
            child: CheckboxListTile(
              title: Text(item.title),
              value: item.done,
              onChanged: (value) {
                setState(() {
                  item.done = value;
                });
              },
            ),
            key: Key(item.key),
            background: Container(
              color: Colors.greenAccent.withOpacity(0.2),
            ),
            onDismissed: (direction) {
              del(widget.items.indexOf(item));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: add,
        child: Icon(Icons.add),
        backgroundColor: Colors.greenAccent,
      ),
    );
  }
}
