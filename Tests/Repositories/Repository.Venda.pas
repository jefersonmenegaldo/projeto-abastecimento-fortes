unit Repository.Venda;

interface

uses
  Repository.IRepository, Model.Venda, Repository.Base, System.Generics.Collections;

type
  TVendaRepository = class(TRepositoryBase<TVenda>)
    public
      procedure Save(Model: TVenda); override;

      constructor Create; override;
  end;

implementation

uses
 System.Classes;

{ TVendaRepository }

constructor TVendaRepository.Create;
begin
  inherited;
end;

procedure TVendaRepository.Save(Model: TVenda);
begin
  inherited;
  if Model.ID <= 0 then
    Model.ID := Random(1000);

end;

end.
