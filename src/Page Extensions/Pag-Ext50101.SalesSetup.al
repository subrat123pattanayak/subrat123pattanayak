namespace BC.BC;

using Microsoft.Sales.Setup;

pageextension 50101 SalesSetup extends "Sales & Receivables Setup"
{
    layout
    {
        movefirst(General; "Default Price List Code")
    }
}
