unit Dao.Empresa;

interface

uses
  Dao.Base, FireDAC.Comp.Client;

type
  TEmpresaDao = class(TDAOBase)
  public

    constructor Create; override;
  end;

implementation

uses
  System.SysUtils;

{ TEmpresaDao }

constructor TEmpresaDao.Create;
begin
  inherited;
  TableName := 'EMPRESAS';
end;

end.
