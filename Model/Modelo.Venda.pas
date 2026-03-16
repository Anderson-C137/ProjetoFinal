unit Modelo.Venda;

interface

uses
  Modelo.Cliente,
  Modelo.Produto;

type
  TVenda = class
  private
    FId: Integer;
    FCliente: TCliente;
    FProduto: TProduto;
    FQuantidade: Integer;
    function GetTotal: double;
  public
    property Id: Integer read FId write FId;
    property Cliente: TCliente read FCliente write FCliente;
    property Produto: TProduto read FProduto write FProduto;
    property Quantidade: Integer read FQuantidade write FQuantidade;
    property Total: double read GetTotal;
  end;

implementation

{ TVenda }

function TVenda.GetTotal: double;
begin
  Result := FProduto.Preco * FQuantidade;
end;

end.
