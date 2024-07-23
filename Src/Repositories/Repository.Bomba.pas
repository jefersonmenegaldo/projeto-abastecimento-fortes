unit Repository.Bomba;

interface

uses
  Repository.IRepository, Model.Bomba, Repository.Base, System.Generics.Collections,
  Repository.IBomba;

type
  TBombaRepository = class(TRepositoryBase<TBomba>, IBomba)
    public
      function GetByProdutoID(ProdutoID: integer): TList<TBomba>;
      constructor Create; override;
  end;

implementation

uses
  Dao.Bomba, config.sistema, Dao.IBomba, Model.Tanque;

{ TBombaRepository }

constructor TBombaRepository.Create;
begin
 FDao := TBombaDao.Create;
end;

function TBombaRepository.GetByProdutoID(ProdutoID: integer): TList<TBomba>;
begin
  (FDao as IBombaDao).LoadByProdutoID(ProdutoID);
  Result := TList<TBomba>.Create;
  FDao.GetQuery.First;
  FDao.GetQuery.RecordCount;
  while not FDao.GetQuery.Eof do
    begin
      Result.Add(TBomba.Create(
        FDao.GetQuery.FieldByName('BOMBA_ID').AsInteger,
        FDao.GetQuery.FieldByName('BOMBA_DESCRICAO').AsString,
        FDao.GetQuery.FieldByName('TANQUE_ID').AsInteger,
        TTanque.Create(
          FDao.GetQuery.FieldByName('TANQUE_ID').AsInteger,
          FDao.GetQuery.FieldByName('PRODUTO_ID').AsInteger,
          FDao.GetQuery.FieldByName('TANQUE_DESCRICAO').AsString
        )
      ));
      FDao.GetQuery.Next;
    end;
end;

end.
