class UserList {
  final String id;
  final String name;
  final int order;
  final List<String> members;

  bool get shared => members.length >= 2;

  UserList({
    required this.id,
    required this.name,
    required this.members,
    required this.order,
  });

  factory UserList.fromMap(Map<dynamic, dynamic> map) {
    return UserList(
      id: map['id'] as String,
      name: map['name'] as String,
      order: map['order'] as int,
      members: map['members'] != null
          ? List<String>.from(map['members'].map((e) => e.toString()))
          : <String>[],
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'name': this.name,
      'order': this.order,
      'members': this.members,
    } as Map<String, dynamic>;
  }

  static List<UserList> from(value) {
    if (value == null) {
      return <UserList>[];
    } else if (value is Map) {
      return [UserList.fromMap(value)];
    } else if (value is Iterable) {
      return value.map((e) => UserList.fromMap(e)).toList();
    } else {
      return <UserList>[]..add(UserList.fromMap(value));
    }
  }

  UserList copyWith({
    String? id,
    String? name,
    int? order,
    List<String>? members,
  }) {
    if ((id == null || identical(id, this.id)) &&
        (name == null || identical(name, this.name)) &&
        (order == null || identical(order, this.order)) &&
        (members == null || identical(members, this.members))) {
      return this;
    }

    return UserList(
      id: id ?? this.id,
      name: name ?? this.name,
      order: order ?? this.order,
      members: members ?? this.members,
    );
  }
}
