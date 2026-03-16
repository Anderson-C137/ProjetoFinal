unit Repositorio.Cliente;

interface

uses
  System.Classes,
  Data.DB,
  Repositorio,
  Modelo.Cliente,
  DataModulePrincipal,
  FireDAC.Comp.Client,
  Generics.Collections;



type
  TRepositorioCliente = class(TInterfacedObject, IRepositorio<TCliente>)
  private
    FTabela: TFDTable;
  public
    constructor Create;
    procedure Salvar(cliente: TCliente);
    procedure Excluir(Id: Integer);
    function ObterTodos: TObjectList<TCliente>;

    property TabelaGrid: TFDTable read FTabela;
  end;

implementation

{ TRepositorioCliente }

constructor TRepositorioCliente.Create;
begin
  FTabela := dtmPrincipal.fdTableCliente;
end;

procedure TRepositorioCliente.Salvar(cliente: TCliente);
begin
  if cliente.Id = 0 then
  begin
    FTabela.Append;
    FTabela.FieldByName('nome').AsString := cliente.Nome;
    FTabela.FieldByName('cpf').AsString := cliente.CPF;
    FTabela.FieldByName('genero').AsString := cliente.Genero;
    FTabela.FieldByName('rua').AsString := cliente.Rua;
    FTabela.FieldByName('numero').AsString := cliente.Numero;
    FTabela.FieldByName('cidade').AsString := cliente.Cidade;
    FTabela.FieldByName('estado').AsString := cliente.Estado;
    FTabela.FieldByName('celular').AsString := cliente.Celular;
    FTabela.FieldByName('Email').AsString := cliente.Email;
    FTabela.FieldByName('idade').AsString := cliente.Idade;
    FTabela.FieldByName('datanascimento').AsDateTime := cliente.DataNascimento;
    TBlobField(FTabela.FieldByName('foto')).LoadFromStream(cliente.Foto);

    FTabela.Post;

    cliente.Id := FTabela.FieldByName('id').AsInteger;
  end
  else if FTabela.Locate('Id', cliente.Id, []) then
  begin
    FTabela.Edit;
    FTabela.FieldByName('nome').AsString := cliente.Nome;
    FTabela.FieldByName('cpf').AsString := cliente.CPF;
    FTabela.FieldByName('genero').AsString := cliente.Genero;
    FTabela.FieldByName('rua').AsString := cliente.Rua;
    FTabela.FieldByName('numero').AsString := cliente.Numero;
    FTabela.FieldByName('cidade').AsString := cliente.Cidade;
    FTabela.FieldByName('estado').AsString := cliente.Estado;
    FTabela.FieldByName('celular').AsString := cliente.Celular;
    FTabela.FieldByName('Email').AsString := cliente.Email;
    FTabela.FieldByName('idade').AsString := cliente.Idade;
    FTabela.FieldByName('datanascimento').AsDateTime := cliente.DataNascimento;
    TBlobField(FTabela.FieldByName('foto')).LoadFromStream(cliente.Foto);

    FTabela.Post;
  end;
end;

procedure TRepositorioCliente.Excluir(Id: Integer);
begin
  if FTabela.Locate('Id', Id, []) then
  begin
    FTabela.Delete;
  end;
end;

function TRepositorioCliente.ObterTodos: TObjectList<TCliente>;
begin
  Result := TObjectList<TCliente>.Create;

  FTabela.First;
  while not FTabela.Eof do
  begin
    var cliente := TCliente.Create;
    cliente.Id := FTabela.FieldByName('id').AsInteger;
    cliente.Nome := FTabela.FieldByName('nome').AsString;
    cliente.CPF := FTabela.FieldByName('cpf').AsString;
    cliente.Genero := FTabela.FieldByName('genero').AsString;
    cliente.Rua := FTabela.FieldByName('rua').AsString;
    cliente.Numero:= FTabela.FieldByName('numero').AsString;
    cliente.Cidade:= FTabela.FieldByName('cidade').AsString;
    cliente.Estado:= FTabela.FieldByName('estado').AsString;
    cliente.Celular:= FTabela.FieldByName('celular').AsString;
    cliente.Email:= FTabela.FieldByName('Email').AsString;
    cliente.Idade:= FTabela.FieldByName('idade').AsString;
    cliente.DataNascimento:= FTabela.FieldByName('datanascimento').AsDateTime;

     Result.Add(cliente);
    FTabela.Next;
  end;
end;

end.
