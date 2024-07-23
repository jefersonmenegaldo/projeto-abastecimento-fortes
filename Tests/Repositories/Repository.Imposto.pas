unit Repository.Imposto;

interface

uses
  Repository.IRepository, Model.Imposto, Repository.Base, System.Generics.Collections;

type
  TImpostoRepository = class(TRepositoryBase<TImposto>)
    public
      constructor Create; override;
  end;

implementation


{ TImpostoRepository }

constructor TImpostoRepository.Create;
begin
  inherited;
  FDataFake.Add(TImposto.Create(1 , 'Imposto fake 01', 13));
  FDataFake.Add(TImposto.Create(2 , 'Imspoto fake 02', 11));
end;

end.
