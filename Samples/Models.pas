unit Models;

//Based in Microsoft Northwind Database Sample

interface

type

  SERIAL = type Integer;
  //SERIAL IS THE AUTOINCREMENT TYPE IN POSTGRES

  VARCHAR = type String;
  TIMESTAMP = type TDate;

  TOrderStatus = (oNew, oProcessed, oCanceled);

  TOrder = class
    Id          : SERIAL;
    CustomerId  : VARCHAR;
    EmployeeId  : Integer;
    OrderDate   : TIMESTAMP;
    Freight     : Currency;
    Status      : TOrderStatus;
  end;

implementation

end.
