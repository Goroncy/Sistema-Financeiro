unit Debitar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ContaClass;

type
  TfDebitar = class(TForm)
    lConta: TLabel;
    lCredito: TLabel;
    bVoltar: TButton;
    bDebitar: TButton;
    editConta: TEdit;
    editDebito: TEdit;
    procedure bVoltarClick(Sender: TObject);
    procedure editDebitoKeyPress(Sender: TObject; var Key: Char);
    procedure bDebitarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fDebitar: TfDebitar;

implementation

{$R *.dfm}

uses
Home;

procedure TfDebitar.bDebitarClick(Sender: TObject);
begin
  if editConta.text = '' then
    showmessage('Informe um código de conta.')
  else if (StrToInt(editConta.text) >= length(fHome.contas) + 1) then
    showmessage('Código inválido.')
  else if editConta.text <> '' then
    begin
      fhome.contas[StrToInt(editConta.text) - 1].Debitar(StrToFloat(editDebito.text));
    showmessage('Foi debitado R$ '+ editDebito.text + ' deixando seu saldo atual com R$ ' + FloatToStr(fhome.contas[StrToInt(editConta.text) - 1].saldo));
    end
end;

procedure TfDebitar.bVoltarClick(Sender: TObject);
begin
  fDebitar.close;
end;

procedure TfDebitar.editDebitoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',',',#8,#10]) then
    key := #0;
end;

end.
