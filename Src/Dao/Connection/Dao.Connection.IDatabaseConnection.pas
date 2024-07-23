unit Dao.Connection.IDatabaseConnection;

interface

uses
  Config.Database, FireDAC.Comp.Client;

type
  IDatabaseConnection = interface
  ['{2D9BE49C-0788-40F0-93C1-9BC4D3801E78}']
  function GetConnection: TFDConnection;
  property Connection: TFDConnection read GetConnection;
  end;

implementation

end.
