unit TelaCliente;

interface

uses
  Repositorio.Cliente,
  Modelo.Cliente,
  TelaClienteCadastro,
  System.DateUtils,
  DataModulePrincipal,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls,
  Datasnap.DBClient;

type
  TfrmTelaCliente = class(TForm)
    pnlMenu: TPanel;
    btnAdicionar: TButton;
    btnEditar: TButton;
    btnRemover: TButton;
    pnlPrincipal: TPanel;
    grdClientes: TDBGrid;
    dtsClientes: TDataSource;
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FRepositorio: TRepositorioCliente;

    procedure AdicionarCliente(Cliente: TCliente);
    procedure EditarCliente(NovoCliente: TCliente);
    procedure ExcluirCliente;
  public
    { Public declarations }
  end;

var
  frmTelaCliente: TfrmTelaCliente;

implementation

{$R *.dfm}

procedure TfrmTelaCliente.FormCreate(Sender: TObject);
begin
  FRepositorio := TRepositorioCliente.Create;
  dtsClientes.DataSet := FRepositorio.TabelaGrid;
end;

procedure TfrmTelaCliente.FormDestroy(Sender: TObject);
begin
  FRepositorio.Free;
end;

procedure TfrmTelaCliente.btnAdicionarClick(Sender: TObject);
 var
   cliente: Tcliente;
begin
  cliente:= TCliente.Create;
  frmTelaClienteCadastro := TfrmTelaClienteCadastro.Create(Self);
  try
    if frmTelaClienteCadastro.ShowModal = mrOK then
      begin

      cliente.Nome:= frmTelaClienteCadastro.edtNome.Text;
      cliente.CPF:= frmTelaClienteCadastro.edtCPF.Text;
      cliente.Genero:= frmTelaClienteCadastro.edtGenero.Text;
      cliente.Rua:=  frmTelaClienteCadastro.edtRua.Text;
      cliente.Numero:= frmTelaClienteCadastro.edtNumero.Text;
      cliente.Cidade:= frmTelaClienteCadastro.edtCidade.Text;
      cliente.Estado:= frmTelaClienteCadastro.edtEstado.Text;
      cliente.DataNascimento := ISO8601ToDate(frmTelaClienteCadastro.edtDataNascimento.Text);
      cliente.Idade:=  frmTelaClienteCadastro.edtIdade.Text;
      cliente.Celular:= frmTelaClienteCadastro.edtCelular.Text;
      cliente.Email:= frmTelaClienteCadastro.edtEmail.Text;

      Cliente.CarregarFotoDoImage(frmTelaClienteCadastro.imgFoto);

      AdicionarCliente(cliente);
      end;
  finally
    frmTelaClienteCadastro.Free;
    cliente.free;
  end;
end;

procedure TfrmTelaCliente.AdicionarCliente(Cliente: TCliente);
begin
  var Cliente2 := TCliente.Create;

  // Atualiza o objeto
  Cliente2.Nome := Cliente.Nome;
  Cliente2.CPF := Cliente.CPF;
  Cliente2.Genero := Cliente.Genero;
  Cliente2.Rua:= Cliente.Rua;
  Cliente2.Numero:= Cliente.Numero;
  Cliente2.Cidade:= Cliente.Cidade;
  Cliente2.Estado:= Cliente.Estado;
  Cliente2.DataNascimento:= Cliente.DataNascimento;
  Cliente2.Idade:= Cliente.Idade;
  Cliente2.Celular:= Cliente.Celular;
  Cliente2.Email:= Cliente.Email;

  // Adiciona ao banco de dados
  FRepositorio.Salvar(cliente);
end;

procedure TfrmTelaCliente.btnEditarClick(Sender: TObject);
var
 Cliente: TCliente;
 Imagem: TMemoryStream;
