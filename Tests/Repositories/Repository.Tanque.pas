unit Repository.tanque;

interface

uses
  Repository.IRepository, Model.tanque, Repository.Base, System.Generics.Collections;

type
  TtanqueRepository = class(TRepositoryBase<TTanque>)
    public
      constructor Create; override;
  end;

implementation

{ TtanqueRepository }

constructor TTanqueRepository.Create;
begin
  inherited;
  FDataFake.Add(TTanque.Create(1 , 1,'Tanque fake 01'));
  FDataFake.Add(TTanque.Create(2 , 2,'Tanque fake 02'));
end;

end.
