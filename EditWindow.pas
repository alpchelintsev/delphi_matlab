unit EditWindow;

interface

uses
  Forms, Classes, Controls, StdCtrls, Windows, Messages;

type
  TMDIChild = class(TForm)
    Memo1: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  end;

const
  m_eq=', n = ';
  otstup=#13#10#13#10;
  WM_CloseChild=WM_USER+1;

var
  Vl: array of Real;
  szVl: Integer;
  ActiveChild: TMDIChild;
  ParentHeader: HWND;
  MATLAB: Variant;
  MATLABrun: Boolean;

function GetValues: Boolean;

implementation

{$R *.dfm}

uses SysUtils;

procedure TMDIChild.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SendMessage(ParentHeader,WM_CloseChild,0,0);
  Action:=caFree
end;

procedure TMDIChild.FormActivate(Sender: TObject);
begin
  ActiveChild:=Self
end;

procedure TMDIChild.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=27 then Close
end;

function GetValues: Boolean;
var
  p: Integer;
  st,buf: String;
begin
  Result:=false;
  szVl:=0;
  if ActiveChild.Memo1.Lines.Count>0 then
  begin
    st:=ActiveChild.Memo1.Lines[0];
    st:=Trim(st);
    if st='' then exit;
    while st<>'' do
    begin
      p:=Pos(' ',st);
      if not (p>0) then p:=Length(st)+1;
      buf:=Copy(st,1,p-1);
      Delete(st,1,p);
      inc(szVl);
      SetLength(Vl,szVl);
      Val(buf,Vl[szVl-1],p);
      if p<>0 then exit
    end;
    Result:=true
  end
end;

end.
