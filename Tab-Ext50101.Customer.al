namespace BC.BC;

using Microsoft.Sales.Customer;

tableextension 50101 Customer extends Customer
{
    fields
    {
        field(50001; "Enterprise No."; Code[50])
        {
            Caption = 'Enterprise No.';
            DataClassification = ToBeClassified;
        }

    }
}
