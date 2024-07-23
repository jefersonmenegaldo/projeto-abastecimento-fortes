unit Repository.IBomba;

interface

uses
  System.Generics.Collections, Model.Bomba;

type
  IBomba = interface
  ['{3F421758-AF42-4260-AE24-86A8B0A4F1CE}']
    function GetByProdutoID(ProdutoID: integer): TList<TBomba>;
  end;

implementation

end.
