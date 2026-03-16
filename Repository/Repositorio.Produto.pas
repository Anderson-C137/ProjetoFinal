unit Repositorio.Produto;

interface

uses
  Repositorio,
  Modelo.Produto,
  DataModulePrincipal,
  FireDAC.Comp.Client,
  Generics.Collections;

type
  TRepositorioProduto = class(TInterfacedObject, IRepositorio<TProduto>)
  private
    FTabela: TFDTable;
  public
    constructor Create;
    procedure Salvar(produto: TProduto);
    procedure Excluir(Id: Integer);
    function ObterTodos: TObjectList<TProduto>;

    property TabelaGrid: TFDTable read FTabela;
  end;

implementation

{ TRepositorioProduto }

constructor TRepositorioProduto.Create;
begin
  FTabela := dtmPrincipal.fdTableProduto;
end;

procedure TRepositorioProduto.Salvar(produto: TProduto);
begin
  if produto.Id = 0 then
  begin
    FTabela.Append;
    FTabela.FieldByName('nome').AsString := produto.Nome;
    FTabela.FieldByName('preco').AsFloat := produto.Preco;
    FTabela.Post;

    produto.Id := FTabela.FieldByName('id').AsInteger;
  end
  else if FTabela.Locate('Id', produto.Id, []) then
  begin
    FTabela.Edit;
    FTabela.FieldByName('nome').AsString := produto.Nome;
    FTabela.FieldByName('preco').AsFloat := produto.Preco;
    FTabela.Post;
  end;
end;

procedure TRepositorioProduto.Excluir(Id: Integer);
begin
  if FTabela.Locate('Id', Id, []) then
  begin
    FTabela.Delete;
  end;
end;

function TRepositorioProduto.ObterTodos: TObjectList<TProduto>;
begin
  Result := TObjectList<TProduto>.Create;

  FTabela.First;
  while not FTabela.Eof do
  begin
    var produto := TProduto.Create;
    produto.Id := FTabela.FieldByName('id').AsInteger;
    produto.Nome := FTabela.FieldByName('nome').AsString;
    produto.preco := FTabela.FieldByName('preco').AsFloat;

    Result.Add(produto);
    FTabela.Next;
  end;
end;

end.
