namespace cakeshop;

entity Cake {
  key ID: UUID;
  cakeID: Integer @assert.unique @mandatory;
  name: String(100);
  description: String(500);
  price: Decimal(10,2);
  quantity: Integer;
  expiryDate: Date;
  category: Association to Category;
  orders: Association to many Order on orders.cake = $self;
  order: Association to Order;
}

entity Category {
  key ID: UUID;
  categoryID: Integer @assert.unique @mandatory;
  name: String(50);
  description: String(100);
  cakes: Association to many Cake on cakes.category = $self;
}

entity Order {
  key ID: UUID;
  orderID: Integer @assert.unique @mandatory;
  customerName: String(100);
  orderDate: Date;
  status: String(20);
  cakes: Association to many Cake on cakes.order = $self;
  cake: Association to Cake;
}

