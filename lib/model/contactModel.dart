class Contacts {
  late String id;
  late String fullName;
  late String phone;

  Contacts({required this.id, required this.fullName, required this.phone});

  Contacts.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        fullName = json['fullName'],
        phone = json['phone'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullName': fullName,
        'phone': phone,
      };
}
