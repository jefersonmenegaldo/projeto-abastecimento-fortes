unit Repository.ProdutoImposto;

interface

uses
  Repository.IRepository, Model.ProdutoImposto, Repository.Base, System.Generics.Collections;

type
  TProdutoImpostoRepository = class(TRepositoryBase<TProdutoImposto>)
    public
      constructor Create; override;
  end;

implementation

uses
  Config.sistema;

{ TProdutoImpostoRepository }

constructor TProdutoImpostoRepository.Create;
begin
  inherited;
end;

end.
