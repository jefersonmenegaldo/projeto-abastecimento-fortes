unit Repository.Venda;

interface

uses
  Repository.IRepository, Model.Venda, Repository.Base, System.Generics.Collections;

type
  TVendaRepository = class(TRepositoryBase<TVenda>)
    public
      function GetAll: TList<TVenda>; override;
      procedure Save(Model: TVenda); override;
      constructor Create; override;
  end;

implementation

uses
  Dao.Venda, config.sistema, System.Classes;

{ TVendaRepository }

constructor TVendaRepository.Create;
begin
 FDao := TVendaDao.Create;
end;

function TVendaRepository.GetAll: TList<TVenda>;
begin
  FDao.Load;
  Result := TList<TVenda>.Create;
  FDao.GetQuery.First;
  while not FDao.GetQuery.Eof do
    begin
      Result.Add(TVenda.Create(
        FDao.GetQuery.FieldByName('ID').AsInteger,
        FDao.GetQuery.FieldByName('Data_Hora').Value,
        FDao.GetQuery.FieldByName('Subtotal').Value,
        FDao.GetQuery.FieldByName('Total_Impostos').Value,
        FDao.GetQuery.FieldByName('Total').Value
      ));
      FDao.GetQuery.Next;
    end;
end;

procedure TVendaRepository.Save(Model: TVenda);
begin
  inherited;
  if Model.ID <= 0 then
    Model.ID := FDao.Insert(Model)
  else
    FDao.Update(Model);
end;

end.
