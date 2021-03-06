# prueba_tecnica_tekus

Prueba tecnica para tekus por Juan Jaramillo.

[![digital_currency](https://github.com/juanmajh96/prueba_tecnica_tekus/actions/workflows/digital_currency.yaml/badge.svg?branch=digital_currency_v2)](https://github.com/juanmajh96/prueba_tecnica_tekus/actions/workflows/digital_currency.yaml)
[![prueba_tecnica_tekus](https://github.com/juanmajh96/prueba_tecnica_tekus/actions/workflows/main.yaml/badge.svg)](https://github.com/juanmajh96/prueba_tecnica_tekus/actions/workflows/main.yaml)
[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)
[![License: MIT][license_badge]][license_link]



## Corriendo Tests 馃И

Para correr todos los unit y widget test use el siguiente comando

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```
Para ver el reporte generado de cobertura, pueden usar [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

## Demo

 <img src="https://cdn-images-1.medium.com/max/500/1*G9Ti86LxY0uiX-euw8UkVg.gif" width="250">  

## Descarga e instalaci贸n  馃殌

Primero, clone el repositorio con el comando 'clone', o simplemente descargue el zip.

`$ git clone https://github.com/juanmajh96/prueba_tecnica_tekus`

Luego, descargue Android Studio o Visual Studio Code, con sus respectivos [complementos del editor de Flutter](https://flutter.dev/docs/get-started/editor). Para obtener m谩s informaci贸n sobre el procedimiento de instalaci贸n de Flutter, [consulte la guia de consulte la guia de instalaci贸n oficial](https://flutter.dev/).

Instale las dependencias de pubspec.yaml ejecutando flutter packages get desde la ruta principal del proyecto (consulte el [uso de la documentaci贸n de los paquetes](https://flutter.dev/docs/development/packages-and-plugins/using-packages#adding-a-package-dependency-to-an-app) para obtener m谩s detalles y c贸mo hacerlo en el editor).

`$ flutter packages get`

para resolver posibles conflictos ejecute flutter clean y posteriormente flutter pub get

`$ flutter clean` 

`$ flutter pub get`

Ah铆 lo tiene, ahora puede abrir y editar el proyecto.

# Descripcion

Esta app esta basada en packages a pesar de solamente tener un modulo, con el fin de demostrar una modularizacion basada en packages por cada feature del proyecto, el codigo fuente del package se encuentra en la siguiente ruta

    - packages/
       - digital_currency/



[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT