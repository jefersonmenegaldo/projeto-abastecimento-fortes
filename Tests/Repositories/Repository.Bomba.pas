unit Repository.Bomba;

interface

uses
  Repository.IRepository, Model.Bomba, Repository.Base, System.Generics.Collections;

type
  TBombaRepository = class(TRepositoryBase<TBomba>)
    public
      constructor Create; override;

  end;

implementation

uses
  Model.Tanque;

{ TBombaRepository }

constructor TBombaRepository.Create;
begin
  inherited;
  FDataFake.Add(TBomba.Create(1 ,'Bomba fake 01', 1));
  FDataFake.Add(TBomba.Create(2 ,'Bomba fake 02', 2));
  FDataFake.Add(TBomba.Create(3 ,'Bomba fake 03', 1));
  FDataFake.Add(TBomba.Create(4 ,'Bomba fake 04', 2));
end;

end.
