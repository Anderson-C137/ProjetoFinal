unit TelaClienteCadastro;

interface

uses
  System.Net.HttpClient,
  System.Net.HttpClientComponent,
  System.JSON,
  System.DateUtils,
  JPEG,
  Modelo.cliente, ControllerCliente,
  DataModulePrincipal,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, REST.Types,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, Vcl.Menus;

type
  TfrmTelaClienteCadastro = class(TForm)
    pnlPrincipal: TPanel;
    lblNome: TLabel;
    edtNome: TEdit;
    lblCPF: TLabel;
    edtCPF: TEdit;
    pnlBotoes: TPanel;
    btnCancelar: TButton;
    btnOK: TButton;
    btnGerarPessoas: TButton;
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    imgFoto: TImage;
    Label1: TLabel;
    edtGenero: TEdit;
    lblGenero: TLabel;
    edtRua: TEdit;
    edtNumero: TEdit;
    lblRua: TLabel;
    lblNumero: TLabel;
    edtCidade: TEdit;
    lblCidade: TLabel;
    edtEstado: TEdit;
    lblEstado: TLabel;
    LblDataNascimento: TLabel;
    edtDataNascimento: TEdit;
    lblIdade: TLabel;
    edtIdade: TEdit;
    lblCelular: TLabel;
    edtCelular: TEdit;
    lblEmail: TLabel;
    edtEmail: TEdit;
    btnCarregarFoto: TButton;
    btnSalvarFoto: TButton;
    odlgFoto: TOpenDialog;
    sdlgFoto: TSaveDialog;
    PopupMenu: TPopupMenu;
    miLimpar: TMenuItem;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnGerarPessoasClick(Sender: TObject);
    procedure edtGeneroChange(Sender: TObject);
    procedure btnCarregarFotoClick(Sender: TObject);
    procedure btnSalvarFotoClick(Sender: TObject);
    procedure miLimparClick(Sender: TObject);
  private
    { Private declarations }
    procedure Validar;
  public
    { Public declarations }
  end;

var
  frmTelaClienteCadastro: TfrmTelaClienteCadastro;

implementation

{$R *.dfm}

procedure TfrmTelaClienteCadastro.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmTelaClienteCadastro.btnCarregarFotoClick(Sender: TObject);
begin
if odlgFoto.Execute then
  begin
    imgFoto.Picture.LoadFromFile(odlgFoto.FileName);
  end;
end;

procedure TfrmTelaClienteCadastro.btnGerarPessoasClick(Sender: TObject);
var
  Controller: TClienteController;
  Cliente: TCliente;

begin

 Controller := TClienteController.Create;

 Cliente := Controller.GerarPessoa(
               RESTClient,
               RESTRequest,
               RESTResponse
             );

  try

    edtNome.Text := Cliente.Nome;
    edtCPF.Text := Cliente.CPF;
    edtDataNascimento.Text := DateToStr(Cliente.DataNascimento);
    edtIdade.Text := Cliente.Idade;

    edtRua.Text := Cliente.Rua;
    edtNumero.Text := Cliente.Numero;
    edtCidade.Text := Cliente.Cidade;
    edtEstado.Text := Cliente.Estado;

    edtGenero.Text := Cliente.Genero;
    edtEmail.Text := Cliente.Email;
    edtCelular.Text := Cliente.Celular;

    imgFoto.Picture.LoadFromStream(Cliente.Foto);

  finally
    Cliente.Free;
    Controller.Free;
  end;

end;

procedure TfrmTelaClienteCadastro.btnOKClick(Sender: TObject);
begin
  Validar;
  ModalResult := mrOK;
end;

procedure TfrmTelaClienteCadastro.btnSalvarFotoClick(Sender: TObject);
begin
 if imgFoto.Picture.Graphic <> nil then
  begin
    if sdlgFoto.Execute then
    begin
      imgFoto.Picture.SaveToFile(sdlgFoto.FileName);
    end;
  end;
end;

procedure TfrmTelaClienteCadastro.miLimparClick(Sender: TObject);
begin
      imgFoto.Picture := nil;
end;

procedure TfrmTelaClienteCadastro.edtGeneroChange(Sender: TObject);
begin
  if edtGenero.Text= 'male'  then
      edtGenero.Text:= 'Masculino';
   if edtGenero.Text='female' then
      edtGenero.Text:='Feminino';
end;

procedure TfrmTelaClienteCadastro.Validar;
begin
  try
    if (edtNome.Text = '') then
      raise Exception.Create('Nome não preenchido');

    if (edtCPF.Text = '') then
      raise Exception.Create('CPF não preenchido');

    if (edtDataNascimento.Text = '') then
      raise Exception.Create('Data de Nascimento não preenchida'+ SLineBreak +
                             'usar o formato (aaaa-mm-dd)');
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      Abort;
    end;
  end;
end;

end.
