program Dispers;

uses
  Forms,
  main in 'main.pas' {MainForm},
  EditWindow in 'EditWindow.pas' {ActiveChild},
  straight in 'straight.pas' {StraightForm},
  reverse in 'reverse.pas' {ReverseForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
