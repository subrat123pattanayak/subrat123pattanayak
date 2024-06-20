// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.BC24;

using Microsoft.Sales.Customer;
using Microsoft.Finance.GeneralLedger.Ledger;
using System.Utilities;

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        Query_Cust: Query "G/L Entries";
        OutStrem: OutStream;
        InStrem: InStream;
        Separator: Text[1];
        TempBlob: Codeunit "Temp Blob";
        Filename: Text;
        CsvData: Text;
        CsvDataValue: List of [Text];
        JsonObj: JsonObject;
        JsonArray: JsonArray;
        ColumnNames: List of [Text];
        i: Integer;
        Dec: Decimal;
    begin
        Separator := ';';
        TempBlob.CreateOutStream(OutStrem);
        Query_Cust.SaveAsCsv(OutStrem, 1, Separator);
        TempBlob.CreateInStream(InStrem);
        InStrem.ReadText(CsvData);
        ColumnNames := CsvData.Split(Separator);
        while InStrem.ReadText(CsvData) > 0 do begin
            CsvDataValue := CsvData.Split(Separator);
            Clear(JsonObj);
            for i := 1 to CsvDataValue.Count do begin
                if Evaluate(Dec, CsvDataValue.Get(i)) then
                    JsonObj.Add(ColumnNames.Get(i), Dec)
                else
                    JsonObj.Add(ColumnNames.Get(i), CsvDataValue.Get(i));
            end;
            JsonArray.Add(JsonObj);
        end;
        Message('%1', Format(JsonArray));
    end;
}