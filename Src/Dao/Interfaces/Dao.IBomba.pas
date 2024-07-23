unit Dao.IBomba;

interface

uses
  FireDAC.Comp.Client;

type
  IBombaDao = interface
  ['{3189F1B1-A7E9-47E8-B5F4-986EA08DE73A}']
    procedure LoadByProdutoID(const ProdutoID: integer);
  end;

implementation

end.
