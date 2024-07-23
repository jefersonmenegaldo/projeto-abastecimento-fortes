unit Dao.Connection.DatabaseConnection;

interface

uses FireDAC.Comp.Client,
     FireDAC.Comp.Script,
     System.SysUtils,
     FireDAC.Stan.Def,
     FireDAC.DApt,
     FireDAC.Stan.Async,
     FireDAC.Phys.FB,
     Config.database,
     Dao.Connection.IDatabaseConnection;

type
  TConnection = class(TInterfacedObject, IDatabaseConnection)
    private
      FConnection: TFDConnection;
      FDriverLink: TFDPhysFBDriverLink;
      function GetConnection: TFDConnection;

    public
      class function New(Config: TDatabaseConfig): IDatabaseConnection;
      procedure Connect;

      constructor Create(const Config: TDatabaseConfig);
      destructor Destroy; override;

  end;

implementation

uses
  Vcl.Forms;

{ TConnection }

procedure TConnection.Connect;
begin
  FConnection.Open;
end;

constructor TConnection.Create(const Config: TDatabaseConfig);
begin
  FDriverLink := TFDPhysFBDriverLink.Create(nil);
  FConnection := TFDConnection.Create(nil);
  FDriverLink.VendorHome := Config.VendoPath;

  FConnection.Params.Add(Format('CharacterSet=%s', ['UTF8']));
  FConnection.Params.DriverID := 'FB';
  FConnection.Params.UserName := Config.DBUser;
  FConnection.Params.Password := Config.DBPassword;
  FConnection.Params.Database := Config.DBName;
  FConnection.Params.Add(Format('Port=%s', [Config.DBPort]));
  FConnection.Params.Add(Format('Server=%s', [Config.DBServer]));

end;

destructor TConnection.Destroy;
begin
  if FConnection.Connected then
    FConnection.Close;

  if Assigned(FConnection) then
    FConnection.Free;

  if Assigned(FDriverLink) then
    FDriverLink.Free;

  inherited;
end;

function TConnection.GetConnection: TFDConnection;
begin
  Result := FConnection;
end;

class function TConnection.New(Config: TDatabaseConfig): IDatabaseConnection;
begin
  Result := Self.Create(Config);
end;

end.
