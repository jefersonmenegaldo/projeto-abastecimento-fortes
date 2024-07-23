program ProjetoAbastecimentoTest;

{$IFNDEF TESTINSIGHT}
{$APPTYPE CONSOLE}
{$ENDIF}
{$STRONGLINKTYPES ON}
uses
  System.SysUtils,
  {$IFDEF TESTINSIGHT}
  TestInsight.DUnitX,
  {$ELSE}
  DUnitX.Loggers.Console,
  DUnitX.Loggers.Xml.NUnit,
  {$ENDIF }
  DUnitX.TestFramework,
  Config.Sistema in 'Config\Config.Sistema.pas',
  Test.Service.Venda in 'TestsServices\Test.Service.Venda.pas',
  Test.Service.VendaItem in 'TestsServices\Test.Service.VendaItem.pas',
  Service.Venda in '..\src\services\Service.Venda.pas',
  Service.VendaItem in '..\src\services\Service.VendaItem.pas',
  Repository.IBomba in '..\src\repositories\Interfaces\Repository.IBomba.pas',
  Repository.IRepository in '..\src\repositories\Interfaces\Repository.IRepository.pas',
  Model.Bomba in '..\src\models\Model.Bomba.pas',
  Model.Empresa in '..\src\models\Model.Empresa.pas',
  Model.Imposto in '..\src\models\Model.Imposto.pas',
  Model.Produto in '..\src\models\Model.Produto.pas',
  Model.ProdutoImposto in '..\src\models\Model.ProdutoImposto.pas',
  Model.Tanque in '..\src\models\Model.Tanque.pas',
  Model.Venda in '..\src\models\Model.Venda.pas',
  Model.VendaItens in '..\src\models\Model.VendaItens.pas',
  Repository.Venda in 'Repositories\Repository.Venda.pas',
  Repository.Base in 'Repositories\Repository.Base.pas',
  Repository.VendaItens in 'Repositories\Repository.VendaItens.pas',
  Repository.Empresa in 'Repositories\Repository.Empresa.pas',
  Repository.Produto in 'Repositories\Repository.Produto.pas',
  Repository.Bomba in 'Repositories\Repository.Bomba.pas',
  Repository.Tanque in 'Repositories\Repository.Tanque.pas';


{$IFNDEF TESTINSIGHT}
var
  runner: ITestRunner;
  results: IRunResults;
  logger: ITestLogger;
  nunitLogger : ITestLogger;
{$ENDIF}
begin
{$IFDEF TESTINSIGHT}
  TestInsight.DUnitX.RunRegisteredTests;
{$ELSE}
  try
    //Check command line options, will exit if invalid
    TDUnitX.CheckCommandLine;
    //Create the test runner
    runner := TDUnitX.CreateRunner;
    //Tell the runner to use RTTI to find Fixtures
    runner.UseRTTI := True;
    //When true, Assertions must be made during tests;
    runner.FailsOnNoAsserts := False;

    //tell the runner how we will log things
    //Log to the console window if desired
    if TDUnitX.Options.ConsoleMode <> TDunitXConsoleMode.Off then
    begin
      logger := TDUnitXConsoleLogger.Create(TDUnitX.Options.ConsoleMode = TDunitXConsoleMode.Quiet);
      runner.AddLogger(logger);
    end;
    //Generate an NUnit compatible XML File
    nunitLogger := TDUnitXXMLNUnitFileLogger.Create(TDUnitX.Options.XMLOutputFile);
    runner.AddLogger(nunitLogger);

    //Run tests
    results := runner.Execute;
    if not results.AllPassed then
      System.ExitCode := EXIT_ERRORS;

    {$IFNDEF CI}
    //We don't want this happening when running under CI.
    if TDUnitX.Options.ExitBehavior = TDUnitXExitBehavior.Pause then
    begin
      System.Write('Done.. press <Enter> key to quit.');
      System.Readln;
    end;
    {$ENDIF}
  except
    on E: Exception do
      System.Writeln(E.ClassName, ': ', E.Message);
  end;
{$ENDIF}
end.
