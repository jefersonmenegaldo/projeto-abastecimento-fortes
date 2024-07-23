unit Dao.IVenda;

interface

uses
  FireDAC.Comp.Client;

type
  IVendaDao = interface
  ['{F115A022-7852-457C-B60F-31B56B6A4BB4}']
    function LoadRelatorioVenda(const DataInicial, DataFinal: TDateTime): TFDQuery;
  end;

implementation

end.
