

Muestra el listado del precio de cierre del Bitcoin en las últimas 2 semanas incluyendo el día de hoy.

## Caracteristicas

- Precio del dia actual Bitcoin en tiempo real
- Listado del precio en dólares (USD) cierre del Bitcoin últimas 2 semanas
- Detalle del día seleccionado precio en Dólar (USD), Euro (EUR) y Peso Colombiano (COP)

## Dependencias

- http para hacer peticiones
- dartz para incluir programacion funcional


## Introducción y uso

Utilice el widget DigitalCurrency en cualquier parte del app por debajo de MaterialApp,
este Widget proporciona una pantalla completa 

```dart

import 'package:digital_currency/digital_currency.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget { 
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: DigitalCurrency(),
    );
  }
}


```
