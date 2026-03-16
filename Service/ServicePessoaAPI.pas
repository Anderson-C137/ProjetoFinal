unit ServicePessoaAPI;

interface

uses
  System.Net.HttpClient,
  System.Net.HttpClientComponent,
  REST.Types, REST.Client,
  System.SysUtils, System.Classes, System.JSON,
  System.DateUtils,
  Vcl.Dialogs,
  Modelo.Cliente;

function GerarPessoaAPI(
  RESTClient: TRESTClient;
  RESTRequest: TRESTRequest;
  RESTResponse: TRESTResponse
  ): TCliente;

implementation

function GerarPessoaAPI(
  RESTClient: TRESTClient;
  RESTRequest: TRESTRequest;
  RESTResponse: TRESTResponse
): TCliente;
var
  JSON,Pessoa,NameObj,FotoObj,DNascimentoObj,LugarObj,RuaObj,IdObj: TJSONObject;
  ResultsArray: TJSONArray;
  HTTP: TNetHTTPClient;
  url2: string;
  DataISO: string;

begin

 Result := TCliente.Create;

  RESTClient.BaseURL := 'https://randomuser.me/api/';
  RESTRequest.Method := rmGET;
  RESTRequest.Resource := '?nat=br';
  RESTResponse.ContentType:= 'application/json';
  RESTRequest.Execute;


 if (RestResponse.StatusCode = 200) then
   begin
     // Bloco Principal
     HTTP := TNetHTTPClient.Create(nil);

     JSON := TJSONObject.ParseJSONValue(RESTResponse.Content) as TJSONObject;

    try

    ResultsArray := JSON.GetValue<TJSONArray>('results');
    Pessoa := ResultsArray.Items[0] as TJSONObject;

    // Foto
    FotoObj := Pessoa.GetValue<TJSONObject>('picture');
    url2 := FotoObj.GetValue<string>('large');

    HTTP.Get(url2, Result.Foto);
    Result.Foto.Position := 0;

    // Nome
    NameObj := Pessoa.GetValue<TJSONObject>('name');
    Result.Nome :=
      NameObj.GetValue<string>('first') + ' ' +
      NameObj.GetValue<string>('last');

    // CPF
    IdObj := Pessoa.GetValue<TJSONObject>('id');
    Result.CPF := IdObj.GetValue<string>('value');

    // Data de Nascimento e Idade
    DNascimentoObj := Pessoa.GetValue<TJSONObject>('dob');
    DataISO := DNascimentoObj.GetValue<string>('date');

    Result.DataNascimento := ISO8601ToDate(DataISO);
    Result.Idade := DNascimentoObj.GetValue<string>('age');

    // Endereco
    LugarObj := Pessoa.GetValue<TJSONObject>('location');
    RuaObj := LugarObj.GetValue<TJSONObject>('street');

    Result.Rua := RuaObj.GetValue<string>('name');
    Result.Numero := RuaObj.GetValue<string>('number');
    Result.Cidade := LugarObj.GetValue<string>('city');
    Result.Estado := LugarObj.GetValue<string>('state');

    // Genero, Email e Celular
    Result.Genero := Pessoa.GetValue<string>('gender');
    Result.Email := Pessoa.GetValue<string>('email');
    Result.Celular := Pessoa.GetValue<string>('cell');

    finally
     JSON.Free;
     HTTP.Free;
    end;

   end
 else
   ShowMessage('Não foi possível usar a API. Tente mais tarde.');


end;

end.
