unit Modelo.Produto;

interface

type
  TProduto = class
  private
    FId: Integer;
    FNome: string;
    FPreco: double;
  public
    property Id: Integer read FId write FId;
    property Nome: string read FNome write FNome;
    property Preco: double read FPreco write FPreco;
  end;

implementation

end.
