unit Repository.Base;

interface

uses
  Repository.IRepository, System.Classes, System.Generics.Collections,
  Dao.IBase;

type
  TRepositoryBase<T: class, constructor> = class(TInterfacedObject, IRepository<T>)
    protected
      FDao: IDaoBase;
    public
      function GetAll: TList<T>; virtual; abstract;
      function First: T; virtual; abstract;
      function GetByID(const ID: integer): T; virtual; abstract;
      procedure Save(Model: T); virtual; abstract;

      class function New: IRepository<T>;
      constructor Create; virtual; abstract;

  end;

implementation

{ TRepositoryBase<T> }

class function TRepositoryBase<T>.New: IRepository<T>;
begin
  Result := Self.Create;
end;

end.
