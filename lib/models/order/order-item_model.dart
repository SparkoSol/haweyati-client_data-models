import 'package:haweyati_client_data_models/common/json_serializable.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

abstract class Orderable extends HiveObject implements JsonSerializable {}

abstract class OrderItem extends HiveObject implements JsonSerializable {
  @HiveField(0)
  Orderable product;
  OrderItem(this.product);

  @override
  @mustCallSuper
  Map<String, dynamic> serialize() => {
        'product': product.serialize(),
      };
}

class OrderItemHolder<T extends OrderItem> implements JsonSerializable {
  T item;
  double subtotal;
  String supplier;

  OrderItemHolder({this.item, this.supplier, this.subtotal});

  @override
  Map<String, dynamic> serialize() => {
        'item': item.serialize(),
        'subtotal': subtotal,
        'supplier': supplier,
      };
}
