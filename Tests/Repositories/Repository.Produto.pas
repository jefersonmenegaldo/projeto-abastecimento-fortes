unit Repository.Produto;

interface

uses
  Repository.IRepository, Model.Produto, Repository.Base, System.Generics.Collections,
  Model.Imposto;

type
  TProdutoRepository = class(TRepositoryBase<TProduto>)
    public
      constructor Create; override;
      function GetByID(const ID: integer): TProduto; override;

  end;

implementation

uses
 config.sistema;

{ TProdutoRepository }

constructor TProdutoRepository.Create;
begin
  inherited;
  FDataFake.Add(TProduto.Create(1 ,'Produto fake 01', 5.50));
  FDataFake.Add(TProduto.Create(2 ,'Produto fake 02', 4.29));

end;

function TProdutoRepository.GetByID(const ID: integer): TProduto;
begin
  Result := FDataFake.Items[ID - 1];
  Result.Impostos := TList<TImposto>.Create;
  Result.Impostos.Add(TImposto.Create(1 , 'Imposto fake 01', 13));
end;

end.
