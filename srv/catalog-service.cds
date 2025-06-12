using com.project as project from '../db/schema';
using com.training as training from '../db/training';

// service CatalogService {
//     entity Products       as projection on project.materials.Products;
//     entity Suppliers      as projection on project.sales.Suppliers;
//     entity UnitOfMeasures as projection on project.materials.UnitOfMeasures;
//     entity Currency       as projection on project.materials.Currencies;
//     entity DimensionUnit  as projection on project.materials.DimensionUnits;
//     entity Category       as projection on project.materials.Categories;
//     entity SalesData      as projection on project.sales.SalesData;
//     entity Reviews        as projection on project.materials.ProductReview;
//     entity Months          as projection on project.sales.Months;
//     entity Order          as projection on project.sales.Orders;
//     entity OrderItems     as projection on project.sales.OrderItems;
// }

define service CatalogService {

    entity Products          as
        select from project.materials.Products {
            ID,
            Name          as ProductName     @mandatory,
            Description                      @mandatory,
            ImageUrl,
            ReleaseDate,
            DiscontinuedDate,
            Price                            @mandatory,
            Height,
            Width,
            Depth,
            Quantity                         @(
                mandatory,
                assert.range: [
                    0.00,
                    20.00
                ]
            ),
            UnitOfMeasure as ToUnitOfMeasure @mandatory,
            Currency      as ToCurrency      @mandatory,
            Category      as ToCategory      @mandatory,
            Category.Name as Category        @readonly,
            DimensionUnit as ToDimensionUnit,
            SalesData,
            Supplier,
            Reviews
        };

    @readonly
    entity Supplier          as
        select from project.sales.Suppliers {
            ID,
            Name    as SupplierName,
            Email,
            Phone,
            Fax,
            Product as ToProduct
        };

    entity Reviews           as
        select from project.materials.ProductReview {
            ID,
            Name,
            Rating,
            Comment,
            //createdAt,
            Product as ToProduct
        };

    @readonly
    entity SalesData         as
        select from project.sales.SalesData {
            ID,
            DeliveryDate,
            Revenue,
            Currency.ID               as CurrencyKey,
            DeliveryMonth.ID          as DeliveryMonthID,
            DeliveryMonth.Description as DeliveryMonth,
            Product                   as ToProduct


        };

    @readonly
    entity StockAvailability as
        select from project.materials.StockAvailability {
            ID,
            Description,
            Product as ToProduct
        };

    @readonly
    entity VH_Categories     as
        select from project.materials.Categories {
            ID   as Code,
            Name as Text
        };

    @readonly
    entity VH_Currencies     as
        select from project.materials.Currencies {
            ID          as Code,
            Description as Text
        };

    @readonly
    entity VH_UnitOfMeasure  as
        select from project.materials.UnitOfMeasures {
            ID          as Code,
            Description as Text
        };

    @readonly
    entity VH_DimensionUnits as
        select from project.materials.DimensionUnits {
            ID          as Code,
            Description as Text
        };

}
