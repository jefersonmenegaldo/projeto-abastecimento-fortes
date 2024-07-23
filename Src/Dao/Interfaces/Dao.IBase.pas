unit Dao.IBase;

interface

uses
  FireDAC.Comp.Client;

type
  IDaoBase = interface
    ['{96DC9632-55DB-4F68-87CD-FDC2AADA717F}']
    function GetQuery: TFDQuery;
    function Load: TFDQuery;
    function LoadFirst: TFDQuery;
    procedure LoadByID(const ID: integer);
    function Insert(model: TObject): integer;
    procedure Update(model: TObject);

  end;

implementation

end.
