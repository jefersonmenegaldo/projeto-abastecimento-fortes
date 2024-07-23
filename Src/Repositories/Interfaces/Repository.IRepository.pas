unit Repository.IRepository;

interface

uses
  System.Generics.Collections;

type
  IRepository<T> = interface
    ['{26A20D93-C85A-4A7B-A8BC-59F541D17BF4}']
    function GetAll: TList<T>;
    function GetByID(const ID: integer): T;
    function First: T;
    procedure Save(Model: T);
  end;

implementation

end.
