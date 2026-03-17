unit TelaVenda;

interface

uses
  Generics.Collections,
  Modelo.Venda,
  Modelo.Cliente,
  Modelo.Produto,
  Repositorio.Venda,
  TelaVendaCadastro,
  DataModulePrincipal,
  TelaRelatorio,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls,
  Datasnap.DBClient;

type
  TfrmTelaVenda = class(TForm)
    pnlMenu: TPanel;
    btnAdicionar: TButton;
    btnEditar: TButton;
    btnRemover: TButton;
    pnlPrincipal: TPanel;
    grdVendas: TDBGrid;
    dtsVendas: TDataSource;
    btnRelatorio: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
  private
    { Private declarations }
    FRepositorio: TRepositorioVenda;

    procedure AdicionarVenda(Cliente: TCliente; Produto: TProduto; Quantidade: Integer);
    procedure EditarVenda(NovoCliente: TCliente; NovoProduto: TProduto; NovaQuantidade: Integer);
    procedure ExcluirVenda;
  public
    { Public declarations }
  end;

var
  frmTelaVenda: TfrmTelaVenda;

implementation

{$R *.dfm}

procedure TfrmTelaVenda.FormCreate(Sender: TObject);
begin
  FRepositorio := TRepositorioVenda.Create;
  dtsVendas.DataSet := FRepositorio.TabelaGrid;
end;

procedure TfrmTelaVenda.FormDestroy(Sender: TObject);
begin
  FRepositorio.Free;
end;

procedure TfrmTelaVenda.btnAdicionarClick(Sender: TObject);
begin
  frmTelaVendaCadastro := TfrmTelaVendaCadastro.Create(Self);
  try
    if frmTelaVendaCadastro.ShowModal = mrOK then
      AdicionarVenda(
        TCliente(frmTelaVendaCadastro.cbbCliente.Items.Objects[frmTelaVendaCadastro.cbbCliente.ItemIndex]),
        TProduto(frmTelaVendaCadastro.cbbProduto.Items.Objects[frmTelaVendaCadastro.cbbProduto.ItemIndex]),
        StrToIntDef(frmTelaVendaCadastro.edtQuantidade.Text, 0)
        );
  finally
    frmTelaVendaCadastro.Free;
  end;
end;

procedure TfrmTelaVenda.AdicionarVenda(Cliente: TCliente; Produto: TProduto; Quantidade: Integer);
begin
  var Venda := TVenda.Create;

  // Atualiza o objeto
  Venda.Cliente := Cliente;
  Venda.Produto := Produto;
  Venda.Quantidade := Quantidade;

  // Adiciona ao banco de dados
  FRepositorio.Salvar(Venda);
end;

procedure TfrmTelaVenda.btnEditarClick(Sender: TObject);
begin
  frmTelaVendaCadastro := TfrmTelaVendaCadastro.Create(Self);
  try
    for var i := 0 to frmTelaVendaCadastro.cbbCliente.Items.Count - 1 do
      if TCliente(frmTelaVendaCadastro.cbbCliente.Items.Objects[i]).Id = dtsVendas.DataSet.FieldByName('IdCliente').AsInteger then
      begin
        frmTelaVendaCadastro.cbbCliente.ItemIndex := i;
        Break;
      end;

    for var i := 0 to frmTelaVendaCadastro.cbbProduto.Items.Count - 1 do
      if TProduto(frmTelaVendaCadastro.cbbProduto.Items.Objects[i]).Id = dtsVendas.DataSet.FieldByName('IdProduto').AsInteger then
      begin
        frmTelaVendaCadastro.cbbProduto.ItemIndex := i;
        Break;
      end;

    frmTelaVendaCadastro.edtQuantidade.Text := dtsVendas.DataSet.FieldByName('quantidade').AsString;

    if frmTelaVendaCadastro.ShowModal = mrOK then
      EditarVenda(
        TCliente(frmTelaVendaCadastro.cbbCliente.Items.Objects[frmTelaVendaCadastro.cbbCliente.ItemIndex]),
        TProduto(frmTelaVendaCadastro.cbbProduto.Items.Objects[frmTelaVendaCadastro.cbbProduto.ItemIndex]),
        StrToIntDef(frmTelaVendaCadastro.edtQuantidade.Text, 0)
        );
  finally
    frmTelaVendaCadastro.Free;
  end;
end;

procedure TfrmTelaVenda.EditarVenda(NovoCliente: TCliente; NovoProduto: TProduto; NovaQuantidade: Integer);
begin
  if not dtsVendas.DataSet.IsEmpty then
  begin
    // Cria um novo objeto e preenche seu Id
    var Venda := TVenda.Create;
    venda.Id := dtsVendas.DataSet.FieldByName('Id').AsInteger;

    // Atualiza o objeto
    Venda.Cliente := NovoCliente;
    Venda.Produto := NovoProduto;
    Venda.Quantidade := NovaQuantidade;

    // Atualiza o banco de dados
    FRepositorio.Salvar(Venda);
  end;
end;

procedure TfrmTelaVenda.btnRelatorioClick(Sender: TObject);
begin
frmTelaRelatorio := TfrmTelaRelatorio.create(self);
try
  frmTelaRElatorio.RLReport.Preview();
finally
  frmTelaRelatorio.free;
end;


end;

procedure TfrmTelaVenda.btnRemoverClick(Sender: TObject);
begin
  ExcluirVenda;
end;

procedure TfrmTelaVenda.ExcluirVenda;
begin
  if not dtsVendas.DataSet.IsEmpty then
  begin
    // Remove do banco de dados
    FRepositorio.Excluir(dtsVendas.DataSet.FieldByName('Id').AsInteger);
  end;
end;

end.
