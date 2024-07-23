unit Repository.Empresa;

interface

uses
  Repository.IRepository, Model.Empresa, Repository.Base, System.Generics.Collections;

type
  TEmpresaRepository = class(TRepositoryBase<TEmpresa>)
    public
      function First: TEmpresa; override;
      constructor Create; override;
  end;

implementation

uses
  Dao.Empresa, config.sistema;

{ TEmpresaRepository }

constructor TEmpresaRepository.Create;
begin
 FDao := TEmpresaDao.Create;
end;

function TEmpresaRepository.First: TEmpresa;
begin
  FDao.LoadFirst;
  Result := TEmpresa.Create(
    FDao.GetQuery.FieldByName('ID').AsInteger,
    FDao.GetQuery.FieldByName('Nome').AsString
  );
end;

end.
