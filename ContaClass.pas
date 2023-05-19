unit ContaClass;

interface

type

  TConta = Class
  private
    pCodigoConta: String;
    pNome: String;
    pCPFJ: String;
    pRG: String;
    pTipoPessoa: String;
    pSaldo: Double;
    procedure SetCodigo(const Value: String);
    procedure SetNome(const Value: String);
    procedure SetCPFJ(const Value: String);
    procedure SetRG(const Value: String);
    procedure SetTipoPessoa(const Value: String);
    procedure SetSaldo(const Value: Double);

  public
    property codigo: String read pCodigoConta write SetCodigo;
    property nome: String read pNome write SetNome;
    property cpfj: String read pCPFJ write SetCPFJ;
    property tipoPessoa: String read pTipoPessoa write SetTipoPessoa;
    property saldo: Double read pSaldo write SetSaldo;
    property rg: string read pRG write SetRG;
    constructor create(nome: String; cpfj: String; RG: String; tipoPessoa: String; saldo: Double);
    function Debitar(Value : Double): Double;
    function Creditar(Value : Double): Double;
  End;

implementation

procedure TConta.SetCodigo(const Value: String);
begin
  pCodigoConta := Value;
end;

procedure TConta.SetNome(const Value: string);
begin
  pNome := Value;
end;

procedure TConta.SetCPFJ(const Value: string);
begin 
    pCPFJ := Value;
end;

procedure TConta.SetRG(const Value: string);
begin
  pRG := Value;
end;

procedure TConta.SetTipoPessoa(const Value: string);
begin
  pTipoPessoa := Value;
end;

procedure TConta.SetSaldo(const Value: Double);
begin
  pSaldo := Value;
end;

constructor TConta.create(nome: String; cpfj: String; RG: String; tipoPessoa: String; saldo: Double);
begin
  SetNome(nome);
  SetCPFJ(cpfj);
  SetRG(RG);
  SetTipoPessoa(tipoPessoa);
  SetSaldo(saldo);
end;

function TConta.Creditar(Value: Double): Double;
begin
  result := saldo + Value;
  SetSaldo(result);
end;

function TConta.Debitar(Value: Double): Double;
begin
  result := saldo - Value;
  SetSaldo(result);
end;

end.
