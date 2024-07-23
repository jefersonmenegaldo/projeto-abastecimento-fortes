unit Dao.IProduto;

interface

uses
  FireDAC.Comp.Client;

type
  IProdutoDao = interface
    ['{798AF270-B928-415D-82CE-B00E98182A10}']
    procedure LoadProdutoImpostos(const ProdutoID: integer);
  end;

implementation

end.
