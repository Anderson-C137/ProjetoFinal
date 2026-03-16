unit Modelo.Cliente;

interface

uses
 System.Classes, Vcl.ExtCtrls;

type
  TCliente = class
  private
    FId: Integer;
    FNome: string;
    FCPF: string;
    FGenero: string;
    FRua: string;
    FNumero: string;
    FCidade: string;
    FEstado: string;
    FDataNascimento: TDateTime;
    FIdade: string;
    FCelular: string;
    FEmail: string;
    FFoto: TMemoryStream;
  public

    constructor Create;
    destructor Destroy; override;

    procedure CarregarFotoDoImage(AImage: TImage);

    property Id: Integer read FId write FId;
    property Nome: string read FNome write FNome;
    property CPF: string read FCPF write FCPF;
    property Genero: string read FGenero write FGenero;
    property Rua: string read FRua write FRua;
    property Numero: string read FNumero write FNumero;
    property Cidade: string read FCidade write FCidade;
    property Estado: string read FEstado write FEstado;
    property DataNascimento: TDateTime read FDataNascimento write FDataNascimento;
    property Idade: string read FIdade write FIdade;
    property Celular: string read FCelular write FCelular;
    property Email: string read FEmail write FEmail;
    property Foto: TMemoryStream read FFoto;
  end;

implementation

constructor TCliente.Create;
begin
  FFoto := TMemoryStream.Create;
end;

destructor TCliente.Destroy;
begin
  FFoto.Free;
  inherited;
end;

procedure TCliente.CarregarFotoDoImage(AImage: TImage);
begin
  FFoto.Clear;

  if Assigned(AImage.Picture.Graphic) then
  begin
    AImage.Picture.Graphic.SaveToStream(FFoto);
    FFoto.Position := 0;
  end;
end;


end.
