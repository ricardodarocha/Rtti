unit RttiExtrator.Demo1;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  SysUtils,
  Variants,
  Classes,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Grids,
  Vcl.ValEdit;

type
  TfrmRttiExtrator1 = class(TForm)
    Memo1: TMemo;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    bRead: TButton;
    ValueListEditor1: TValueListEditor;
    Button3: TButton;
    ComboBox1: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BtnRead(Sender: TObject);
    procedure Button3Click(Sender: TObject);

  public
    { Public declarations }
  end;

var
  frmRttiExtrator1: TfrmRttiExtrator1;

implementation

  uses Models, RttiInterceptor, Rtti.Enum, Rtti, Typinfo;

{$R *.dfm}

function ValueFromString(Kind: TTypeKind; Value: String): TValue;
begin
  case Kind of
    tkInteger: Result := TValue.FromVariant(StrToIntDef(Value, 0));

    tkInt64: Result := TValue.FromVariant(StrToInt64Def(Value, 0));

    tkFloat: Result := TValue.FromVariant(StrToFloatDef(Value, 3.1415901));

    tkLString,
    tkWString,
    tkUString,
    tkString: Result := TValue.FromVariant(Value);

    tkVariant: Result := TValue.FromVariant(Value);

    tkClass: Result := '(Class)';
    tkMethod: Result := '(Method)';
    tkProcedure: Result := '(Procedure)';

    tkMRecord,
    tkRecord: Result := '(Record)';

    tkDynArray,
    tkArray: Result := '(Array)';

    tkInterface: Result := '(Interface)';
    tkClassRef: Result := '(Interface)';
    tkPointer: Result := '(Pointer)';

    {tkEnumeration: Result := TValue.FromVariant(StrToIntDef(Value, 0));}
    tkSet: TValue.FromVariant(StrToIntDef(Value, 0));
  end;

end;

procedure TfrmRttiExtrator1.Button1Click(Sender: TObject);

  var
    Model: TOrder;

begin
  Model := TOrder.Create;
  try
    Memo1.Clear;
    ValueListEditor1.Strings.Clear;
    TRttiInterceptor<TOrder>.MapField(procedure (AField: TRttiField)
    begin
      Memo1.Lines.Add(format('%-20s %s', [AField.Name, AField.FieldType.ToString]));
    end);

  finally
    FreeAndNil(Model);
  end;

end;

procedure TfrmRttiExtrator1.Button2Click(Sender: TObject);
var
  RowIndex: Integer;
  Value: TValue;
  Model: TOrder;
begin
  Model := TOrder.Create;
  try
    Memo1.Lines.Add('-------------  s e t  v a l u e  -------------');
    TRttiInterceptor<TOrder>.MapField(procedure (AField: TRttiField)
    begin
      if not (ValueListEditor1.FindRow(AField.Name, RowIndex)) then
        Exit;

      case AField.FieldType.TypeKind of
        tkClass,
        tkMethod,
        tkProcedure,
        tkMRecord,
        tkRecord,
        tkDynArray,
        tkArray,
        tkInterface,
        tkClassRef,
        tkPointer: Exit;
      end;

      if AField.FieldType.TypeKind = tkEnumeration then
        Value := TRttiEnum.AsTValue(Afield, StrToIntDef(ValueListEditor1.Values[AField.Name], 0))
      else
        Value := ValueFromString(AField.FieldType.TypeKind, ValueListEditor1.Values[AField.Name]);

      AField.SetValue(Model, Value);
      Memo1.Lines.Add(format('%-20s %s', [AField.Name, Value.ToString]));
    end);

  finally
    FreeAndNil(Model);
  end;

end;

procedure TfrmRttiExtrator1.Button3Click(Sender: TObject);
var
  Model: TOrder;
begin
  Model := TOrder.Create;
  try
    ComboBox1.Clear;

    TRttiInterceptor<TOrder>.MapField(procedure (AField: TRttiField)
      begin

          if AField.FieldType.TypeKind = tkEnumeration then
          TRttiEnum.Iterate(AField, procedure (Codigo: Integer)
          begin
            ComboBox1.Items.Add(TRttiEnum.Value(AField.FieldType.Handle, Codigo));
          end);

      end);

  finally
    FreeAndNil(Model);
  end;
end;

procedure TfrmRttiExtrator1.BtnRead(Sender: TObject);
var
  Value: string;
  Model: TOrder;
begin
  Model := TOrder.Create;
  try
    ValueListEditor1.Strings.Clear;
    Memo1.Lines.Add('-------------  r e a d i n g  -------------');
    TRttiInterceptor<TOrder>.MapField(procedure (AField: TRttiField)
    begin
      if AField.FieldType.TypeKind = tkEnumeration then
        Value := TRttiEnum.Ordinal(AField.FieldType.Handle, AField.GetValue(Model).ToString).ToString
      else
        Value := AField.GetValue(Model).ToString;

      ValueListEditor1.InsertRow(AField.Name, Value, True);
      Memo1.Lines.Add(format('%-20s %s', [AField.Name, AField.GetValue(Model).ToString]));
    end);

  finally
    FreeAndNil(Model);
  end;

end;

end.
