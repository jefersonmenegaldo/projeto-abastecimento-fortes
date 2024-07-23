unit config.sistema;

interface

uses
  System.IniFiles, Model.Empresa;

type
  TSistema = class
    private
      FEmpresa: TEmpresa;

      procedure LodEmpresa;
      class var FInstance: TSistema;
      class function GetInstance: TSistema; static;

    public
      procedure Initialize;
      constructor Create;
      destructor Destroy; override;

      class property Instance: TSistema read GetInstance;
      property Empresa: TEmpresa read FEmpresa;

  end;

implementation

uses
  System.SysUtils, Repository.IRepository, Repository.Empresa;

{ TSistema }

constructor TSistema.Create;
begin
  inherited Create;
end;

destructor TSistema.Destroy;
begin
  inherited;
  FEmpresa.Free;
end;

class function TSistema.GetInstance: TSistema;
begin
  if FInstance = nil then
    FInstance := TSistema.Create;
  Result := FInstance;
end;

procedure TSistema.Initialize;
begin
  LodEmpresa;
end;

procedure TSistema.LodEmpresa;
var
  EmpresaRepository: IRepository<TEmpresa>;
begin
  EmpresaRepository := TEmpresaRepository.New;
  FEmpresa := EmpresaRepository.First;
end;

end.
