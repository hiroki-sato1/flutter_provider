import 'package:flutter/material.dart';
import 'package:flutter_provider/store/counter_store.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => CounterStore(),
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            CountText()
          ],
        ),
      ),
      floatingActionButton: IncrementButton(),
    );
  }
}

class CountText extends StatelessWidget {
  const CountText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterStore _counterStore = Provider.of<CounterStore>(context);
    int counter = _counterStore.counter;
    return Text(
      '$counter',
      style: Theme.of(context).textTheme.display1,
    );
  }
}

class IncrementButton extends StatelessWidget {
  const IncrementButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterStore _counterStore =
        Provider.of<CounterStore>(context, listen: false);

    return FloatingActionButton(
      onPressed: _counterStore.incrementCounter,
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
  }
}
