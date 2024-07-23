unit Repository.Empresa;

interface

uses
  Repository.IRepository, Model.Empresa, Repository.Base, System.Generics.Collections;

type
  TEmpresaRepository = class(TRepositoryBase<TEmpresa>)
    public
      constructor Create; override;
  end;

implementation

uses
  config.sistema;

{ TEmpresaRepository }

constructor TEmpresaRepository.Create;
begin
 inherited;
end;

end.
