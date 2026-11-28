class Estudiante {

  final int? id;
  final String nombre;
  final int edad;

  Estudiante({
    this.id,
    required this.nombre,
    required this.edad,
  });

  // Convertir objeto a Map
  Map<String, dynamic> toMap() {

    return {
      'nombre': nombre,
      'edad': edad,
    };

  }

  // Convertir Map a objeto
  factory Estudiante.fromMap(Map<String, dynamic> map) {

    return Estudiante(
      id: map['id'] as int,
      nombre: map['nombre'] as String,
      edad: map['edad'] as int,
    );

  }
}