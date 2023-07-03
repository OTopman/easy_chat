class Message {
  int? id;
  String? uuid;
  String? sender;
  String? message;
  DateTime? createdAt;

  Message({
    this.id,
    this.uuid,
    this.sender,
    this.message,
    this.createdAt,
  });

  Message.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      json = json['data'];
    }

    id = json['id'];
    uuid = json['uuid'];
    sender = json['sender'];
    message = json['message'];
    createdAt = DateTime.parse(json['createdAt']);
  }

  @override
  toString() {
    return "Message(id: $id, uuid:$uuid, sender: $sender, message: $message, createdAt: $createdAt)";
  }
}
