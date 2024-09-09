/* Hello World! ***************************************************************/

// void main() {
//   print('Hello world');
// }

/* Comentarios ****************************************************************/

// This is a normal, one-line comment.

/// This is a documentation comment, used to document libraries,
/// classes, and their members. Tools like IDEs and dartdoc treat
/// doc comments specially.

/* 
Comments like these are also supported.
*/

/* Variables ******************************************************************/

// void main() {
//   final aName = 'Bob';
//   final String anotherName = 'Bob';
//   var anotherNameDeclaration = 'Bob';
//   Object yetAnotherName = 'Bob';
//   String yetAnotherWayName = 'Bob';

//   // int
//   var currentYear = 2024;

//   // double
//   var pi = 3.14159265359;

//   // List<String>
//   var planets = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];

//   // Set<String>
//   var colors = {'red', 'green', 'blue', 'Neptune'};

//   // Map<String, dynamic>
//   var image = {
//     'tags': ['saturn'],
//     'url': '//path/to/saturn.jpg'
//   };

//   print('aName: $aName (${aName.runtimeType})');
//   print('anotherName: $anotherName (${anotherName.runtimeType})');
//   print(
//     'anotherNameDeclaration: $anotherNameDeclaration (${anotherNameDeclaration.runtimeType})',
//   );
//   print('yetAnotherName: $yetAnotherName (${yetAnotherName.runtimeType})');
//   print(
//     'yetAnotherWayName: $yetAnotherWayName (${yetAnotherWayName.runtimeType})',
//   );
//   print('currentYear: $currentYear (${currentYear.runtimeType})');
//   print('pi: $pi (${pi.runtimeType})');
//   print('planets: $planets (${planets.runtimeType})');
//   print('colors: $colors (${colors.runtimeType})');
//   print('image: $image (${image.runtimeType})');
// }

/* String interpolation *******************************************************/

// void main() {
//   String nombre = 'Carlos';
//   print('Hola, $nombre'); // Imprime: Hola, Carlos

//   int a = 5;
//   int b = 3;

//   // Imprime: La suma de 5 y 3 es 8
//   print('La suma de $a y $b es ${a + b}');

//   String ciudad = 'Buenos Aires';
//   // Imprime: Vivo en Buenos Aires
//   print('Vivo en $ciudad');

//   int edad = 25;
//   // Imprime: En 5 años tendrás 30 años
//   print('En 5 años tendrás ${edad + 5} años');
// }

/* Null safety ****************************************************************/

// void main() {
//   // Nullable type. Can be `null` or string.
//   String? nullSafetyName;

//   // Non-nullable type. Cannot be `null` but can be string.
//   String nonNullableName;

//   // Declaring a non-nullable variable that's initialized after its declaration
//   late String description;

//   print('1. Operador de acceso condicional (?.)');

//   String? name;
//   // Devuelve null en lugar de lanzar un error
//   print('$name tiene ${name?.length} caracteres');
//   name = 'John';
//   print('$name tiene ${name?.length} caracteres');

//   print('\n2. Operador de asignación condicional (??=)');

//   name = null;
//   name ??= "Usuario";
//   print('name tiene el valor $name'); // "Usuario" si nombre es null

//   print('\n3. Operador de fusión con null (??)');

//   name = null;
//   // "Invitado" si nombre es null
//   print('name tiene el valor ${name ?? "Invitado"}');

//   // print('\n4. Operador de null assertion (!)');

//   // String? nombre;
//   // print(nombre!.length); // Lanzará una excepción si nombre es null

//   print('\n5. Operador de cascada condicional (?..)');

//   var lista;
//   // var lista = [];
//   lista
//     ?..add(1)
//     ..add(2); // No hace nada si lista es null

//   print('El contenido de lista es : $lista');

//   print('\n6. Operador de indexado seguro (?[])');

//   Map? map;
//   // Map? map = {'clave' : 'Hola Mundo!'};
//   print('map["clave"] tiene el valor ${map?["clave"]}'); // null si map es null

//   print('\n7. Operador de propagación condicional (...?)');

//   List<int>? otraLista;
//   // List<int>? otraLista = [1, 2, 3];
//   List<int> otraListaMas = [
//     0,
//     ...?otraLista
//   ]; // Si otraLista es null, no se agrega nada

