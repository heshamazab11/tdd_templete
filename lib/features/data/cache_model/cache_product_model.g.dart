// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductCacheAdapter extends TypeAdapter<ProductCache> {
  @override
  final int typeId = 10;

  @override
  ProductCache read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductCache(
      fields[0] as String,
      (fields[1] as List).cast<ProductModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProductCache obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.product);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductCacheAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
