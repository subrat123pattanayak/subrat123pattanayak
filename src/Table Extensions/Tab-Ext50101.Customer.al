tableextension 50101 Cust extends Customer
{
    fields
    {
        field(11310; "Enterprise No."; Text[50])
        {
            Caption = 'Enterprise No.';


        }
        field(11311; "VAT Liable"; Boolean)
        {
            Caption = 'VAT Liable';
            InitValue = true;
        }

    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

}