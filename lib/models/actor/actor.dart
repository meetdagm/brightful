


class Actor {

  String? id;
  String name;
  String description;
  int cost;
  bool isAvailable;

  Actor({
    this.id,
    required this.name, 
    required this.description, 
    required this.cost,
    required this.isAvailable,
  });

  factory Actor.empty() {
    return Actor(
      name: "",
      description: "",
      cost: 0,
      isAvailable: true
    );
  }
  

}