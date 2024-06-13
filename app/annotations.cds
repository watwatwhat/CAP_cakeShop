using { cakeshopSrv } from '../srv/service.cds';

annotate cakeshopSrv.Cake with @UI.HeaderInfo: { TypeName: 'Cake', TypeNamePlural: 'Cakes', Title: { Value: cakeID } };
annotate cakeshopSrv.Cake with {
  ID @UI.Hidden @Common.Text: { $value: cakeID, ![@UI.TextArrangement]: #TextOnly }
};
annotate cakeshopSrv.Cake with @UI.Identification: [{ Value: cakeID }];
annotate cakeshopSrv.Cake with {
  category @Common.ValueList: {
    CollectionPath: 'Category',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: category_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'categoryID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'description'
      },
    ],
  }
};
annotate cakeshopSrv.Cake with {
  order @Common.ValueList: {
    CollectionPath: 'Order',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: order_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'orderID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'customerName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'orderDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'status'
      },
    ],
  }
};
annotate cakeshopSrv.Cake with @UI.DataPoint #name: {
  Value: name,
  Title: 'Name',
};
annotate cakeshopSrv.Cake with @UI.DataPoint #price: {
  Value: price,
  Title: 'Price',
};
annotate cakeshopSrv.Cake with @UI.DataPoint #quantity: {
  Value: quantity,
  Title: 'Quantity',
};
annotate cakeshopSrv.Cake with {
  cakeID @title: 'ID';
  name @title: 'Name';
  description @title: 'Description';
  price @title: 'Price';
  quantity @title: 'Quantity';
  expiryDate @title: 'Expiry Date'
};

annotate cakeshopSrv.Cake with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: cakeID },
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Value: quantity },
    { $Type: 'UI.DataField', Value: expiryDate },
    { $Type: 'UI.DataField', Label: 'Category', Value: category_ID },
    { $Type: 'UI.DataField', Label: 'Order', Value: order_ID }
];

annotate cakeshopSrv.Cake with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: cakeID },
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Value: quantity },
    { $Type: 'UI.DataField', Value: expiryDate },
    { $Type: 'UI.DataField', Label: 'Category', Value: category_ID },
    { $Type: 'UI.DataField', Label: 'Order', Value: order_ID }
  ]
};

annotate cakeshopSrv.Cake with {
  category @Common.Text: { $value: category.categoryID, ![@UI.TextArrangement]: #TextOnly };
  order @Common.Text: { $value: order.orderID, ![@UI.TextArrangement]: #TextOnly }
};

annotate cakeshopSrv.Cake with {
  category @Common.Label: 'Category';
  orders @Common.Label: 'Orders';
  order @Common.Label: 'Order'
};

annotate cakeshopSrv.Cake with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#name' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#price' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#quantity' }
];

annotate cakeshopSrv.Cake with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate cakeshopSrv.Cake with @UI.SelectionFields: [
  category_ID,
  order_ID
];

annotate cakeshopSrv.Category with @UI.HeaderInfo: { TypeName: 'Category', TypeNamePlural: 'Categories', Title: { Value: categoryID } };
annotate cakeshopSrv.Category with {
  ID @UI.Hidden @Common.Text: { $value: categoryID, ![@UI.TextArrangement]: #TextOnly }
};
annotate cakeshopSrv.Category with @UI.Identification: [{ Value: categoryID }];
annotate cakeshopSrv.Category with @UI.DataPoint #name: {
  Value: name,
  Title: 'Name',
};
annotate cakeshopSrv.Category with {
  categoryID @title: 'ID';
  name @title: 'Name';
  description @title: 'Description'
};

annotate cakeshopSrv.Category with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: categoryID },
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: description }
];

annotate cakeshopSrv.Category with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: categoryID },
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: description }
  ]
};

annotate cakeshopSrv.Category with {
  cakes @Common.Label: 'Cakes'
};

annotate cakeshopSrv.Category with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#name' }
];

annotate cakeshopSrv.Category with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate cakeshopSrv.Category with @UI.SelectionFields: [
  categoryID
];

annotate cakeshopSrv.Order with @UI.HeaderInfo: { TypeName: 'Order', TypeNamePlural: 'Orders', Title: { Value: orderID } };
annotate cakeshopSrv.Order with {
  ID @UI.Hidden @Common.Text: { $value: orderID, ![@UI.TextArrangement]: #TextOnly }
};
annotate cakeshopSrv.Order with @UI.Identification: [{ Value: orderID }];
annotate cakeshopSrv.Order with {
  cake @Common.ValueList: {
    CollectionPath: 'Cake',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: cake_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'cakeID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'description'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'price'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'quantity'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'expiryDate'
      },
    ],
  }
};
annotate cakeshopSrv.Order with @UI.DataPoint #customerName: {
  Value: customerName,
  Title: 'Customer Name',
};
annotate cakeshopSrv.Order with @UI.DataPoint #orderDate: {
  Value: orderDate,
  Title: 'Order Date',
};
annotate cakeshopSrv.Order with @UI.DataPoint #status: {
  Value: status,
  Title: 'Status',
};
annotate cakeshopSrv.Order with {
  orderID @title: 'ID';
  customerName @title: 'Customer Name';
  orderDate @title: 'Order Date';
  status @title: 'Status'
};

annotate cakeshopSrv.Order with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: orderID },
    { $Type: 'UI.DataField', Value: customerName },
    { $Type: 'UI.DataField', Value: orderDate },
    { $Type: 'UI.DataField', Value: status },
    { $Type: 'UI.DataField', Label: 'Cake', Value: cake_ID }
];

annotate cakeshopSrv.Order with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: orderID },
    { $Type: 'UI.DataField', Value: customerName },
    { $Type: 'UI.DataField', Value: orderDate },
    { $Type: 'UI.DataField', Value: status },
    { $Type: 'UI.DataField', Label: 'Cake', Value: cake_ID }
  ]
};

annotate cakeshopSrv.Order with {
  cake @Common.Text: { $value: cake.cakeID, ![@UI.TextArrangement]: #TextOnly }
};

annotate cakeshopSrv.Order with {
  cakes @Common.Label: 'Cakes';
  cake @Common.Label: 'Cake'
};

annotate cakeshopSrv.Order with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#customerName' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#orderDate' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#status' }
];

annotate cakeshopSrv.Order with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate cakeshopSrv.Order with @UI.SelectionFields: [
  cake_ID
];

