unit Home;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Conta, Creditar, Debitar, ContaClass;

type
  TfHome = class(TForm)
    lHomeTitulo: TLabel;
    bCadastrarConta: TButton;
    bConsultarConta: TButton;
    bCreditar: TButton;
    bDebitar: TButton;
    procedure bCadastrarContaClick(Sender: TObject);
    procedure bConsultarContaClick(Sender: TObject);
    procedure bCreditarClick(Sender: TObject);
    procedure bDebitarClick(Sender: TObject);
  private
    { Private declarations }
  public
    contas: array of TConta;
  end;

var
  fHome: TfHome;


implementation

{$R *.dfm}

procedure TfHome.bCadastrarContaClick(Sender: TObject);
begin
  fHome.hide;
  fConta := TfConta.Create(self, false);
  fConta.ShowModal;
  fConta.free;
  fHome.show;
end;

procedure TfHome.bConsultarContaClick(Sender: TObject);
begin
  fHome.hide;
  fConta := TfConta.Create(self, true);
  fConta.ShowModal;
  fConta.free;
  fHome.show;
end;

procedure TfHome.bCreditarClick(Sender: TObject);
begin
  fHome.hide;
  fCreditar.ShowModal;
  fCreditar.free;
  fHome.show;
end;

procedure TfHome.bDebitarClick(Sender: TObject);
begin
  fHome.hide;
  fDebitar.ShowModal;
  fDebitar.free;
  fHome.show;
end;

end.
