unit Dao.Base;

interface

uses
  Dao.IBase, Dao.Connection.IDatabaseConnection, FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet;

type
  TDaoBase = class(TInterfacedObject, IDaoBase)
  private
    FConnection: IDatabaseConnection;
    FQuery: TFDQuery;
    FTableName: string;
    function GetQuery: TFDQuery;

  public
    function Insert(model: TObject): integer; virtual;
    procedure Update(model: TObject); virtual;
    procedure Delete(ID: Integer); virtual;
    function Load: TFDQuery; virtual;
    function LoadFirst: TFDQuery; virtual;
    procedure LoadByID(const ID: integer); virtual;

    class function New: IDaoBase;
    constructor Create; virtual;
    destructor Destroy; override;

    property Query: TFDQuery read GetQuery;
    property TableName: string read FTableName write FTableName;


end;

implementation

uses
  System.SysUtils, config.sistema;

{ TDAOBase }

constructor TDAOBase.Create;
begin
  FConnection := TSistema.Instance.DatabaseConnection;
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := FConnection.Connection;
  FConnection.Connection.Connected := True;
end;

procedure TDAOBase.Delete(ID: Integer);
begin
  FQuery.Close;
  FQuery.Unprepare;
  FQuery.Params.Clear;
  FQuery.SQL.Clear;
  FQuery.Open(Format('Delete from %s where ID = %n', [FTableName, ID]));
end;

destructor TDAOBase.Destroy;
begin
  FConnection.Connection.Connected := False;
  FQuery.Free;
  inherited;
end;

function TDAOBase.GetQuery: TFDQuery;
begin
  Result := FQuery;
end;

function TDaoBase.Insert(model: TObject): integer;
begin
  Result := 0;
  FQuery.Close;
  FQuery.Unprepare;
  FQuery.Params.Clear;
  FQuery.SQL.Clear;
end;

function TDAOBase.Load: TFDQuery;
begin
  FQuery.Close;
  FQuery.Unprepare;
  FQuery.Params.Clear;
  FQuery.SQL.Clear;
  FQuery.Open(Format('Select * from %s', [FTableName]));
  Result := FQuery;
end;

procedure TDaoBase.LoadByID(const ID: integer);
begin
  FQuery.Close;
  FQuery.Unprepare;
  FQuery.Params.Clear;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(Format('Select * from %s where ID = :ID', [FTableName]));
  FQuery.Prepare;
  FQuery.ParamByName('ID').AsInteger := ID;
  FQuery.Open;
end;

function TDAOBase.LoadFirst: TFDQuery;
begin
  FQuery.Close;
  FQuery.Unprepare;
  FQuery.Params.Clear;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(Format('Select first 1 * from %s', [FTableName]));
  FQuery.Connection.Connected;
  FQuery.Prepare;
  FQuery.Active := True;
  Result := FQuery;
end;

class function TDAOBase.New: IDaoBase;
begin
  Result := Self.Create;
end;

procedure TDaoBase.Update(model: TObject);
begin
  FQuery.Close;
  FQuery.Unprepare;
  FQuery.Params.Clear;
  FQuery.SQL.Clear;
end;

end.
