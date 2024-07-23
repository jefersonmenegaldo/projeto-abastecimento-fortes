unit Dao.IProdutoImposto;

interface

uses
  FireDAC.Comp.Client;

type
  IProdutoImpostoDao = interface
    ['{4DD55E18-AA13-40E7-8BCC-EE45FE74FA35}']
    function LoadByProdutoID(ProdutoID: integer): TFDQuery;
  end;

implementation

end.
