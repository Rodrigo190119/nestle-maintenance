class UserEntity {
  int? id;
  String? name;

  UserEntity({
    this.id,
    this.name
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Técnico 0'
    );
  }
}