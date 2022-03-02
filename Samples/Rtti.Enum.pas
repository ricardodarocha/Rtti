unit Rtti.Enum;

interface
  uses
    Rtti, TypInfo, SysUtils;

type
  TRttiEnum = class
    class function Ordinal(APointer: Pointer; AValue: string): Integer; overload;
    class function Ordinal(AField: TRttiField; AModel: TObject): Integer; overload;

    class function Value(APointer: Pointer; AValue: string): string; overload;
    class function Value(APointer: Pointer; AValue: Integer): string; overload;
    class function Value(AField: TRttiField; AModel: TObject): string; overload;

    class function AsTValue(AField: TRttiField; AValue: Integer): TValue;
    class procedure Iterate(AField: TRttiField; AProcedure: TProc<Integer>);
  end;

implementation

{ TRttiEnum }

class procedure TRttiEnum.Iterate(AField: TRttiField; AProcedure: TProc<Integer>);
var
  I: Integer;
begin
   For I := GetTypeData(AField.FieldType.Handle).MinValue to GetTypeData(AField.FieldType.Handle).MaxValue do
    AProcedure(I);

   {Exemplo


   TRttiEnum.Iterate(AField,
    procedure (Codigo: Integer)
      begin
        Combobox1.lines.add(
          TRttiEnum.Value(AField, Codigo))
      end);
   }
end;

class function TRttiEnum.Ordinal(AField: TRttiField; AModel: TObject): Integer;
begin
  Result := Ordinal(AField.FieldType.Handle, AField.GetValue(AModel).ToString);
end;

class function TRttiEnum.AsTValue(AField: TRttiField; AValue: Integer): TValue;
begin
  Result := TValue.FromOrdinal(AField.FieldType.Handle, AValue);
end;

class function TRttiEnum.Ordinal(APointer: Pointer; AValue: string): Integer;
begin
  Result := Ord(getEnumValue(APointer, AValue));
end;

class function TRttiEnum.Value(AField: TRttiField; AModel: TObject): string;

begin
  Result := AField.GetValue(AModel).ToString;
end;

class function TRttiEnum.Value(APointer: Pointer; AValue: Integer): string;
begin
  Result := getEnumName(APointer, AValue);
end;


class function TRttiEnum.Value(APointer: Pointer; AValue: string): string;
begin
  Result := Value(APointer, Ordinal(APointer, AValue));
end;

end.
