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
          primarySwatch: Colors.blue,
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
                'Assets/images/nutsisnitin-1574320526796-cathopic.jpg',

                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Container(
                alignment: Alignment.center,
                child: Text(
                  ''
                      ''
                      'Para leer las oraciones oprima el menu',
                  style: TextStyle(color: Colors.white,
                      background: Paint()..color = Colors.lightBlue.shade900,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
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
              onPressed: _pageviewthird,
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
              onPressed: _pageviewsecond,
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
              onPressed: _opennewpage,
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
              title: new Text('Pagina 1'),
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
                ''',maxLines: 20, style: TextStyle(fontSize: 18.0 ,fontWeight:FontWeight.bold,color: Colors.black,),
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
                ''',maxLines: 50, style: TextStyle(fontSize: 18.0 ,fontWeight:FontWeight.bold,color: Colors.black) ),

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
                ''',maxLines: 50, style: TextStyle(fontSize: 18.0 ,fontWeight:FontWeight.bold,color: Colors.black) ),

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
                        child: Text(" Regresa al la primera pagina para leer las otras oraciones", style: TextStyle(fontSize: 18)),

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

  void _pageviewsecond() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (BuildContext context) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Pagina 2'),
            ),
            body: SingleChildScrollView(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  new Text('''
                  
              
   Credo
              
              ''',
                      maxLines: 50, style: TextStyle(fontSize: 20.0 ,fontWeight:FontWeight.bold,color: Colors.black)),


                  Image.asset('Assets/images/cathopic_1521568181227473.jpg'),
                  new Text(
                    '''
                    
  Creo en un solo Señor, Jesucristo,
  Hijo único de Dios, nacido del Padre antes de todos los siglos:
  Dios de Dios, Luz de Luz, Dios verdadero de Dios verdadero,
  engendrado, no creado, de la misma naturaleza del Padre,
  por quien todo fue hecho;
  que por nosotros lo hombres,
  y por nuestra salvación bajó del cielo,
  y por obra del Espíritu Santo se encarnó de María, la Virgen,
  y se hizo hombre;
  y por nuestra causa fue crucificado
  en tiempos de Poncio Pilato;
  padeció y fue sepultado,
  y resucitó al tercer día, según las Escrituras,
  y subió al cielo,
  y está sentado a la derecha del Padre;
  y de nuevo vendrá con gloria
  para juzgar a vivos y muertos,
  y su reino no tendrá fin.

  Creo en el Espíritu Santo,
  Señor y dador de vida,
  que procede del Padre y del Hijo,
  que con el Padre y el Hijo
  recibe una misma adoración y gloria,
  y que habló por los profetas.

  Creo en la Iglesia, que es una, santa, católica y apostólica.
  Confieso que hay un solo bautismo
  para el perdón de los pecados.
  Espero la resurrección de los muertos
  y la vida del mundo futuro.

  Amén.
  
  
                    ''',maxLines: 50, style: TextStyle(fontSize: 18.0 ,fontWeight:FontWeight.bold,color: Colors.black)),

                  new Text('''
                  
              
   Salve
              
              ''',
                      maxLines: 50, style: TextStyle(fontSize: 20.0 ,fontWeight:FontWeight.bold,color: Colors.black)),

                  Image.asset('Assets/images/mario_sdb-1564458703747-cathopic.jpg'),
                  new Text(
                    '''            
                         
  Dios te salve,
  Reina y Madre de misericordia,
  vida, dulzura y esperanza nuestra.
  Dios te salve.
  A Tí clamamos los desterrados hijos de Eva,
  a Tí suspiramos, gimiendo y llorando en este valle de lágrimas.
  Ea, pues, Señora Abogada Nuestra,
  vuelve a nosotros tus ojos misericordiosos,
  y después de este destierro, muéstranos a Jesús,
  fruto bendito de tu vientre.
  Oh, clemente, oh piadosa,
  oh dulce Virgen María.
  Ruega por nosotros, Santa Madre de Dios,
  para que seamos dignos de alcanzar las promesas
  de Nuestro Señor Jesucristo.

  Amén
  
                    ''',maxLines: 50, style: TextStyle(fontSize: 18.0 ,fontWeight:FontWeight.bold,color: Colors.black)),

                  new Text('''
                  
              
   Angel de la Guarda
              
              ''',
                      maxLines: 50, style: TextStyle(fontSize: 20.0 ,fontWeight:FontWeight.bold,color: Colors.black)),

                  Image.asset('Assets/images/tachodimas-1559494568976-cathopic.jpg'),
                  new Text(
                    '''
                    
  Ángel de mi guarda dulce compañía
  no me desampares ni de noche ni de día.
  No me dejes sólo que sin ti me perdería.
  Hasta que me entregues en los brazos
  de Jesus y de Maria

  Amén
                    ''',maxLines: 50, style: TextStyle(fontSize: 18.0 ,fontWeight:FontWeight.bold,color: Colors.black)),

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
                      child: Text(" Regresa al la primera pagina para leer las otras oraciones", style: TextStyle(fontSize: 18)),

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



  void _pageviewthird() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (BuildContext context) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Pagina 2'),
            ),
            body: SingleChildScrollView(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  new Text('''
                  
              
   Yo confieso

              
              ''',
                      maxLines: 50, style: TextStyle(fontSize: 20.0 ,fontWeight:FontWeight.bold,color: Colors.black)),


                  Image.asset('Assets/images/vytas_sdb-1569046036181-cathopic.jpg'),
                  new Text(
                      '''
                    
  Yo confieso ante Dios Todopoderoso,
  y ante ustedes hermanos
  que he pecado mucho de pensamiento,
  palabra, obra y omisión.
  Por mi culpa, por mi culpa, por mi gran culpa.
  Por eso ruego a Santa María siempre Virgen,
  a los ángeles, a los santos y a ustedes hermanos,
  que intercedan por mí ante Dios, Nuestro Señor.

  Amén.
  
  
                    ''',maxLines: 50, style: TextStyle(fontSize: 18.0 ,fontWeight:FontWeight.bold,color: Colors.black)),

                  new Text('''
                  
              
   Acto de Contrición
              
              ''',
                      maxLines: 50, style: TextStyle(fontSize: 20.0 ,fontWeight:FontWeight.bold,color: Colors.black)),

                  Image.asset('Assets/images/acto-de-contrición.jpg'),
                  new Text(
                      '''            
                         
  Señor mío, Jesucristo,
  Dios y hombre verdadero,
  me pesa de todo corazón haberte ofendido;
  propongo firmemente nunca más pecar,
  apartarme de todas las ocasiones de pecado,
  confesarme y cumplir la penitencia.
  Confío que por tu infinita misericordia
  me has de conceder el perdón de mis culpas
  y me has de llevar a la vida eterna.
  Te ofrezco, Señor, mi vida,
  obras y trabajos en satisfacción de todos mis pecados.


  Amén.
  
                    ''',maxLines: 50, style: TextStyle(fontSize: 18.0 ,fontWeight:FontWeight.bold,color: Colors.black)),


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
                      child: Text(" Regresa al la primera pagina para leer las otras oraciones", style: TextStyle(fontSize: 18)),

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


}