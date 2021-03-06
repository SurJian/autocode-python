program AutoCodePython;
uses
  ShareMem,
  Forms,
  Main in 'Main.pas' {MainForm},
  NodeSearch in 'NodeSearch.pas' {Form_Search},
  SysConsts in 'SysConsts.pas',
  NodeEditConsts in 'NodeEditConsts.pas',
  ACBaseUnits in 'ACBaseUnits.pas',
  SysRecords in '..\WWChart\SysRecords.pas',
  SysVars in 'SysVars.pas',
  XMLTreeViewUnits in 'XMLTreeViewUnits.pas',
  SysUnits in 'SysUnits.pas',
  XMLUnits in 'XMLUnits.pas',
  XMLGenCodeRecords in 'XMLGenCodeRecords.pas',
  SysOption in 'SysOption.pas' {Form_Options},
  ExportWord in 'ExportWord.pas' {Form_ExportWord},
  ExportSVG in 'ExportSVG.pas',
  ExportVisio in 'ExportVisio.pas' {Form_ExportVisio},
  About in 'About.pas' {Form_About},
  Json2Python in 'Json2Python.pas',
  Json2Flowchart in 'Json2Flowchart.pas',
  teUnit in 'teUnit.pas';

{$R *.res}

begin
     Application.Initialize;

     //
     Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TForm_Search, Form_Search);
  Application.CreateForm(TForm_Options, Form_Options);
  Application.CreateForm(TForm_ExportWord, Form_ExportWord);
  Application.CreateForm(TForm_ExportVisio, Form_ExportVisio);
  Application.CreateForm(TForm_About, Form_About);
  //
     Application.Run;
end.
