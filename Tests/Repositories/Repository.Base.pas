unit Repository.Base;

interface

uses
  Repository.IRepository, System.Classes, System.Generics.Collections;

type
  TRepositoryBase<T: class, constructor> = class(TInterfacedObject, IRepository<T>)
    protected
      FDataFake: TList<T>;
    public
      function GetAll: TList<T>; virtual;
      function First: T; virtual;
      function GetByID(const ID: integer): T; virtual;
      procedure Save(Model: T); virtual;

      class function New: IRepository<T>;
      constructor Create; virtual;
      destructor Destroy; override;

  end;

implementation

{ TRepositoryBase<T> }

constructor TRepositoryBase<T>.Create;
begin
  FDataFake := TList<T>.Create;
end;

destructor TRepositoryBase<T>.Destroy;
var
  FData: T;
begin
  for FData in FDataFake do
    FData.Free;

  FDataFake.Free;
  inherited;
end;

function TRepositoryBase<T>.First: T;
begin
  Result := FDataFake.First;
end;

function TRepositoryBase<T>.GetAll: TList<T>;
begin
  Result := FDataFake;
end;

function TRepositoryBase<T>.GetByID(const ID: integer): T;
begin
  Result := FDataFake.Items[ID - 1];
end;

class function TRepositoryBase<T>.New: IRepository<T>;
begin
  Result := Self.Create;
end;

procedure TRepositoryBase<T>.Save(Model: T);
begin
  FDataFake.Add(Model);
end;

end.
