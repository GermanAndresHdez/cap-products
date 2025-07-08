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
        select from project.reports.Products {
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
            Reviews,
            Rating,
            StockAvailability,
            ToStockAvailibility
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
        select
            ID          as Code,
            Description as Text
        from project.materials.DimensionUnits;

}

define service MyService {

    entity SuppliersProduct as
        select from project.materials.Products[Name = 'Bread']{
            *,
            Name,
            Description,
            Supplier.Address
        }
        where
            Supplier.Address.PostalCode = 98074;

    entity SupplierToSales  as
        select
            Supplier.Email,
            Category.Name,
            SalesData.Currency.ID,
            SalesData.Currency.Description
        from project.materials.Products;

    entity EntityInfix      as
        select Supplier[Name = 'Exotic Liquids'].Phone from project.materials.Products
        where
            Products.Name = 'Bread';

    entity EntityJoin       as
        select Phone from project.materials.Products
        left join project.sales.Suppliers as supp
            on(
                supp.ID   = Products.Supplier.ID
            )
            and supp.Name = 'Exotic Liquids'
        where
            Products.Name = 'Bread';
}

define service Reports {

    entity AverageRating as projection on project.reports.AverageRating;

    entity EntityCasting as
        select
            cast(
                Price as Integer
            )     as Price,
            Price as Price2 : Integer
        from project.materials.Products;


    entity EntityExits   as
        select from project.materials.Products {
            Name
        }
        where
            exists Supplier[Name = 'Exotic Liquids'];

}
