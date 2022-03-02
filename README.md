# RttiInterceptor

**TRttiInterceptor** is a single way to intercept Rtti Fields and Props.
It will iterate trought all fields and properties of any `TObject` without creating rtti context.


`/Samples` has a small demonstration of the Interceptor Power.
In Sample1 we Map any TObject with many primitive type fields, using TValueListEditor as User Interface.
![](RttiDemo1.PNG)

## Usage

First you need to create a Class to represent your Model

```Delphi
  TOrder = class
    Id          : SERIAL;
    CustomerId  : VARCHAR;
    EmployeeId  : Integer;
    OrderDate   : TIMESTAMP;
    Freight     : Currency;
  end;
```

Then you can extract run time type information using RTTI. 
To Map all fields with values using Memo it's an example

```Delphi

uses RttiInterceptor;

procedure Button1Click(Sender: TObject);
begin
  TRttiInterceptor<TOrder>.MapField(
    procedure (AField: TRttiField)
    begin
      Memo1.Lines.Add(format('%-20s %s', [AField.Name, AField.FieldType.ToString]));
    end);
end;
```
