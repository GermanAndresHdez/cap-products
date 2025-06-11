using com.project as project from '../db/schema';
using com.training as training from '../db/training';

service CatalogService {
    entity Products       as projection on project.materials.Products;
    entity Suppliers      as projection on project.sales.Suppliers;
    entity UnitOfMeasures as projection on project.materials.UnitOfMeasures;
    entity Currency       as projection on project.materials.Currencies;
    entity DimensionUnit  as projection on project.materials.DimensionUnits;
    entity Category       as projection on project.materials.Categories;
    entity SalesData      as projection on project.sales.SalesData;
    entity Reviews        as projection on project.materials.ProductReview;
    entity Months          as projection on project.sales.Months;
    entity Order          as projection on project.sales.Orders;
    entity OrderItems     as projection on project.sales.OrderItems;
}
