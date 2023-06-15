import 'package:flutter/material.dart';
import 'package:arrow_path/arrow_path.dart';

void main() {
  runApp(const MyApp());
}

class _Wire extends CustomPainter {
  final _MyHomePageState _state;
  _Wire(_MyHomePageState state) 
  :
  _state = state  
  {
    // Do nothing.
  }
  @override
  void paint(Canvas canvas, Size size) {
    if (_state._wireOn==true) {
          /// The arrows usually looks better with rounded caps.
    final Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = 3.0;
      Path path = Path();
      path.moveTo(_state._initX, _state._initY);
      path.relativeLineTo(_state._x-_state._initX, _state._y-_state._initY);
      path = ArrowPath.addTip(path);
      canvas.drawPath(path, paint..color=Colors.black);
      // canvas.drawLine(Offset(_state._initX,_state._initY), Offset(_state._x,_state._y), Paint()..color=Colors.black);
    }
  }

  // Since this Sky painter has no fields, it always paints
  // the same thing and semantics information is the same.
  // Therefore we return false here. If we had fields (set
  // from the constructor) then we would return true if any
  // of them differed from the same fields on the oldDelegate.
  @override
  bool shouldRepaint(_Wire oldDelegate) => true;
  @override
  bool shouldRebuildSemantics(_Wire oldDelegate) => false;
} 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _x = 0;
  double _y = 0;
  double _initX = 0.0;
  double _initY = 0.0;
  bool _wireOn = false;

  void _setPos(double x, double y) {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _x = x;
      _y = y;
    });
  }

  void _setInitPos(double x, double y) {
    _initX = x;
    _initY = y;
  }

  void _setWireOn(bool on) {
    _wireOn = on;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        constraints: BoxConstraints.expand(
        height: Theme.of(context).textTheme.headlineMedium!.fontSize! * 1.1 + 200.0,
        ),
        padding: const EdgeInsets.all(8.0),
        color: Colors.blue[600],
        alignment: Alignment.center,
        child:Listener(          
          onPointerDown:(PointerDownEvent event) {
            _setInitPos(event.localPosition.dx, event.localPosition.dy);
            _setPos(event.localPosition.dx,event.localPosition.dy);
            _setWireOn(true);
          },
          onPointerMove: (PointerMoveEvent event) {
            _setPos(event.localPosition.dx, event.localPosition.dy);
          },
          onPointerUp:(PointerUpEvent event) {
            _setWireOn(false);
          },
          child:CustomPaint(
            foregroundPainter: _Wire(this),
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
              // Column is also a layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
              //
              // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
              // action in the IDE, or press "p" in the console), to see the
              // wireframe for each widget.
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Text(
                  'title',
                ),
            FloatingActionButton(
            onPressed: ()
            {
              //RenderObject obj = this.context.findRenderObject() as RenderBox;
              //_setPos(obj.paintBounds.center.dx,obj.paintBounds.center.dy);          
            },
            tooltip: 'spawn line',
            child: const Icon(Icons.circle),
          ), // This trailing comma makes auto-formatting nicer for build methods.

                ],
            ),
          ),
        )
      ),
    );
  }
}