//   print('La unión de $otraLista y $otraListaMas es igual a ${otraListaMas}');
// }

/* Funciones y métodos ********************************************************/

// void sumar(int a, int b) {
//   print('$a + $b = ${a + b}');
// }

// void restar(int a, int b) => print('$a - $b = ${a - b}');

// void main() {
//   sumar(5, 3);
//   restar(10, 6);
// }

/* Funciones y métodos. Parámetros ********************************************/

// void main() {
//   print('1. Parámetros Posicionales Obligatorios');

//   void sumar(int a, int b) {
//     print('$a + $b = ${a + b}');
//   }

//   sumar(2, 3);

//   print('\n2. Parámetros Posicionales Opcionales');

//   void mostrarNombre(String nombre, [String? apellido]) {
//     print('Nombre completo: $nombre $apellido');
//   }

//   mostrarNombre('Carlos'); // Nombre completo: "Carlos null"
//   mostrarNombre('Carlos', 'Pérez'); // Nombre completo: "Carlos Pérez"

//   print('\n3. Parámetros Nombrados Opcionales');

//   void mostrarDatos({required String nombre, int? edad}) {
//     print('Nombre: $nombre, Edad: $edad');
//   }

//   mostrarDatos(nombre: 'Carlos'); // "Nombre: Carlos, Edad: null"
//   mostrarDatos(nombre: 'Carlos', edad: 30); // "Nombre: Carlos, Edad: 30"

//   print('\n4. Parámetros con Valores por Defecto');

//   void saludar(String nombre, [String saludo = 'Hola']) {
//     print('$saludo, $nombre');
//   }

//   saludar('Ana'); // "Hola, Ana"
//   saludar('Ana', 'Buenos días'); // "Buenos días, Ana"

//   print('\n5. Parámetros de Función (Función como Parámetro)');

//   void ejecutarOperacion(int a, int b, Function operacion) {
//     print('Resultado de la operación: ${operacion(a, b)}');
//   }

//   int sumarOtraVez(int a, int b) => a + b;
//   int restar(int a, int b) => a - b;

//   ejecutarOperacion(3, 2, sumarOtraVez);
//   ejecutarOperacion(3, 2, restar);

//   print('\n6. Parámetros de Función (Función nullable como Parámetro)');

//   void ejecutarOperacionNullable(int a, int b, [Function? operacion]) {
//     print('Resultado de la operación nullable: ${operacion?.call(a, b)}');
//   }

//   ejecutarOperacionNullable(3, 2, sumarOtraVez);
//   ejecutarOperacionNullable(3, 2);
// }

/* Control de flujo ***********************************************************/

// void main() {
//   print('1. Estructura if y else');

//   String verificarEdad(int edad) {
//     if (edad >= 18) {
//       return 'mayor de edad';
//     } else {
//       return 'menor de edad';
//     }
//   }

//   String verificarEdadCorto(int edad) =>
//       (edad >= 18) ? 'mayor de edad' : 'menor de edad';

//   var age = 42;
//   print('con $age años eres: ${verificarEdad(age)}');
//   age = 5;
//   print('con $age años eres: ${verificarEdadCorto(age)}');

//   print('\n2. Estructura else if');

//   String verificarTemperatura(int temperatura) {
//     if (temperatura > 30) {
//       return 'Hace calor';
//     } else if (temperatura > 20) {
//       return 'Está templado';
//     } else {
//       return 'Hace frío';
//     }
//   }

//   var temperatures = [60, 25, 10];
//   for (final temperature in temperatures) {
//     print('a $temperature grados: ${verificarTemperatura(temperature)}');
//   }

//   print('\n3. Estructura switch');

//   String mostrarDia(int dia) {
//     String result;
//     switch (dia) {
//       case 1:
//         result = 'Domingo';
//         break;
//       case 2:
//         result = 'Lunes';
//         break;
//       case 3:
//         result = 'Martes';
//         break;
//       case 4:
//         result = 'Miércoles';
//         break;
//       case 5:
//         result = 'Jueves';
//         break;
//       case 6:
//         result = 'Viernes!';
//         break;
//       case 7:
//         result = 'Sábado';
//         break;
//       default:
//         result = 'NO VÁLIDO';
//     }
//     return result;
//   }

//   print('El 1er día de la semana es ${mostrarDia(1)}');
//   print('El 10mo día de la semana es ${mostrarDia(10)}');

