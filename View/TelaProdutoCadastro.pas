unit TelaProdutoCadastro;

interface

uses
  DataModulePrincipal,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask;

type
  TfrmTelaProdutoCadastro = class(TForm)
    pnlPrincipal: TPanel;
    lblNome: TLabel;
    edtNome: TEdit;
    lblPreco: TLabel;
    pnlBotoes: TPanel;
    btnCancelar: TButton;
    btnOK: TButton;
    edtPreco: TEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    procedure Validar;
  public
    { Public declarations }
  end;

var
  frmTelaProdutoCadastro: TfrmTelaProdutoCadastro;

implementation

{$R *.dfm}

procedure TfrmTelaProdutoCadastro.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmTelaProdutoCadastro.btnOKClick(Sender: TObject);
begin
  Validar;
  ModalResult := mrOK;
end;

procedure TfrmTelaProdutoCadastro.Validar;
begin
  try
    if (edtNome.Text = '') then
      raise Exception.Create('Nome não preenchido');

    if (StrToFloatDef(edtPreco.Text, 0) = 0) then
      raise Exception.Create('Preço não preenchido');
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      Abort;
    end;
  end;
end;

end.
