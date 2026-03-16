unit ControllerCliente;

interface

uses
  REST.Client,
  Modelo.Cliente,
  ServicePessoaAPI;

type
  TClienteController = class
  public
    function GerarPessoa(
      RESTClient: TRESTClient;
      RESTRequest: TRESTRequest;
      RESTResponse: TRESTResponse
    ): TCliente;
  end;

implementation

function TClienteController.GerarPessoa(
  RESTClient: TRESTClient;
  RESTRequest: TRESTRequest;
  RESTResponse: TRESTResponse
 ): TCliente;

begin
  Result := GerarPessoaAPI(
    RESTClient,
    RESTRequest,
    RESTResponse
  );

end;

end.
