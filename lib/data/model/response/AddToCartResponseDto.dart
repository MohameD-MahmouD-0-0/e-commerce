import 'package:ecommerce/domain/entites/AddToCartResponseEntity.dart';

/// status : "success"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 1
/// cartId : "67f477667379fd935b0aefe7"
/// data : {"_id":"67f477667379fd935b0aefe7","cartOwner":"64283590fc5553c3377c03a7","products":[{"count":1,"_id":"67f477667379fd935b0aefe8","product":"6428ebc6dc1175abc65ca0b9","price":191}],"createdAt":"2025-04-08T01:09:58.293Z","updatedAt":"2025-04-08T01:09:58.469Z","__v":0,"totalCartPrice":191}

class AddToCartResponseDto {
  AddToCartResponseDto({
      this.status,
      this.message,
      this.numOfCartItems,
      this.cartId,
      this.data,});

  AddToCartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? AddToCartDataDto.fromJson(json['data']) : null;
  }
  String? status;
  String? message;
  int? numOfCartItems;
  String? cartId;
  AddToCartDataDto? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['numOfCartItems'] = numOfCartItems;
    map['cartId'] = cartId;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;

  }

  AddToCartResponseEntity toAddToCartResponseDto() {
    return AddToCartResponseEntity(
      data: AddToCartDataEntity(),
      message: message,
      numOfCartItems: numOfCartItems,
      cartId: cartId,
      status: status,
    );
  }
}

/// _id : "67f477667379fd935b0aefe7"
/// cartOwner : "64283590fc5553c3377c03a7"
/// products : [{"count":1,"_id":"67f477667379fd935b0aefe8","product":"6428ebc6dc1175abc65ca0b9","price":191}]
/// createdAt : "2025-04-08T01:09:58.293Z"
/// updatedAt : "2025-04-08T01:09:58.469Z"
/// __v : 0
/// totalCartPrice : 191

class AddToCartDataDto {
  AddToCartDataDto({
      this.id,
      this.cartOwner,
      this.products,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.totalCartPrice,});

  AddToCartDataDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddToCartProductsDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
  String? id;
  String? cartOwner;
  List<AddToCartProductsDto>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['cartOwner'] = cartOwner;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['totalCartPrice'] = totalCartPrice;
    return map;
  }
}

/// count : 1
/// _id : "67f477667379fd935b0aefe8"
/// product : "6428ebc6dc1175abc65ca0b9"
/// price : 191

class AddToCartProductsDto {
  AddToCartProductsDto({
      this.count,
      this.id,
      this.product,
      this.price,});

  AddToCartProductsDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }
  int? count;
  String? id;
  String? product;
  int? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    map['product'] = product;
    map['price'] = price;
    return map;
  }
AddToCartProductsEntity toAddToCartProductsDto(){
    return AddToCartProductsEntity(count: count,
    id: id,
    price: price,
    product: product);
}
}