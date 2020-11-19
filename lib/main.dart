import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
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
  static const _itemCount = 10;
  int filas = 1;
  int columnas = 1;

  PageController _filasController;
  PageController _columnasController;

  void initState(){
    super.initState();
    _filasController = PageController();
    _columnasController = PageController();
  
    _filasController.addListener(() => _establecerFC());
    _columnasController.addListener(() => _establecerFC());
  }

  _establecerFC(){
    setState(() {
      filas = _filasController.page.floor() + 1;
      columnas = _columnasController.page.floor() + 1;
      
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
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 60,
              child: PageView.builder(
                controller: _filasController,
                itemBuilder: (context, page){
                  return Center(child: Text("${page+1}"));
                },
                itemCount: _itemCount,
              ),
            ),
            Divider(),
            SizedBox(
              height: 60,
              child: PageView.builder(
                controller: _columnasController,
                itemBuilder: (context, page){
                  return Center(child: Text("${page+1}"));
                },
                itemCount: _itemCount,
              ),
            ),
            Divider(),
            for(var f=0; f<filas; f++)
                Expanded(
                  flex: 1,
                  child: Row(children: [
                  for(var c=0; c<columnas; c++)
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color: Colors.cyan.withOpacity(0.5),
                        ),
                      child: Center(child: Text("buenas")),
                      ),     
                    )
                  ],
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
