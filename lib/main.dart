import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Para usar fuentes de Google Fonts

void main() {
  runApp(CalculadoraCientifica());
}

class CalculadoraCientifica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.micro5TextTheme(), // Fuente retro
      ),
      home: PantallaCalculadora(),
    );
  }
}

class PantallaCalculadora extends StatefulWidget {
  @override
  _PantallaCalculadoraState createState() => _PantallaCalculadoraState();
}

class _PantallaCalculadoraState extends State<PantallaCalculadora> {
  String _pantalla = '0';
  String _operacionActual = '';
  double _primerNumero = 0;
  double _segundoNumero = 0;
  bool _esOperacionCientifica = false;

  // Funciones matemáticas (aproximaciones)
  double _seno(double x) {
    x = x * (3.141592653589793 / 180); // Convertir a radianes
    return x - (x * x * x) / 6 + (x * x * x * x * x) / 120;
  }

  double _coseno(double x) {
    x = x * (3.141592653589793 / 180); // Convertir a radianes
    return 1 - (x * x) / 2 + (x * x * x * x) / 24;
  }

  double _tangente(double x) {
    return _seno(x) / _coseno(x);
  }

  double _logaritmo(double x) {
    if (x <= 0) return double.nan;
    double resultado = 0.0;
    double termino = (x - 1) / (x + 1);
    double terminoCuadrado = termino * termino;
    double potencia = termino;
    for (int i = 1; i <= 100; i += 2) {
      resultado += potencia / i;
      potencia *= terminoCuadrado;
    }
    return 2 * resultado;
  }

  double _raizCuadrada(double x) {
    if (x < 0) return double.nan;
    double estimacion = x / 2;
    for (int i = 0; i < 10; i++) {
      estimacion = (estimacion + x / estimacion) / 2;
    }
    return estimacion;
  }

  void _manejarBoton(String textoBoton) {
    setState(() {
      if (textoBoton == 'C') {
        _pantalla = '0';
        _operacionActual = '';
        _primerNumero = 0;
        _segundoNumero = 0;
        _esOperacionCientifica = false;
      } else if (textoBoton == '=') {
        _calcularResultado();
      } else if (textoBoton == 'sin' ||
          textoBoton == 'cos' ||
          textoBoton == 'tan' ||
          textoBoton == 'log' ||
          textoBoton == '√') {
        _esOperacionCientifica = true;
        _operacionActual = textoBoton;
        _primerNumero = double.parse(_pantalla);
        _calcularResultado();
      } else if (textoBoton == '+' ||
          textoBoton == '-' ||
          textoBoton == '*' ||
          textoBoton == '/') {
        _operacionActual = textoBoton;
        _primerNumero = double.parse(_pantalla);
        _pantalla = '0';
      } else {
        _pantalla = _pantalla == '0' ? textoBoton : _pantalla + textoBoton;
      }
    });
  }

  void _calcularResultado() {
    if (_esOperacionCientifica) {
      switch (_operacionActual) {
        case 'sin':
          _pantalla = _seno(_primerNumero).toStringAsFixed(4);
          break;
        case 'cos':
          _pantalla = _coseno(_primerNumero).toStringAsFixed(4);
          break;
        case 'tan':
          _pantalla = _tangente(_primerNumero).toStringAsFixed(4);
          break;
        case 'log':
          _pantalla = _logaritmo(_primerNumero).toStringAsFixed(4);
          break;
        case '√':
          _pantalla = _raizCuadrada(_primerNumero).toStringAsFixed(4);
          break;
      }
      _esOperacionCientifica = false;
    } else {
      _segundoNumero = double.parse(_pantalla);
      switch (_operacionActual) {
        case '+':
          _pantalla = (_primerNumero + _segundoNumero).toStringAsFixed(4);
          break;
        case '-':
          _pantalla = (_primerNumero - _segundoNumero).toStringAsFixed(4);
          break;
        case '*':
          _pantalla = (_primerNumero * _segundoNumero).toStringAsFixed(4);
          break;
        case '/':
          _pantalla =
              (_segundoNumero == 0
                  ? 'Error'
                  : (_primerNumero / _segundoNumero).toStringAsFixed(4));
          break;
      }
    }
    _operacionActual = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // Fondo oscuro
      appBar: AppBar(
        title: Text('Calculadora', style: TextStyle(color: Colors.orange)),
        backgroundColor: Colors.grey[850],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                border: Border.all(color: Colors.orange, width: 4),
              ),
              child: Text(
                _pantalla,
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ),
          ),
          Divider(color: Colors.orange),
          Expanded(
            flex: 2,
            child: Column(
              children: <Widget>[
                _crearFilaBotones(['sin', 'cos', 'tan', 'log']),
                _crearFilaBotones(['7', '8', '9', '/']),
                _crearFilaBotones(['4', '5', '6', '*']),
                _crearFilaBotones(['1', '2', '3', '-']),
                _crearFilaBotones(['C', '0', '=', '+']),
                _crearFilaBotones(['√']),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearFilaBotones(List<String> botones) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:
            botones.map((boton) {
              return Expanded(
                child: Container(
                  margin: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: _obtenerColorBoton(boton),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(2, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => _manejarBoton(boton),
                    child: Text(
                      boton,
                      style: TextStyle(
                        fontSize: 24.0,
                        color: _obtenerColorTexto(boton),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }

  Color _obtenerColorBoton(String texto) {
    if (texto == 'C' || texto == '=' || texto == '√') {
      return Colors.orange;
    } else if (['sin', 'cos', 'tan', 'log'].contains(texto)) {
      return Colors.yellow[700]!;
    } else if (['+', '-', '*', '/'].contains(texto)) {
      return Colors.grey[700]!;
    } else {
      return Colors.grey[600]!;
    }
  }

  Color _obtenerColorTexto(String texto) {
    return _obtenerColorBoton(texto) == Colors.orange
        ? Colors.black
        : Colors.white;
  }
}
