// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.BC24;

using Microsoft.Sales.Customer;
using System.Utilities;

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        Query_Cust: Query "My Customers";
        OutStrem: OutStream;
        InStrem: InStream;
        Separator: Text[1];
        TempBlob: Codeunit "Temp Blob";
        Filename: Text;
        lineNo: Text;
        JsonObj: JsonObject;
        JsonArray: JsonArray;

    begin
        Separator := ';';
        TempBlob.CreateOutStream(OutStrem);
        Query_Cust.SaveAsCsv(OutStrem, 1, Separator);
        TempBlob.CreateInStream(InStrem);
        Filename := 'TestData.csv';
        //DownloadFromStream(InStrem, '', '', '', Filename);
        lineNo.Split(InStrem);
    end;
}