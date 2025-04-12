/// status : "success"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 1
/// cartId : "67f477667379fd935b0aefe7"
/// data : {"_id":"67f477667379fd935b0aefe7","cartOwner":"64283590fc5553c3377c03a7","products":[{"count":1,"_id":"67f477667379fd935b0aefe8","product":"6428ebc6dc1175abc65ca0b9","price":191}],"createdAt":"2025-04-08T01:09:58.293Z","updatedAt":"2025-04-08T01:09:58.469Z","__v":0,"totalCartPrice":191}

class AddToCartResponseEntity {
  AddToCartResponseEntity({
      this.status, 
      this.message, 
      this.numOfCartItems, 
      this.cartId, 
      this.data,});

  String? status;
  String? message;
  int? numOfCartItems;
  String? cartId;
  AddToCartDataEntity? data;


}

/// _id : "67f477667379fd935b0aefe7"
/// cartOwner : "64283590fc5553c3377c03a7"
/// products : [{"count":1,"_id":"67f477667379fd935b0aefe8","product":"6428ebc6dc1175abc65ca0b9","price":191}]
/// createdAt : "2025-04-08T01:09:58.293Z"
/// updatedAt : "2025-04-08T01:09:58.469Z"
/// __v : 0
/// totalCartPrice : 191

class AddToCartDataEntity {
  AddToCartDataEntity({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});

  String? id;
  String? cartOwner;
  List<AddToCartProductsEntity>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;


}

/// count : 1
/// _id : "67f477667379fd935b0aefe8"
/// product : "6428ebc6dc1175abc65ca0b9"
/// price : 191

class AddToCartProductsEntity {
  AddToCartProductsEntity({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  int? count;
  String? id;
  String? product;
  int? price;

}