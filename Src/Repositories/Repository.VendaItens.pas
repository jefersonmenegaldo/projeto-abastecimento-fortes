unit Repository.VendaItens;

interface

uses
  Repository.IRepository, Model.VendaItens, Repository.Base, System.Generics.Collections;

type
  TVendaItemRepository = class(TRepositoryBase<TVendaItem>)
    public
      procedure Save(Model: TVendaItem); override;
      constructor Create; override;
  end;

implementation

uses
  Dao.VendaItens, config.sistema;

{ TVendaItemRepository }

constructor TVendaItemRepository.Create;
begin
 FDao := TVendaItemDao.Create;
end;

procedure TVendaItemRepository.Save(Model: TVendaItem);
begin
  inherited;
  if Model.ID <= 0 then
    Model.ID := FDao.Insert(Model)
  else
    FDao.Update(Model);
end;

end.
