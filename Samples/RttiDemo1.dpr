program RttiDemo1;

uses
  Vcl.Forms,
  Models in 'Models.pas',
  RttiExtrator.Demo1 in 'RttiExtrator.Demo1.pas' {frmRttiExtrator1},
  RttiInterceptor in '..\RttiInterceptor.pas',
  Rtti.Enum in 'Rtti.Enum.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmRttiExtrator1, frmRttiExtrator1);
  Application.CreateForm(TfrmRttiExtrator1, frmRttiExtrator1);
  Application.Run;
end.
