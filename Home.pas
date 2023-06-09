unit Home;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Conta, Creditar, Debitar, ContaClass, Vcl.Menus;

type
  TfHome = class(TForm)
    MainMenu1: TMainMenu;
    Cadastrarconta1: TMenuItem;
    Cadastrarnovaconta1: TMenuItem;
    ContasCadastradas1: TMenuItem;
    Operaes1: TMenuItem;
    Creditarsaldoemconta1: TMenuItem;
    Debitarsaldoemconta1: TMenuItem;
    procedure menuCadastrarContaClick(Sender: TObject);
    procedure menuCreditarClick(Sender: TObject);
    procedure menuDebitarClick(Sender: TObject);
    procedure menuContasCadastradasClick(Sender: TObject);
  private
    { Private declarations }
  public
    contas: array of TConta;
  end;

var
  fHome: TfHome;


implementation

{$R *.dfm}

procedure TfHome.menuCreditarClick(Sender: TObject);
begin
  fHome.hide;
  fCreditar.ShowModal;
  fCreditar.free;
  fHome.show;
end;

procedure TfHome.menuDebitarClick(Sender: TObject);
begin
  fHome.hide;
  fDebitar.ShowModal;
  fDebitar.free;
  fHome.show;
end;

procedure TfHome.menuContasCadastradasClick(Sender: TObject);
begin
    fHome.hide;
    fConta := TfConta.Create(self, true);
    fConta.ShowModal;
    fConta.free;
    fHome.show;
end;

procedure TfHome.menuCadastrarContaClick(Sender: TObject);
begin
  fHome.hide;
  fConta := TfConta.Create(self, false);
  fConta.ShowModal;
  freeandnil(fConta);
  fHome.show;
end;

end.
