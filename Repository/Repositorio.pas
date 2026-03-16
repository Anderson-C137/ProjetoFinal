unit Repositorio;

interface

uses
  SysUtils,
  Generics.Collections;

type
  IRepositorio<T: class> = interface
    procedure Salvar(objeto: T);
    function ObterTodos: TObjectList<T>;
    procedure Excluir(id: Integer);
  end;

implementation

end.
