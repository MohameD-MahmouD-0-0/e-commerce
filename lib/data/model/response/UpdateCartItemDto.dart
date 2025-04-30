import '../../../domain/entites/UpdateCartItemEntity.dart';

class UpdateCartItemDto {
  UpdateCartItemDto({
    this.status,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  UpdateCartItemDto.fromJson(dynamic json) {
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? UpdateCartItemDataDto.fromJson(json['data']) : null;
  }

  String? status;
  int? numOfCartItems;
  String? cartId;
  UpdateCartItemDataDto? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['numOfCartItems'] = numOfCartItems;
    map['cartId'] = cartId;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

  UpdateCartItemEntity toEntity() {
    return UpdateCartItemEntity(
      status: status,
      numOfCartItems: numOfCartItems,
      cartId: cartId,
      data: data?.toEntity(),
    );
  }
}

class UpdateCartItemDataDto {
  UpdateCartItemDataDto({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  UpdateCartItemDataDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(UpdateCartItemProductsDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }

  String? id;
  String? cartOwner;
  List<UpdateCartItemProductsDto>? products;
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

  UpdateCartItemDataEntity toEntity() {
    return UpdateCartItemDataEntity(
      id: id,
      cartOwner: cartOwner,
      products: products?.map((e) => e.toEntity()).toList(),
      createdAt: createdAt,
      updatedAt: updatedAt,
      v: v,
      totalCartPrice: totalCartPrice,
    );
  }
}

class UpdateCartItemProductsDto {
  UpdateCartItemProductsDto({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  UpdateCartItemProductsDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'] != null ? UpdateCartItemProductesDto.fromJson(json['product']) : null;
    price = json['price'];
  }

  int? count;
  String? id;
  UpdateCartItemProductesDto? product;
  int? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    if (product != null) {
      map['product'] = product?.toJson();
    }
    map['price'] = price;
    return map;
  }

  UpdateCartItemProductsEntity toEntity() {
    return UpdateCartItemProductsEntity(
      count: count,
      id: id,
      product: product?.toEntity(),
      price: price,
    );
  }
}

class UpdateCartItemProductesDto {
  UpdateCartItemProductesDto({
    this.subcategory,
    this.id,
    this.title,
    this.quantity,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
  });

  UpdateCartItemProductesDto.fromJson(dynamic json) {
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(UpdateCartItemSubcategoryDto.fromJson(v));
      });
    }
    id = json['_id'];
    title = json['title'];
    quantity = json['quantity'];
    imageCover = json['imageCover'];
    category = json['category'] != null ? UpdateCartItemCategoryDto.fromJson(json['category']) : null;
    brand = json['brand'] != null ? UpdateCartItemBrandDto.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
  }

  List<UpdateCartItemSubcategoryDto>? subcategory;
  String? id;
  String? title;
  int? quantity;
  String? imageCover;
  UpdateCartItemCategoryDto? category;
  UpdateCartItemBrandDto? brand;
  double? ratingsAverage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (subcategory != null) {
      map['subcategory'] = subcategory?.map((v) => v.toJson()).toList();
    }
    map['_id'] = id;
    map['title'] = title;
    map['quantity'] = quantity;
    map['imageCover'] = imageCover;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    if (brand != null) {
      map['brand'] = brand?.toJson();
    }
    map['ratingsAverage'] = ratingsAverage;
    return map;
  }

  UpdateCartItemProductesEntity toEntity() {
    return UpdateCartItemProductesEntity(
      subcategory: subcategory?.map((e) => e.toEntity()).toList(),
      id: id,
      title: title,
      quantity: quantity,
      imageCover: imageCover,
      category: category?.toEntity(),
      brand: brand?.toEntity(),
      ratingsAverage: ratingsAverage,
    );
  }
}

class UpdateCartItemBrandDto {
  UpdateCartItemBrandDto({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  UpdateCartItemBrandDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }

  String? id;
  String? name;
  String? slug;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    return map;
  }

  UpdateCartItemBrandEntity toEntity() {
    return UpdateCartItemBrandEntity(
      id: id,
      name: name,
      slug: slug,
      image: image,
    );
  }
}

class UpdateCartItemCategoryDto {
  UpdateCartItemCategoryDto({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  UpdateCartItemCategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }

  String? id;
  String? name;
  String? slug;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    return map;
  }

  UpdateCartItemCategoryEntity toEntity() {
    return UpdateCartItemCategoryEntity(
      id: id,
      name: name,
      slug: slug,
      image: image,
    );
  }
}

class UpdateCartItemSubcategoryDto {
  UpdateCartItemSubcategoryDto({
    this.id,
    this.name,
    this.slug,
    this.category,
  });

  UpdateCartItemSubcategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }

  String? id;
  String? name;
  String? slug;
  String? category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['category'] = category;
    return map;
  }

  UpdateCartItemSubcategoryEntity toEntity() {
    return UpdateCartItemSubcategoryEntity(
      id: id,
      name: name,
      slug: slug,
      category: category,
    );
  }
}