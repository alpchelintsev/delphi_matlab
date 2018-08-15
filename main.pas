unit main;

interface

uses
  Forms, ImgList, Controls, Dialogs, Menus, ComCtrls, ToolWin, Classes,
  Messages, EditWindow;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    FileNewItem: TMenuItem;
    FileOpenItem: TMenuItem;
    FileCloseItem: TMenuItem;
    N1: TMenuItem;
    FileExitItem: TMenuItem;
    OpenDialog: TOpenDialog;
    FileSaveItem: TMenuItem;
    FileSaveAsItem: TMenuItem;
    StatusBar: TStatusBar;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton9: TToolButton;
    ImageList1: TImageList;
    SaveDialog: TSaveDialog;
    Clear1: TMenuItem;
    Straight1: TMenuItem;
    Reverse1: TMenuItem;
    procedure FileNew1Execute(Sender: TObject);
    procedure FileOpen1Execute(Sender: TObject);
    procedure FileExit1Execute(Sender: TObject);
    procedure FileCloseItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FileSaveItemClick(Sender: TObject);
    procedure FileSaveAsItemClick(Sender: TObject);
    procedure Clear1Click(Sender: TObject);
    procedure Straight1Click(Sender: TObject);
    procedure Reverse1Click(Sender: TObject);
  private
    procedure CreateMDIChild(Name: string; Flag: Boolean);
    procedure EnItems(flag: Boolean);
    procedure WMCloseChild(var Message: TMessage); message WM_CloseChild;
    function SaveToFile(FileName: String): Boolean;
  protected
    procedure DestroyWindowHandle; override;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses SysUtils, straight, reverse, Variants, ComObj;

procedure TMainForm.DestroyWindowHandle;
begin
  if MATLABrun then
  try
    MATLAB.Quit;
    MATLAB:=UnAssigned
  except
  end;
  inherited DestroyWindowHandle
end;

procedure TMainForm.CreateMDIChild(Name: string; Flag: Boolean);
var
  Child: TMDIChild;
begin
  Child:=TMDIChild.Create(Application);
  Child.Caption:=Name;
  if Flag then
    if FileExists(Name) then Child.Memo1.Lines.LoadFromFile(Name);
  if MDIChildCount=1 then EnItems(true)
end;

procedure TMainForm.EnItems(flag: Boolean);
begin
  FileCloseItem.Enabled:=flag;
  FileSaveItem.Enabled:=flag;
  FileSaveAsItem.Enabled:=flag;
  Clear1.Enabled:=flag;
  Straight1.Enabled:=flag;
  Reverse1.Enabled:=flag
end;

function TMainForm.SaveToFile(FileName: String): Boolean;
begin
  Result:=true;
  try
    ActiveChild.Memo1.Lines.SaveToFile(FileName)
  except
    Result:=false;
    MessageDlg('Ошибка при сохранении файла',mtError,[mbOk],0)
  end
end;

procedure TMainForm.FileNew1Execute(Sender: TObject);
begin
  CreateMDIChild('NONAME'+IntToStr(MDIChildCount+1)+'.S',false)
end;

procedure TMainForm.FileOpen1Execute(Sender: TObject);
begin
  if OpenDialog.Execute then CreateMDIChild(ExtractFileName(OpenDialog.FileName),
                                            true)
end;

procedure TMainForm.FileExit1Execute(Sender: TObject);
begin
  Application.Terminate
end;

procedure TMainForm.FileCloseItemClick(Sender: TObject);
begin
  ActiveChild.Close
end;

procedure TMainForm.WMCloseChild(var Message: TMessage);
begin
  if MDIChildCount=1 then EnItems(false)
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  ParentHeader:=Handle;
  DecimalSeparator:='.';
  MATLABrun:=true;
  try
    MATLAB:=CreateOLEObject('Matlab.Application')
  except
    MATLABrun:=false
  end
end;

procedure TMainForm.FileSaveItemClick(Sender: TObject);
begin
  SaveToFile(ActiveChild.Caption)
end;

procedure TMainForm.FileSaveAsItemClick(Sender: TObject);
begin
  SaveDialog.FileName:=ActiveChild.Caption;
  if SaveDialog.Execute then
    if SaveToFile(SaveDialog.FileName) then
      ActiveChild.Caption:=ExtractFileName(SaveDialog.FileName)
end;

procedure TMainForm.Clear1Click(Sender: TObject);
begin
  ActiveChild.Memo1.Clear
end;

procedure TMainForm.Straight1Click(Sender: TObject);
begin
  ShowStraightForm
end;

procedure TMainForm.Reverse1Click(Sender: TObject);
begin
  ShowReverseForm
end;

end.
