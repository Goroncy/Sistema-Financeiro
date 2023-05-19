unit Conta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, ContaClass,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  TfConta = class(TForm)
    lCPF: TLabel;
    lTipoPessoa: TLabel;
    lSaldo: TLabel;
    editNome: TEdit;
    bVoltar: TButton;
    editRG: TEdit;
    editSaldo: TEdit;
    bSalvarCadastro: TButton;
    lNumConta: TLabel;
    editNumConta: TEdit;
    lRG: TLabel;
    editCPFJ: TMaskEdit;
    lNome: TLabel;
    bConsultar: TButton;
    cbTipoPessoa: TComboBox;
    bDelete: TButton;
    bUpdate: TButton;
    bSalvarUpdate: TButton;
    procedure bVoltarClick(Sender: TObject);
    procedure cbTipoPessoaChange(Sender: TObject);
    procedure bSalvarCadastroClick(Sender: TObject);
    procedure bConsultarClick(Sender: TObject);
    procedure editSaldoKeyPress(Sender: TObject; var Key: Char);
    procedure preencheCampos(Conta: TConta);
    procedure bDeleteClick(Sender: TObject);
    procedure bUpdateClick(Sender: TObject);
    procedure bSalvarUpdateClick(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent;  Consultar: Boolean);
  end;

var
  fConta: TfConta;

implementation

uses
  Home;

{$R *.dfm}

procedure TfConta.bDeleteClick(Sender: TObject);
begin
    if editNumConta.text = '' then
      showmessage('Informe um código de conta.')
    else if (StrToInt(editNumConta.text) >= length(fHome.contas) + 1) then
      showmessage('Código inválido.')
    else if (editNumConta.text <> '') or ((StrToInt(editNumConta.text)) > (length(fHome.contas) - 1)) then
      begin
        preencheCampos(fHome.contas[strToInt(editNumConta.text) - 1]);
        fHome.contas[StrToInt(editNumConta.text)-1].nome:= '';
        fHome.contas[StrToInt(editNumConta.text)-1].cpfj:= '';
        fHome.contas[StrToInt(editNumConta.text)-1].rg:= '';
        fHome.contas[StrToInt(editNumConta.text)-1].saldo:= 0;
        fHome.contas[StrToInt(editNumConta.text)-1].tipoPessoa:= '';
        showmessage('Conta deleteada com sucesso.');
        preencheCampos(fHome.contas[strToInt(editNumConta.text) - 1]);
      end;
end;

procedure TfConta.bSalvarCadastroClick(Sender: TObject);
var
Conta : TConta;
begin
  Conta := TConta.create(
    editNome.Text,
    editCPFJ.Text,
    editRG.Text,
    cbTipoPessoa.Text,
    StrToFloat(editSaldo.text));

  SetLength(fHome.contas, length(fHome.contas)+1);
  fHome.contas[length(fHome.contas) - 1 ] := Conta;
  showmessage('Conta cadastrada com sucesso.');
end;

procedure TfConta.bSalvarUpdateClick(Sender: TObject);
var
  Conta: TConta;
begin
    Conta := TConta.create(
      editNome.Text,
      editCPFJ.Text,
      editRG.Text,
      cbTipoPessoa.Text,
      StrToFloat(editSaldo.text));
    fHome.contas[length(fHome.contas) - 1 ] := Conta;
    showmessage('Cadastro alterado com sucesso.');
end;

procedure TfConta.bUpdateClick(Sender: TObject);
begin
     if editNumConta.text = '' then
        showmessage('Informe um código de conta.')
      else if (StrToInt(editNumConta.text) >= length(fHome.contas) + 1) then
        showmessage('Código inválido.')
    else if (editNumConta.text <> '') or ((StrToInt(editNumConta.text)) > (length(fHome.contas) - 1)) then
    begin
      preencheCampos(fHome.contas[strToInt(editNumConta.text) - 1]);
      bSalvarCadastro.visible:= False;
      bSalvarUpdate.Visible:=True;
      editNumConta.enabled:= false;
      editNome.ReadOnly:= false;
      editCPFJ.enabled:= False;
      editRG.enabled:= false;
      editSaldo.enabled:= false;
      showmessage('Liberado campos permitidos para alteração.');
    end;
end;

procedure TfConta.bConsultarClick(Sender: TObject);
begin
      if editNumConta.text = '' then
        showmessage('Informe um código de conta.')
      else if (StrToInt(editNumConta.text) >= length(fHome.contas) + 1) then
        showmessage('Código inválido.')
      else
        bSalvarUpdate.visible:=false;
        editNome.ReadOnly:= true;
        editCPFJ.ReadOnly:= true;
        editCPFJ.Enabled:= true;
        editRG.Enabled:=true;
        editRG.Readonly:=true;
        editsaldo.Enabled:=true;
        editSaldo.ReadOnly:=true;
        preencheCampos(fHome.contas[strToInt(editNumConta.text) - 1]);
end;

procedure TfConta.preencheCampos(Conta: TConta);
begin
    editNome.text:= Conta.nome;
    editCPFJ.text:= Conta.cpfj;
    editRG.text:= Conta.RG;
    cbTipoPessoa.text:= Conta.tipoPessoa;
    editSaldo.text:= FloatToStr(Conta.saldo);
end;

procedure TfConta.bVoltarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfConta.cbTipoPessoaChange(Sender: TObject);
begin
  if cbTipoPessoa.ItemIndex = 0 then
    editCPFJ.EditMask := '000.000.000-00;1;_'
  else
    editCPFJ.EditMask := '00.000.000/0000-00;1;_';

end;

constructor TfConta.Create(AOwner: TComponent;  Consultar: Boolean);
begin
  inherited Create(AOwner);
    if Consultar = false then
    begin
      editNumConta.text:= IntToStr(length(fHome.contas)+1);
    end;
  bConsultar.Visible := Consultar;
  editNumConta.ReadOnly:= NOT Consultar;
  bSalvarCadastro.Visible :=  not Consultar;
  bSalvarUpdate.Visible:= False;
  editNome.ReadOnly:=  Consultar;
  editCPFJ.ReadOnly:=  Consultar;
  editRG.ReadOnly:=  Consultar;
  editSaldo.ReadOnly:=  Consultar;
  cbTipoPessoa.Enabled:= not Consultar;
  bUpdate.Visible:= Consultar;
  bDelete.Visible:= Consultar;
end;

procedure TfConta.editSaldoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',',',#8,#10]) then
    key := #0;
end;

end.

