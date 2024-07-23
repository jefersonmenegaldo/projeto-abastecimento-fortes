unit Repository.Produto;

interface

uses
  Repository.IRepository, Model.Produto, Repository.Base, System.Generics.Collections,
  Model.ProdutoImposto, Dao.ProdutoImposto;

type
  TProdutoRepository = class(TRepositoryBase<TProduto>)
    private
      FProdutoImpostoDao: TProdutoImpostoDao;
    public
      function GetAll: TList<TProduto>; override;
      function GetByID(const ID: integer): TProduto; override;
      constructor Create; override;
      destructor Destroy; override;
  end;

implementation

uses
  Dao.Produto, config.sistema, Model.Imposto;

{ TProdutoRepository }

constructor TProdutoRepository.Create;
begin
 FDao := TProdutoDao.Create;
 FProdutoImpostoDao := TProdutoImpostoDao.Create;
end;

destructor TProdutoRepository.Destroy;
begin
  FProdutoImpostoDao.Free;
  inherited;
end;

function TProdutoRepository.GetAll: TList<TProduto>;
begin
  FDao.Load;
  Result := TList<TProduto>.Create;
  FDao.GetQuery.First;
  FDao.GetQuery.RecordCount;
  while not FDao.GetQuery.Eof do
    begin
      Result.Add(TProduto.Create(
        FDao.GetQuery.FieldByName('ID').AsInteger,
        FDao.GetQuery.FieldByName('Descricao').AsString,
        FDao.GetQuery.FieldByName('Preco_Venda').AsExtended
      ));
      FDao.GetQuery.Next;
    end;

end;

function TProdutoRepository.GetByID(const ID: integer): TProduto;
begin
  FDao.LoadByID(ID);
  Result := TProduto.Create(
    FDao.GetQuery.FieldByName('ID').AsInteger,
    FDao.GetQuery.FieldByName('Descricao').AsString,
    FDao.GetQuery.FieldByName('Preco_Venda').AsExtended
  );
  FProdutoImpostoDao.LoadByProdutoID(ID);
  while not FProdutoImpostoDao.Query.Eof do
  begin
    Result.Impostos.Add(
      TImposto.Create(
        FProdutoImpostoDao.Query.FieldByName('IMPOSTO_ID').AsInteger,
        FProdutoImpostoDao.Query.FieldByName('DESCRICAO').AsString,
        FProdutoImpostoDao.Query.FieldByName('ALIQUOTA').AsExtended
      )
    );
    FProdutoImpostoDao.Query.Next;
  end;

end;

end.
