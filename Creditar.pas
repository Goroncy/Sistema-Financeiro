unit Creditar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ContaClass;

type
  TfCreditar = class(TForm)
    bVoltar: TButton;
    bCreditar: TButton;
    editConta: TEdit;
    lConta: TLabel;
    lCredito: TLabel;
    editCredito: TEdit;
    procedure bCreditarClick(Sender: TObject);
    procedure bVoltarClick(Sender: TObject);
    procedure editCreditarKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCreditar: TfCreditar;

implementation

{$R *.dfm}
uses
  Home;

procedure TfCreditar.bCreditarClick(Sender: TObject);
begin
    if editConta.text = '' then
      showmessage('Informe um código de conta.')
    else if (StrToInt(editConta.text) >= length(fHome.contas) + 1) then
      showmessage('Código inválido.')
    else if editConta.text <> '' then
      begin
        fhome.contas[StrToInt(editConta.text) - 1].Creditar(StrToFloat(editCredito.text));
        showmessage('O valor creditado na conta foi de R$ ' + editCredito.text + ' deixando seu saldo com o valor de R$ ' + FloatToStr(fhome.contas[StrToInt(editConta.text) - 1].saldo));
      end;
end;

procedure TfCreditar.bVoltarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfCreditar.editCreditarKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',',',#8,#10]) then
    key := #0;
end;

end.
