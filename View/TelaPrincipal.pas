unit TelaPrincipal;

interface

uses
  Repositorio,
  TelaCliente,
  TelaProduto,
  TelaVenda,
  DataModulePrincipal,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmTelaPrincipal = class(TForm)
    pnlMenu: TPanel;
    pnlPrincipal: TPanel;
    btnClientes: TButton;
    btnProdutos: TButton;
    btnVendas: TButton;
    procedure btnClientesClick(Sender: TObject);
    procedure btnProdutosClick(Sender: TObject);
    procedure btnVendasClick(Sender: TObject);
  private
    { Private declarations }
    procedure ExibirTelaClientes;
    procedure ExibirTelaProdutos;
    procedure ExibirTelaVendas;
  public
    { Public declarations }
  end;

var
  frmTelaPrincipal: TfrmTelaPrincipal;

implementation

{$R *.dfm}

procedure TfrmTelaPrincipal.btnClientesClick(Sender: TObject);
begin
  ExibirTelaClientes;
end;

procedure TfrmTelaPrincipal.ExibirTelaClientes;
begin
  frmTelaCliente := TfrmTelaCliente.Create(Self);
  try
    frmTelaCliente.ShowModal;
  finally
    frmTelaCliente.Free;
  end;
end;

procedure TfrmTelaPrincipal.btnProdutosClick(Sender: TObject);
begin
  ExibirTelaProdutos;
end;

procedure TfrmTelaPrincipal.ExibirTelaProdutos;
begin
  frmTelaProduto := TfrmTelaProduto.Create(Self);
  try
    frmTelaProduto.ShowModal;
  finally
    frmTelaProduto.Free;
  end;
end;

procedure TfrmTelaPrincipal.btnVendasClick(Sender: TObject);
begin
  ExibirTelaVendas;
end;

procedure TfrmTelaPrincipal.ExibirTelaVendas;
begin
  frmTelaVenda := TfrmTelaVenda.Create(Self);
  try
    frmTelaVenda.ShowModal;
  finally
    frmTelaVenda.Free;
  end;
end;

end.
