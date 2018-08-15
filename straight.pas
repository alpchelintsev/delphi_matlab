unit straight;

interface

uses
  Forms, StdCtrls, Controls, RXCtrls, Classes, MinimizedModal;

procedure ShowStraightForm;

type
  TStraightForm = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    TextListBox1: TTextListBox;
    Label2: TLabel;
    Edit2: TEdit;
    Edit1: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure TextListBox1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    first: Boolean;
    MinimizedModal: TMinimizedModal;
    procedure AddP;
  end;

implementation

{$R *.dfm}

uses SysUtils, Dialogs, EditWindow;

procedure ShowStraightForm;
begin
  with TStraightForm.Create(Application) do
  try
    if GetValues then ShowModal
    else MessageDlg('Ошибка при преобразовании строки в список',mtError,[mbOk],0)
  finally
    Free
  end
end;

procedure TStraightForm.AddP;
begin
  with ActiveChild.Memo1 do
  begin
    if first then
    begin
      first:=false;
      Text:=Text+otstup+'Прямой ход:'
    end;
    Text:=Text+otstup+'p = '+Edit2.Text
  end
end;


procedure TStraightForm.Button2Click(Sender: TObject);
var
  i,n: Integer;
begin
  n:=TextListBox1.Items.Count-1;
  if n>=0 then
  begin
    AddP;
    for i:=0 to n do ActiveChild.Memo1.Lines.Add(TextListBox1.Items[i])
  end
end;

procedure TStraightForm.TextListBox1Click(Sender: TObject);
begin
  AddP;
  ActiveChild.Memo1.Lines.Add(TextListBox1.Items[TextListBox1.ItemIndex])
end;

procedure TStraightForm.Edit1Exit(Sender: TObject);
var
  Value,ErrCode: Integer;
begin
  Val(Edit1.Text,Value,ErrCode);
  if ErrCode<>0 then Value:=0
  else if Value<0 then Value:=0;
  Edit1.Text:=IntToStr(Value)
end;

procedure TStraightForm.Button1Click(Sender: TObject);
var
  P: array of array of Real;
  S,buf: array of Real;
  Pi_i: Real;
  i,j,k,m,m1,m2: Integer;
  st: String;
begin
  TextListBox1.Clear;
  m2:=StrToInt(Edit1.Text);
  m:=szVl+m2;
  SetLength(P,m);
  Pi_i:=StrToFloat(Edit2.Text);
  for i:=0 to m-1 do
  begin
    SetLength(P[i],m);
    for j:=0 to i-1 do P[i,j]:=0;
    for j:=i+2 to m-1 do P[i,j]:=0;
    if i<>m-1 then
    begin
      P[i,i]:=Pi_i;
      P[i,i+1]:=1-Pi_i
    end
    else P[i,i]:=1
  end;
  SetLength(S,m);
  for i:=0 to m-1 do
    if i<szVl then S[i]:=Vl[i]
    else S[i]:=0;
  SetLength(buf,m);
  for k:=1 to m2 do
  begin
    for i:=0 to m-1 do
    begin
      buf[i]:=0;
      for j:=0 to m-1 do buf[i]:=buf[i]+S[j]*P[j,i]
    end;
    st:='';
    m1:=szVl+k-1;
    for i:=0 to m1 do
    begin
      S[i]:=buf[i];
      st:=st+FloatToStr(buf[i]);
      if i<>m1 then st:=st+' '
    end;
    TextListBox1.Items.Add(st+m_eq+IntToStr(m2-k))
  end
end;

procedure TStraightForm.Edit2Exit(Sender: TObject);
var
  Value: Real;
  ErrCode: Integer;
begin
  Val(Edit2.Text,Value,ErrCode);
  if ErrCode<>0 then Value:=0
  else if (Value<0) or (Value>1) then Value:=0;
  Edit2.Text:=FloatToStr(Value)
end;

procedure TStraightForm.FormCreate(Sender: TObject);
begin
  first:=true;
  MinimizedModal:=TMinimizedModal.Create(Self)
end;

end.
