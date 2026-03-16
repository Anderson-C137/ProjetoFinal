unit TelaProduto;

interface

uses
  Repositorio.Produto,
  Modelo.Produto,
  TelaProdutoCadastro,
  DataModulePrincipal,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls,
  Datasnap.DBClient;

type
  TfrmTelaProduto = class(TForm)
    pnlMenu: TPanel;
    btnAdicionar: TButton;
    btnEditar: TButton;
    btnRemover: TButton;
    pnlPrincipal: TPanel;
    grdProdutos: TDBGrid;
    dtsProdutos: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FRepositorio: TRepositorioProduto;

    procedure AdicionarProduto(Nome: string; Preco: double);
    procedure EditarProduto(NovoNome: string; NovoPreco: double);
    procedure ExcluirProduto;
  public
    { Public declarations }
  end;

var
  frmTelaProduto: TfrmTelaProduto;

implementation

{$R *.dfm}

procedure TfrmTelaProduto.FormCreate(Sender: TObject);
begin
  FRepositorio := TRepositorioProduto.Create;
  dtsProdutos.DataSet := FRepositorio.TabelaGrid;
end;

procedure TfrmTelaProduto.FormDestroy(Sender: TObject);
begin
  FRepositorio.Free;
end;

procedure TfrmTelaProduto.btnAdicionarClick(Sender: TObject);
begin
  frmTelaProdutoCadastro := TfrmTelaProdutoCadastro.Create(Self);
  try
    if frmTelaProdutoCadastro.ShowModal = mrOK then
      AdicionarProduto(
        frmTelaProdutoCadastro.edtNome.Text,
        StrToFloatDef(frmTelaProdutoCadastro.edtPreco.Text, 0));
  finally
    frmTelaProdutoCadastro.Free;
  end;
end;

procedure TfrmTelaProduto.AdicionarProduto(Nome: string; Preco: double);
begin
  var Produto := TProduto.Create;

  // Atualiza o objeto
  Produto.Nome := Nome;
  Produto.Preco := Preco;

  // Adiciona ao banco de dados
  FRepositorio.Salvar(Produto);
end;

procedure TfrmTelaProduto.btnEditarClick(Sender: TObject);
begin
  frmTelaProdutoCadastro := TfrmTelaProdutoCadastro.Create(Self);
  try
    frmTelaProdutoCadastro.edtNome.Text := dtsProdutos.DataSet.FieldByName('Nome').AsString;
    frmTelaProdutoCadastro.edtPreco.Text := dtsProdutos.DataSet.FieldByName('Preco').AsString;

    if frmTelaProdutoCadastro.ShowModal = mrOK then
      EditarProduto(
        frmTelaProdutoCadastro.edtNome.Text,
        StrToFloatDef(frmTelaProdutoCadastro.edtPreco.Text, 0));
  finally
    frmTelaProdutoCadastro.Free;
  end;
end;

procedure TfrmTelaProduto.EditarProduto(NovoNome: string; NovoPreco: double);
begin
  if not dtsProdutos.DataSet.IsEmpty then
  begin
    // Cria um novo objeto e preenche seu Id
    var Produto := TProduto.Create;
    Produto.Id := dtsProdutos.DataSet.FieldByName('Id').AsInteger;

    // Atualiza o objeto
    Produto.Nome := NovoNome;
    Produto.Preco := NovoPreco;

    // Atualiza o banco de dados
    FRepositorio.Salvar(Produto);
  end;
end;

procedure TfrmTelaProduto.btnRemoverClick(Sender: TObject);
begin
  ExcluirProduto;
end;

procedure TfrmTelaProduto.ExcluirProduto;
begin
  if not dtsProdutos.DataSet.IsEmpty then
  begin
    // Remove do banco de dados
    FRepositorio.Excluir(dtsProdutos.DataSet.FieldByName('Id').AsInteger);
  end;
end;

end.
