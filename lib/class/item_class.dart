class Item {
  final String name;
  final String image;
  final double price;
  final String sellerId;

  Item({
    required this.name,
    required this.image,
    required this.price,
    required this.sellerId,
  });
}

class Order {
  final String orderId;
  final List<Item> items;
  final String status;
  final DateTime timestamp;
  final double totalPrice;
  final String userId;
  final double subtotalPrice;

  Order({
    required this.orderId,
    required this.items,
    required this.status,
    required this.timestamp,
    required this.totalPrice,
    required this.userId,
    required this.subtotalPrice,
  });
}
