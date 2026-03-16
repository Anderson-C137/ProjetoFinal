unit DataModulePrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Phys.PGDef, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.PG,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  System.ImageList, Vcl.ImgList, Vcl.Controls;

type
  TdtmPrincipal = class(TDataModule)
    fdDriverLink: TFDPhysPgDriverLink;
    fdConnection: TFDConnection;
    fdTableCliente: TFDTable;
    fdTableProduto: TFDTable;
    fdTableVenda: TFDTable;
    fdTableClienteid: TIntegerField;
    fdTableClientenome: TWideStringField;
    fdTableClientecpf: TWideStringField;
    fdTableProdutoid: TIntegerField;
    fdTableProdutonome: TWideStringField;
    fdTableProdutopreco: TFloatField;
    fdTableVendaid: TIntegerField;
    fdTableVendaidcliente: TIntegerField;
    fdTableVendaidproduto: TIntegerField;
    fdTableVendaquantidade: TIntegerField;
    fdQueryVenda: TFDQuery;
    fdQueryVendaid: TIntegerField;
    fdQueryVendaidcliente: TIntegerField;
    fdQueryVendaidproduto: TIntegerField;
    fdQueryVendaquantidade: TIntegerField;
    fdQueryVendanomecliente: TWideStringField;
    fdQueryVendanomeproduto: TWideStringField;
    fdQueryVendatotalvenda: TFloatField;
    fdTableClientegenero: TWideStringField;
    fdTableClienterua: TWideStringField;
    fdTableClientenumero: TWideStringField;
    fdTableClientecidade: TWideStringField;
    fdTableClienteestado: TWideStringField;
    fdTableClientecelular: TWideStringField;
    fdTableClienteemail: TWideStringField;
    fdTableClienteidade: TWideStringField;
    fdTableClientedatanascimento: TDateField;
    fdTableClientefoto: TBlobField;
    ImgList: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmPrincipal: TdtmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