begin
  Cliente:= TCliente.Create;
  frmTelaClienteCadastro := TfrmTelaClienteCadastro.Create(Self);
  Imagem := TMemoryStream.Create;

  try
    frmTelaClienteCadastro.edtNome.Text := dtsClientes.DataSet.FieldByName('nome').AsString;
    frmTelaClienteCadastro.edtCPF.Text := dtsClientes.DataSet.FieldByName('cpf').AsString;
    frmTelaClienteCadastro.edtGenero.Text := dtsClientes.DataSet.FieldByName('genero').AsString;
    frmTelaClienteCadastro.edtRua.Text := dtsClientes.DataSet.FieldByName('rua').AsString;
    frmTelaClienteCadastro.edtNumero.Text := dtsClientes.DataSet.FieldByName('numero').AsString;
    frmTelaClienteCadastro.edtCidade.Text := dtsClientes.DataSet.FieldByName('cidade').AsString;
    frmTelaClienteCadastro.edtEstado.Text := dtsClientes.DataSet.FieldByName('estado').AsString;
    frmTelaClienteCadastro.edtDataNascimento.Text := DateToStr(dtsClientes.DataSet.FieldByName('datanascimento').AsDateTime);
    frmTelaClienteCadastro.edtIdade.Text := dtsClientes.DataSet.FieldByName('idade').AsString;
    frmTelaClienteCadastro.edtCelular.Text := dtsClientes.DataSet.FieldByName('celular').AsString;
    frmTelaClienteCadastro.edtEmail.Text := dtsClientes.DataSet.FieldByName('email').AsString;

    // carregar foto
    TBlobField(dtsClientes.DataSet.FieldByName('foto')).SaveToStream(Imagem);
    imagem.Position:=0;
    frmTelaClienteCadastro.imgFoto.Picture.LoadFromStream(Imagem);

    if frmTelaClienteCadastro.ShowModal = mrOK then
    begin
      Cliente.Nome:= frmTelaClienteCadastro.edtNome.Text;
      Cliente.CPF:= frmTelaClienteCadastro.edtCPF.Text;
      Cliente.Genero:= frmTelaClienteCadastro.edtGenero.Text;

      Cliente.Rua:=  frmTelaClienteCadastro.edtRua.Text;
      Cliente.Numero:= frmTelaClienteCadastro.edtNumero.Text;
      Cliente.Cidade:= frmTelaClienteCadastro.edtCidade.Text;
      Cliente.Estado:= frmTelaClienteCadastro.edtEstado.Text;
      Cliente.DataNascimento := ISO8601ToDate(frmTelaClienteCadastro.edtDataNascimento.Text);
      Cliente.Idade:=  frmTelaClienteCadastro.edtIdade.Text;
      Cliente.Celular:= frmTelaClienteCadastro.edtCelular.Text;
      Cliente.Email:= frmTelaClienteCadastro.edtEmail.Text;

      Cliente.CarregarFotoDoImage(frmTelaClienteCadastro.imgFoto);

      EditarCliente(Cliente);
    end;
  finally
    frmTelaClienteCadastro.Free;
    cliente.Free;
    Imagem.Free;
  end;
end;

procedure TfrmTelaCliente.EditarCliente(NovoCliente: TCliente);
 var
   cliente2 : TCliente;

begin
  cliente2 := TCliente.Create;
try
  if not dtsClientes.DataSet.IsEmpty then
  begin
    // Cria um novo objeto e preenche seu Id

   // cliente2.Id := dtsClientes.DataSet.FieldByName('Id').AsInteger;
   NovoCliente.Id := dtsClientes.DataSet.FieldByName('Id').AsInteger;

    // Atualiza o objeto

//    cliente2.Nome:= NovoCliente.Nome;
//    cliente2.CPF:= NovoCliente.CPF;
//    cliente2.Genero:= NovoCliente.Genero;
//
//    cliente2.Rua:= NovoCliente.Rua;
//    cliente2.Numero:= NovoCliente.Numero;
//    cliente2.Cidade:= NovoCliente.Cidade;
//    cliente2.Estado:= NovoCliente.Estado;
//    Cliente2.DataNascimento := NovoCliente.DataNascimento;
//    Cliente2.Idade:= NovoCliente.Idade;
//    Cliente2.Celular:= NovoCliente.Celular;
//    Cliente2.Email:= NovoCliente.Email;


    // Atualiza o banco de dados
    FRepositorio.Salvar(NovoCliente);
 //  FRepositorio.Salvar(Cliente2);
  end;
 finally
   Cliente2.free;
 end;

end;

procedure TfrmTelaCliente.btnRemoverClick(Sender: TObject);
begin
  ExcluirCliente;
end;

procedure TfrmTelaCliente.ExcluirCliente;
begin
  if not dtsClientes.DataSet.IsEmpty then
  begin
    // Remove do banco de dados
    FRepositorio.Excluir(dtsClientes.DataSet.FieldByName('Id').AsInteger);
  end;
end;

end.
