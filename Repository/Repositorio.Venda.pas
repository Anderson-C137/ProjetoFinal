unit Repositorio.Venda;

interface

uses
  Repositorio,
  Modelo.Venda,
  DataModulePrincipal,
  FireDAC.Comp.Client,
  Generics.Collections;

type
  TRepositorioVenda = class(TInterfacedObject, IRepositorio<TVenda>)
  private
    FTabela: TFDTable;
    FTabelaGrid: TFDQuery;
  public
    constructor Create;
    procedure Salvar(Venda: TVenda);
    procedure Excluir(Id: Integer);
    function ObterTodos: TObjectList<TVenda>;

    property TabelaGrid: TFDQuery read FTabelaGrid;
  end;

implementation

uses
  System.SysUtils;

{ TRepositorioVenda }

constructor TRepositorioVenda.Create;
begin
  FTabela := dtmPrincipal.fdTableVenda;
  FTabelaGrid := dtmPrincipal.fdQueryVenda;
end;

procedure TRepositorioVenda.Salvar(Venda: TVenda);
begin
  if Venda.Id = 0 then
  begin
    FTabela.Append;
    FTabela.FieldByName('idproduto').AsInteger := Venda.Produto.Id;
    FTabela.FieldByName('idcliente').AsInteger := Venda.Cliente.Id;
    FTabela.FieldByName('quantidade').AsInteger := Venda.Quantidade;
    FTabela.Post;

    Venda.Id := FTabela.FieldByName('id').AsInteger;
  end
  else if FTabela.Locate('Id', Venda.Id, []) then
  begin
    FTabela.Edit;
    FTabela.FieldByName('idproduto').AsInteger := Venda.Produto.Id;
    FTabela.FieldByName('idcliente').AsInteger := Venda.Cliente.Id;
    FTabela.FieldByName('quantidade').AsInteger := Venda.Quantidade;
    FTabela.Post;
  end;

  FTabelaGrid.Refresh;
end;

procedure TRepositorioVenda.Excluir(Id: Integer);
begin
  if FTabela.Locate('Id', Id, []) then
  begin
    FTabela.Delete;
  end;

  FTabelaGrid.Refresh;
end;

function TRepositorioVenda.ObterTodos: TObjectList<TVenda>;
begin
  raise ENotImplemented.Create('Método ObterTodos ainda não foi implementado');
end;

end.
