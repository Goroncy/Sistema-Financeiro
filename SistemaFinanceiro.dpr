program SistemaFinanceiro;

uses
  Vcl.Forms,
  Home in 'Home.pas' {fHome},
  Creditar in 'Creditar.pas' {fCreditar},
  Conta in 'Conta.pas' {fConta},
  Debitar in 'Debitar.pas' {fDebitar},
  ContaClass in 'ContaClass.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfHome, fHome);
  Application.CreateForm(TfCreditar, fCreditar);
  Application.CreateForm(TfConta, fConta);
  Application.CreateForm(TfDebitar, fDebitar);
  Application.Run;
end.
