namespace com.project;

type Name               : String(50);

type Address {
    Street     : String;
    City       : String;
    State      : String(2);
    PostalCode : String(5);
    Country    : String(3);
};

type Gender : String enum {
    male;
    female;
};

type Dec : Decimal(16, 2);


// type EmailsAddresses_01 : array of {
//     kind  : String;
//     email : String;
// };

// type EmailsAddresses_02 {
//     kind  : String;
//     email : String;
// };

// entity Emails {
//     email_01 : EmailsAddresses_01;
//     email_02 : many EmailsAddresses_02;
// };

entity Order {
    clientGender: Gender;
    status: Integer enum{
        submitted = 1;
        fulfuller = 2;
        shipped = 3;
        cancel = 4;
    };
    priority: String @assert.range enum {
        high;
        medium;
        low;
    };
};

entity Products {
    key ID               : UUID;
        name             : String;
        Description      : String;
        ImageUrl         : String;
        ReleaseDate      : DateTime;
        DiscontinuedDate : DateTime;
        Price            : Dec;
        Height           : type of Price;
        Width            : Decimal(16, 2);
        Depth            : Decimal(16, 2);
        Quantity         : Decimal(16, 2);
};

entity Suppliers {
    key ID      : UUID;
        Name    : type of Products:name;
        Address : Address;
        Email   : String;
        Phone   : String;
        Fax     : String;
};

entity Categories {
    key ID   : String(1);
        Name : String;
};

entity StockAvailability {
    key ID          : Integer;
        Description : String;
};

entity Currencies {
    key ID          : String(3);
        Description : String;
};

entity UnitOfMeasures {
    key ID          : String(2);
        Description : String;
};

entity DimensionUnits {
    key ID          : String(2);
        Description : String;
};

entity Months {
    key ID               : String(2);
        Description      : String;
        ShortDescription : String(3);
};

entity ProductReview {
    key Name    : String;
        Rating  : Integer;
        Comment : String;
};

entity SalesData {
    key ID           : UUID;
        DeliveryDate : DateTime;
        Revenue      : Decimal(16, 2);

};
