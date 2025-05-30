using {com.project as project} from '../db/schema';

service CatalogService {
    entity Products     as projection on project.Products;
    entity Suppliers    as projection on project.Suppliers;
}
