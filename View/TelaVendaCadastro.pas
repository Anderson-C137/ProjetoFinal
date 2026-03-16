unit TelaVendaCadastro;

interface

uses
  Repositorio,
  Modelo.Produto,
  DataModulePrincipal,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmTelaVendaCadastro = class(TForm)
    pnlPrincipal: TPanel;
    lblCliente: TLabel;
    lblProduto: TLabel;
    pnlBotoes: TPanel;
    btnCancelar: TButton;
    btnOK: TButton;
    cbbCliente: TComboBox;
    cbbProduto: TComboBox;
    lblQuantidade: TLabel;
    edtQuantidade: TEdit;
    lblTotal: TLabel;
    lblResultado: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtQuantidadeChange(Sender: TObject);
  private
    { Private declarations }
    procedure Validar;
    procedure CarregarClientes;
    procedure CarregarProdutos;
  public
    { Public declarations }
  end;

var
  frmTelaVendaCadastro: TfrmTelaVendaCadastro;

implementation

{$R *.dfm}

uses
  Repositorio.Produto,
  Repositorio.Cliente;

procedure TfrmTelaVendaCadastro.CarregarClientes;
begin
  cbbCliente.Clear;

  var repositorioCliente := TRepositorioCliente.Create;
  var clientes := repositorioCliente.ObterTodos;

  for var I := 0 to clientes.Count - 1 do
  begin
    var cliente := clientes[I];
    cbbCliente.AddItem(I.ToString + ' - ' + cliente.Nome, cliente);
  end;
end;

procedure TfrmTelaVendaCadastro.CarregarProdutos;
begin
  cbbProduto.Clear;

  var repositorioProduto := TRepositorioProduto.Create;
  var produtos := repositorioProduto.ObterTodos;

  for var I := 0 to produtos.Count - 1 do
  begin
    var produto := produtos[I];
    cbbProduto.AddItem(I.ToString + ' - ' + produto.Nome, produto);
  end;
end;

procedure TfrmTelaVendaCadastro.FormCreate(Sender: TObject);
begin
  CarregarClientes;
  CarregarProdutos;
end;

procedure TfrmTelaVendaCadastro.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmTelaVendaCadastro.btnOKClick(Sender: TObject);
begin
  Validar;
  ModalResult := mrOK;
end;

procedure TfrmTelaVendaCadastro.edtQuantidadeChange(Sender: TObject);
begin
  var produto := TProduto(frmTelaVendaCadastro.cbbProduto.Items.Objects[frmTelaVendaCadastro.cbbProduto.ItemIndex]);
  var total := produto.Preco * StrToIntDef(edtQuantidade.Text, 0);
  lblResultado.Caption := FormatFloat('R$ 0.00', total);
end;

procedure TfrmTelaVendaCadastro.Validar;
begin
  try
    if (cbbCliente.ItemIndex < 0) then
      raise Exception.Create('Cliente não preenchido');

    if (cbbProduto.ItemIndex < 0) then
      raise Exception.Create('Produto não preenchido');

    if (StrToFloatDef(edtQuantidade.Text, 0) = 0) then
      raise Exception.Create('Quantidade não preenchido');
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      Abort;
    end;
  end;
end;

end.
