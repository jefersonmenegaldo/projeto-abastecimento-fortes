unit config.sistema;

interface

uses
  System.IniFiles, config.database, Model.Empresa, Dao.Connection.IDatabaseConnection;

type
  TSistema = class
    private
      FApplicationPath: string;
      FDatabaseConfig: TDatabaseConfig;
      FEmpresa: TEmpresa;
      FDatabaseConnection: IDatabaseConnection;
      function LoadIniFile(const FileName: string): TIniFile;
      function GetExeName: string;
      procedure LodEmpresa;
      procedure LoadSettings;
      class var FInstance: TSistema;
      class function GetInstance: TSistema; static;

    public
      procedure Initialize;
      constructor Create;
      destructor Destroy; override;

      class property Instance: TSistema read GetInstance;
      property DatabaseConnection: IDatabaseConnection read FDatabaseConnection;
      property Empresa: TEmpresa read FEmpresa;

  end;

implementation

uses
  System.SysUtils, Dao.Connection.DatabaseConnection,
  Repository.IRepository, Repository.Empresa;

{ TSistema }

constructor TSistema.Create;
begin
  inherited Create;
  FDatabaseConfig := TDatabaseConfig.Create;
end;

destructor TSistema.Destroy;
begin
  inherited;
  FDatabaseConfig.Free;
  FEmpresa.Free;
end;

class function TSistema.GetInstance: TSistema;
begin
  if FInstance = nil then
    FInstance := TSistema.Create;
  Result := FInstance;
end;

function TSistema.GetExeName: string;
begin
  Result := ExtractFileName(ParamStr(0)).Replace('.exe', '');
end;

procedure TSistema.Initialize;
begin
  LoadSettings;
  FDatabaseConnection := TConnection.New(FDatabaseConfig);
  LodEmpresa;
end;

function TSistema.LoadIniFile(const FileName: string): TIniFile;
begin
  Result := TIniFile.Create(FileName);
end;

procedure TSistema.LoadSettings;
var
  IniFile: TIniFile;
begin
    FApplicationPath := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
    IniFile := LoadIniFile(concat(FApplicationPath, GetExeName, '.ini'));
  try
    FDatabaseConfig.DBName := IniFile.ReadString('Database', 'DB_NAME', 'posto.fdb');
    FDatabaseConfig.DBUser := IniFile.ReadString('Database', 'DB_USER', 'SYSDBA ');
    FDatabaseConfig.DBPassword := IniFile.ReadString('Database', 'DB_PASSWORD', 'masterkey');
    FDatabaseConfig.DBPort := IniFile.ReadString('Database', 'DB_PORT', '3050');
    FDatabaseConfig.DBServer := IniFile.ReadString('Database', 'DB_SERVER', 'localhost');

  finally
     IniFile.Free;
  end;

end;

procedure TSistema.LodEmpresa;
var
  EmpresaRepository: IRepository<TEmpresa>;
begin
  EmpresaRepository := TEmpresaRepository.New;
  FEmpresa := EmpresaRepository.First;
end;

end.