//   print('\n4. Bucles for');

//   for (int i = 0; i < 5; i++) {
//     print('Iteración $i');
//   }

//   List<String> frutas = ['Manzana', 'Banana', 'Naranja'];

//   for (String fruta in frutas) {
//     print(fruta);
//   }

//   print('\n5. Bucle while');

//   int contador = 0;

//   while (contador < 5) {
//     print('Contador: $contador');
//     contador++;
//   }

//   print('\n6. Bucle do-while');

//   int numero = 5;

//   do {
//     print('Número: $numero');
//     numero--;
//   } while (numero > 0);

//   print('\n7. Estructura break');

//   for (int i = 0; i < 5; i++) {
//     if (i == 3) {
//       break;
//     }
//     print('i: $i'); // Imprime hasta 2
//   }

//   print('\n8. Estructura continue');

//   for (int i = 0; i < 5; i++) {
//     if (i == 2) {
//       continue;
//     }
//     print('i: $i'); // Salta el valor 2
//   }

//   print('\n9. Estructura try-catch-finally');

//   void ImprimirCaracter(String palabra, int index) {
//     try {
//       print('El caracter $index de $palabra es: ${palabra[index - 1]}');
//     } catch (e) {
//       print('Error $e');
//     } finally {
//       print('Operación finalizada');
//     }
//   }

//   ImprimirCaracter('Elefante', 5);
//   ImprimirCaracter('Auto', 5);

//   print('\n10. Expresión assert');

//   int edad = 20;
//   assert(edad >= 18, 'Debe ser mayor de edad');

//   print('\n11. Expresión throw');

//   void validarEdad(int edad) {
//     if (edad < 18) {
//       throw Exception('La edad debe ser mayor o igual a 18');
//     }
//     print('Edad válida');
//   }

//   validarEdad(16); // Lanza una excepción
// }

/* Concurrencia ***************************************************************/

Future<String> obtenerMensaje() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Hola, soy un mensaje del futuro';
}

// void main() async {
//   obtenerMensaje().then((mensaje) {
//     print('then: $mensaje');
//   });

//   // String mensaje = await obtenerMensaje();
//   // print('await: $mensaje');
// }

/* Clases *********************************************************************/

// class Person {
//   Person({
//     required this.firstName,
//     required this.lastName,
//     this.age = 0,
//   });

//   final String firstName;
//   final String lastName;
//   final int age;

//   String get fullName => '$firstName $lastName';

//   void salute() => print(
//         'Hi, I\'m $firstName and I\'m $age years old',
//       );
// }

// void main() {
//   Person person1 = Person(firstName: 'John', lastName: 'Doe', age: 35);
//   Person person2 = Person(firstName: 'Jane', lastName: 'Doe');

//   person1.salute(); // Hi, I'm John and I'm 35 years old
//   person2.salute(); // Hi, I'm Jane and I'm 0 years old
// }

/* Herencia *******************************************************************/

// class Employee extends Person {
//   Employee({
//     required super.firstName,
//     required super.lastName,
//     super.age,
//     required this.salary,
//   });

//   final double salary;

//   @override
//   void salute() {
//     print('Hi, I\'m $firstName and I\'m $age years old and I earn $salary');
//   }

//   void work() {
//     print('$firstName is working...');
//   }
// }

// void main() {
//   Employee employee = Employee(
//     firstName: 'John',
//     lastName: 'Doe',
//     age: 35,
//     salary: 3500,
//   );

//   employee.salute(); // Hi, I'm John and I'm 35 years old and I earn 3500.0
// }

/* Mixin **********************************************************************/

// mixin Dancer {
//   void dance() {
//     print('Look! I\'m dancing!');
//   }
// }

// mixin Driver {
//   void drive() {
//     print('Watch out! I\'m driving!');
//   }
// }

/// class Employee extends Person with Dancer, Driver {

// void main() {
//   Employee employee = Employee(
//     firstName: 'John',
//     lastName: 'Doe',
//     age: 35,
//     salary: 3500,
//   );

//   employee.salute();
//   employee.dance();
//   employee.drive();
// }

/* Imports ********************************************************************/

// Importing core libraries
// import 'dart:math';

// Importing libraries from external packages
// import 'package:my_library/my_lybrary.dart';

// Importing files
// import 'path/to/my_other_file.dart';
