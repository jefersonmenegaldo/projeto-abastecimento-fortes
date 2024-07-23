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
 config.sistema;

{ TVendaItemRepository }

constructor TVendaItemRepository.Create;
begin
  inherited;
end;

procedure TVendaItemRepository.Save(Model: TVendaItem);
begin
  if Model.ID <= 0 then
    Model.ID := Random(1000);
end;

end.
