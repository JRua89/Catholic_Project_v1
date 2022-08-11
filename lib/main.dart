// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: 'Oraciones Catholicas en Español',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          accentColor: Colors.lightBlue[600],
        ),
        home: const HomePage(title: 'Home page'),

    );
  }

}

class HomePage extends StatefulWidget {
  const HomePage({Key? key,  required this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // Animation controller
  late AnimationController _animationController;

  // This is used to animate the icon of the main FAB
  late Animation<double> _buttonAnimatedIcon;

  // This is used for the child FABs
  late Animation<double> _translateButton;

  // This variable determnies whether the child FABs are visible or not
  bool _isExpanded = false;



  @override
  initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600))
      ..addListener(() {
        setState(() {});
      });

    _buttonAnimatedIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _translateButton = Tween<double>(
      begin: 100,
      end: -20,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    super.initState();
  }

  // dispose the animation controller
  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // This function is used to expand/collapse the children floating buttons
  // It will be called when the primary FAB (with menu icon) is pressed
  _toggle() {
    if (_isExpanded) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }

    _isExpanded = !_isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Oraciones Catholicas en Español')),
      body: Center(
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                'Assets/images/6305266170_c81dccb543_m.jpg',
                height: 650,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
                alignment: Alignment.center,
                child: Text(
                  'Para leer las oraciones oprima el menu',
                  style: TextStyle(color: Colors.black,
                      background: Paint()..color = Colors.lightBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                )),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Transform(
            transform: Matrix4.translationValues(
              0.0,
              _translateButton.value * 4,
              0.0,
            ),
            child: FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: _opennewpage,
              child: const Text('3'),
            ),
          ),
          Transform(
            transform: Matrix4.translationValues(
              0,
              _translateButton.value * 3,
              0,
            ),
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {/* Do something */},
              child: const Text('2'),
            ),
          ),
          Transform(
            transform: Matrix4.translationValues(
              0,
              _translateButton.value * 2,
              0,
            ),
            child: FloatingActionButton(
              backgroundColor: Colors.amber,
              onPressed: () {/* Do something */},
              child: const Text('1'),
            ),
          ),
          // This is the primary FAB
          FloatingActionButton(
            onPressed: _toggle,
            child: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _buttonAnimatedIcon,
            ),
          ),
        ],
      ),
    );
  }

  void _opennewpage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Pagina 3'),
            ),
            body: SingleChildScrollView(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              new Text('''
              
    Padre Nuestro
              
              ''',
                  maxLines: 20, style: TextStyle(fontSize: 20.0 ,fontWeight:FontWeight.bold,color: Colors.black)),
                  Image.asset('Assets/images/cathopic_148454590852713.jpg',
                    height: 200,
                    width: 400,
                    fit: BoxFit.fitWidth,
                  ),
                  new Text('''
                  
Padre nuestro, 
que estás en el cielo, 
santificado sea tu Nombre;
venga a nosotros tu reino; 
hágase tu voluntad
en la tierra como en el cielo. 
Danos hoy nuestro pan de cada día;
perdona nuestras ofensas,
como también nosotros
perdonamos a los que nos ofenden;
no nos dejes caer en la tentación, 
y líbranos del mal.
                       
Amén.
                ''',maxLines: 20, style: TextStyle(fontSize: 20.0 ,fontWeight:FontWeight.bold,color: Colors.black,),
                  ),

                  new Text('''
                  
              
    Dios te salve María
              
              ''',maxLines: 50, style: TextStyle(fontSize: 20.0 ,fontWeight:FontWeight.bold,color: Colors.black)),

                  Image.asset('Assets/images/cathopic_1544742283795270.jpg',
                    height: 200,
                    width: 400,
                    fit: BoxFit.fitWidth,),
                  new Text('''
                  
  Dios te salve María
  llena eres de gracia, el Señor es contigo;
  bendita tú eres entre todas las mujeres,
  y bendito es el fruto de tu vientre, Jesús.
                          
  Santa María, Madre de Dios,
  ruega por nosotros,los pecadores,
  ahora y en la ahora de nuestra muerte
                          
  Amén.
                ''',maxLines: 50, style: TextStyle(fontSize: 20.0 ,fontWeight:FontWeight.bold,color: Colors.black) ),

                  new Text('''
                  
              
   Gloria al Padre
              
              ''',
                      maxLines: 50, style: TextStyle(fontSize: 20.0 ,fontWeight:FontWeight.bold,color: Colors.black)),

                  Image.asset('Assets/images/cathopic_148778873340500.jpg',
                    height: 200,
                    width: 400,
                    fit: BoxFit.fitWidth,),
                  ////Image.network('https://i.swncdn.com/media/400w/cms/CCOM/60643-catholic-priest-communion-thinkstockphotos-88.1200w.tn.jpg'),
                  new Text('''
                  
Gloria al Padre,
y al Hijo,
y al Espíritu Santo.
Como era en el principio,
ahora y siempre, por los siglos de los siglos.

Amén
                ''',maxLines: 50, style: TextStyle(fontSize: 20.0 ,fontWeight:FontWeight.bold,color: Colors.black) ),

                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.lightBlue,
                        width: 5,
                      ),
                    ),
                    child: Center(
                        child: Text("Regresa al la primera pagina para leer las otras oraciones", style: TextStyle(fontSize: 20)),

                    ),

                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _mainpageview() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (BuildContext context) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('dsf'),
            ),
            body: SingleChildScrollView(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network('https://i.swncdn.com/media/400w/cms/CCOM/60643-catholic-priest-communion-thinkstockphotos-88.1200w.tn.jpg'),
                  new Text(
                    'Tempor nec feugiat nisl pretium fusce id. At risus viverra adipiscing at in tellus integer feugiat. Id diam maecenas ultricies mi eget. Donec enim diam vulputate ut pharetra sit amet aliquam. Donec adipiscing tristique risus nec feugiat. Condimentum lacinia quis vel eros donec ac odio. Dui ut ornare lectus sit. Metus dictum at tempor commodo ullamcorper a lacus vestibulum sed. Lacus viverra vitae congue eu consequat. Pretium lectus quam id leo in vitae turpis massa sed. Feugiat sed lectus vestibulum mattis ullamcorper velit sed ullamcorper. Pellentesque habitant morbi tristique senectus et netus et. Quam nulla porttitor massa id. Sollicitudin aliquam ultrices sagittis orci a scelerisque purus semper eget.',
                  ),
                  Image.network('https://i.swncdn.com/media/400w/cms/CCOM/60643-catholic-priest-communion-thinkstockphotos-88.1200w.tn.jpg'),
                  new Text(
                    'Tempor nec feugiat nisl pretium fusce id. At risus viverra adipiscing at in tellus integer feugiat. Id diam maecenas ultricies mi eget. Donec enim diam vulputate ut pharetra sit amet aliquam. Donec adipiscing tristique risus nec feugiat. Condimentum lacinia quis vel eros donec ac odio. Dui ut ornare lectus sit. Metus dictum at tempor commodo ullamcorper a lacus vestibulum sed. Lacus viverra vitae congue eu consequat. Pretium lectus quam id leo in vitae turpis massa sed. Feugiat sed lectus vestibulum mattis ullamcorper velit sed ullamcorper. Pellentesque habitant morbi tristique senectus et netus et. Quam nulla porttitor massa id. Sollicitudin aliquam ultrices sagittis orci a scelerisque purus semper eget.',
                  ),
                  Image.network('https://i.swncdn.com/media/400w/cms/CCOM/60643-catholic-priest-communion-thinkstockphotos-88.1200w.tn.jpg'),
                  new Text(
                    'Tempor nec feugiat nisl pretium fusce id. At risus viverra adipiscing at in tellus integer feugiat. Id diam maecenas ultricies mi eget. Donec enim diam vulputate ut pharetra sit amet aliquam. Donec adipiscing tristique risus nec feugiat. Condimentum lacinia quis vel eros donec ac odio. Dui ut ornare lectus sit. Metus dictum at tempor commodo ullamcorper a lacus vestibulum sed. Lacus viverra vitae congue eu consequat. Pretium lectus quam id leo in vitae turpis massa sed. Feugiat sed lectus vestibulum mattis ullamcorper velit sed ullamcorper. Pellentesque habitant morbi tristique senectus et netus et. Quam nulla porttitor massa id. Sollicitudin aliquam ultrices sagittis orci a scelerisque purus semper eget.',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

}