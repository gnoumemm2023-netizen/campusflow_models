/// Un utilisateur (étudiant) de CampusFlow.
class User {
  final String id;
  final String name;
  final String email;

  const User({
    required this.id,
    required this.name,
    required this.email,
  });

  User copyWith({String? id, String? name, String? email}) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  /// Lève une [FormatException] si un champ obligatoire est absent ou invalide.
  factory User.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final name = json['name'];
    final email = json['email'];
    if (id is! String || name is! String || email is! String) {
      throw FormatException('JSON invalide pour User', json);
    }
    return User(id: id, name: name, email: email);
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'email': email};

  @override
  bool operator ==(Object other) =>
      other is User &&
      other.id == id &&
      other.name == name &&
      other.email == email;

  @override
  int get hashCode => Object.hash(id, name, email);

  @override
  String toString() => 'User($id, $name, $email)';
}
