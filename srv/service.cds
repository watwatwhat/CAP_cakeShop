using { cakeshop as my } from '../db/schema.cds';

@path : '/service/cakeshop'
service cakeshopSrv
{
    annotate Cake with @restrict :
    [
        { grant : [ '*' ], to : [ 'store-manager' ] },
        { grant : [ '*' ], to : [ 'store-staff' ] },
        { grant : [ 'READ' ], to : [ 'store-supervisor' ] }
    ];

    annotate Category with @restrict :
    [
        { grant : [ '*' ], to : [ 'store-manager' ] },
        { grant : [ 'READ' ], to : [ 'store-staff' ] },
        { grant : [ 'READ' ], to : [ 'store-supervisor' ] }
    ];

    annotate Order with @restrict :
    [
        { grant : [ '*' ], to : [ 'store-manager' ] },
        { grant : [ '*' ], to : [ 'store-staff' ] },
        { grant : [ 'READ' ], to : [ 'store-supervisor' ] }
    ];

    @odata.draft.enabled
    entity Cake as
        projection on my.Cake;

    @odata.draft.enabled
    entity Category as
        projection on my.Category;

    @odata.draft.enabled
    entity Order as
        projection on my.Order;
}

annotate cakeshopSrv with @requires :
[
    'authenticated-user',
    'store-manager',
    'store-staff',
    'store-supervisor'
];
