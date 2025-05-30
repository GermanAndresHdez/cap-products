using {com.project as project} from '../db/schema';

service CatalogService {
    entity Products       as projection on project.Products;
    entity Suppliers      as projection on project.Suppliers;
    entity UnitOfMeasures as projection on project.UnitOfMeasures;
    entity Currency       as projection on project.Currencies;
    entity DimensionUnit  as projection on project.DimensionUnits;
    entity Category       as projection on project.Categories;
    entity SalesData      as projection on project.SalesData;
    entity Reviews        as projection on project.ProductReview;
    entity Months          as projection on project.Months;
    entity Order          as projection on project.Orders;
    entity OrderItems     as projection on project.OrderItems;
}
