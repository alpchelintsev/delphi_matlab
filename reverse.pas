unit reverse;

interface

uses
  Forms, Dialogs, StdCtrls, TeEngine, Series, ExtCtrls, TeeProcs, Chart,
  Controls, RXCtrls, Classes, MinimizedModal;

procedure ShowReverseForm;

type
  TReverseForm = class(TForm)
    LabeledEdit1: TLabeledEdit;
    TextListBox1: TTextListBox;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Chart1: TChart;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Button3: TButton;
    LabeledEdit9: TLabeledEdit;
    Button4: TButton;
    Series1: TLineSeries;
    LabeledEdit8: TLabeledEdit;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    LabeledEdit10: TLabeledEdit;
    LabeledEdit11: TLabeledEdit;
    LabeledEdit12: TLabeledEdit;
    LabeledEdit13: TLabeledEdit;
    Button5: TButton;
    GroupBox6: TGroupBox;
    LabeledEdit18: TLabeledEdit;
    LabeledEdit19: TLabeledEdit;
    Button7: TButton;
    Button1: TButton;
    Button2: TButton;
    Button6: TButton;
    SaveDialog: TSaveDialog;
    Series2: TLineSeries;
    CheckBox1: TCheckBox;
    Button8: TButton;
    procedure LabeledEdit12Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LabeledEdit13Exit(Sender: TObject);
    procedure LabeledEdit19Exit(Sender: TObject);
    procedure LabeledEdit10Exit(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure LabeledEdit8Exit(Sender: TObject);
    procedure TextListBox1Click(Sender: TObject);
    procedure LabeledEdit8Change(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    first: Boolean;
    a,b: String;
    MinimizedModal: TMinimizedModal;
    procedure AddP;
    procedure ErrNewton;
    function f(p: Real): Real;
    function diff(p: Real): Real;
  end;

implementation

{$R *.dfm}

uses SysUtils, Math, EditWindow, Variants;

procedure ShowReverseForm;
begin
  with TReverseForm.Create(Application) do
  try
    if GetValues then ShowModal
    else MessageDlg('Ошибка при преобразовании строки в список',mtError,[mbOk],0)
  finally
    Free
  end
end;

procedure TReverseForm.LabeledEdit12Exit(Sender: TObject);
var
  Value,ErrCode: Integer;
begin
  Val((Sender as TLabeledEdit).Text,Value,ErrCode);
  if ErrCode<>0 then Value:=1
  else if Value<1 then Value:=1;
  (Sender as TLabeledEdit).Text:=IntToStr(Value)
end;

procedure TReverseForm.FormCreate(Sender: TObject);
begin
  first:=true;
  a:='0';
  b:='1';
  MinimizedModal:=TMinimizedModal.Create(Self);
  CheckBox1.Enabled:=MATLABrun
end;

procedure TReverseForm.LabeledEdit13Exit(Sender: TObject);
var
  Value: Real;
  ErrCode: Integer;
begin
  Val((Sender as TLabeledEdit).Text,Value,ErrCode);
  if ErrCode<>0 then Value:=0
  else if Value<0 then Value:=0;
  (Sender as TLabeledEdit).Text:=FloatToStr(Value)
end;

procedure TReverseForm.LabeledEdit19Exit(Sender: TObject);
begin
  LabeledEdit13Exit(Sender);
  if StrToFloat((Sender as TLabeledEdit).Text)>1 then
    (Sender as TLabeledEdit).Text:='1'
end;

procedure TReverseForm.LabeledEdit10Exit(Sender: TObject);
begin
  LabeledEdit19Exit(Sender);
  if StrToFloat(LabeledEdit10.Text)>=StrToFloat(LabeledEdit11.Text) then
    if Sender=LabeledEdit10 then LabeledEdit10.Text:=a
    else LabeledEdit11.Text:=b;
  a:=LabeledEdit10.Text;
  b:=LabeledEdit11.Text
end;

procedure TReverseForm.Button3Click(Sender: TObject);
begin
  ComboBox1.Clear;
  TextListBox1.Clear
end;

procedure TReverseForm.ComboBox1Change(Sender: TObject);
begin
  TextListBox1.Clear
end;

procedure TReverseForm.AddP;
begin
  with ActiveChild.Memo1 do
  begin
    if first then
    begin
      first:=false;
      Text:=Text+otstup+'Обратный ход:'
    end;
    Text:=Text+otstup+'p = '+ComboBox1.Text
  end
end;

procedure TReverseForm.Button2Click(Sender: TObject);
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

procedure TReverseForm.LabeledEdit8Exit(Sender: TObject);
begin
  LabeledEdit13Exit(Sender);
  if StrToFloat(LabeledEdit8.Text)<=0 then LabeledEdit8.Text:='1'
end;

procedure TReverseForm.TextListBox1Click(Sender: TObject);
begin
  AddP;
  ActiveChild.Memo1.Lines.Add(TextListBox1.Items[TextListBox1.ItemIndex])
end;

procedure TReverseForm.LabeledEdit8Change(Sender: TObject);
begin
  Chart1.Enabled:=false;
  Series1.Clear;
  Series2.Clear
end;

function TReverseForm.f(p: Real): Real;
var
  i: Integer;
  s: Shortint;
begin
  Result:=0;
  s:=-1;
  for i:=1 to szVl do
  begin
    Result:=Result+s*Vl[i-1]*IntPower(1-p,szVl-i)*IntPower(p,i-1);
    s:=-s
  end;
  Result:=StrToFloat(LabeledEdit8.Text)*Result
end;

procedure TReverseForm.Button4Click(Sender: TObject);
var
  i,n: Integer;
begin
  Series1.Clear;
  Series2.Clear;
  n:=StrToInt(LabeledEdit9.Text);
  for i:=0 to n do
  begin
    Series1.AddXY(i/n,0);
    Series2.AddXY(i/n,f(i/n))
  end;
  if not Chart1.Enabled then Chart1.Enabled:=true
end;

procedure TReverseForm.Button6Click(Sender: TObject);
begin
  if SaveDialog.Execute then
    Chart1.SaveToBitmapFile(SaveDialog.FileName)
end;

procedure TReverseForm.Button5Click(Sender: TObject);
var
  i,n: Integer;
  a,h,eps,p,p1,fp,Afp,fp1,Afp1,min,fmin: Real;
  flag: Boolean;
begin
  n:=StrToInt(LabeledEdit12.Text);
  a:=StrToFloat(LabeledEdit10.Text);
  eps:=StrToFloat(LabeledEdit13.Text);
  h:=(StrToFloat(LabeledEdit11.Text)-a)/n;
  flag:=true;
  for i:=0 to n do
  begin
    if i<>0 then
    begin
      p1:=p;
      fp1:=fp
    end;
    p:=a+h*i;
    fp:=f(p);
    Afp:=Abs(fp);
    if Afp<=eps then
    begin
      if flag then
      begin
        flag:=false;
        min:=p;
        fmin:=Afp
      end
      else if Afp<fmin then
      begin
        min:=p;
        fmin:=Afp
      end
    end
    else if not flag then
    begin
      ComboBox1.Items.Add(FloatToStr(min));
      flag:=true
    end;
    Afp1:=Abs(fp1);
    if (i<>0) and (Sign(fp)<>Sign(fp1)) then
      ComboBox1.Items.Add(FloatToStr((p*Afp1+p1*Afp)/(Afp+Afp1)))
  end
end;

function TReverseForm.diff(p: Real): Real;
const
  dp=1e-8;
begin
  Result:=(f(p+dp)-f(p))/dp
end;

procedure TReverseForm.ErrNewton;
begin
  MessageDlg('Невозможно найти корень по методу Ньютона',mtError,[mbOk],0)
end;

procedure TReverseForm.Button7Click(Sender: TObject);
var
  p,d,eps: Real;
begin
  p:=StrToFloat(LabeledEdit19.Text);
  eps:=StrToFloat(LabeledEdit18.Text);
  if eps=0 then
  begin
    ErrNewton;
    exit
  end;
  try
    d:=f(p)/diff(p);
    while true do
      if (p<0) or (p>1) then break
      else if Abs(d)<=eps then
      begin
        ComboBox1.Items.Add(FloatToStr(p));
        break
      end
      else
      begin
        p:=p-d;
        d:=f(p)/diff(p)
      end
  except
    ErrNewton
  end
end;

procedure TReverseForm.Button1Click(Sender: TObject);
var
  p: Extended;
  i,j,m,l: Integer;
  a: array of Extended;
  buf1,buf2: Extended;
  st: String;
  MReal: OleVariant;
  MImage: OleVariant;
begin
  Val(ComboBox1.Text,p,i);
  if (i<>0) or (p<=0) or (p>=1) then
    MessageDlg('Неправильное значение верояности',mtError,[mbOk],0)
  else
  begin
    m:=StrToInt(LabeledEdit1.Text);
    SetLength(a,szVl);
    l:=szVl-1;
    for i:=0 to l do a[i]:=Vl[i];
    if CheckBox1.Checked then
    begin
      st:='P=[';
      for i:=0 to l do
      begin
        for j:=0 to i-1 do st:=st+' 0';
        if i<>l then
        begin
          st:=st+' '+ComboBox1.Text;
          st:=st+' '+FloatToStr(1-p)
        end
        else st:=st+' 1';
        for j:=i+2 to l do st:=st+' 0';
        if i<>l then st:=st+';'
      end;
      MATLAB.Execute('format long e');
      MATLAB.Execute(st+']');
      MReal:=VarArrayCreate([0, 0, 0, l],varDouble);
      MImage:=VarArrayCreate([0, 0, 0, l],varDouble);
      for j:=1 to m do
      begin
        st:='b=[';
        for i:=0 to l do st:=st+' '+FloatToStr(a[i]);
        MATLAB.Execute(st+']; X=b/P');
        MATLAB.GetFullMatrix('X','base',VarArrayRef(MReal),VarArrayRef(MImage));
        st:='';
        for i:=0 to l do
        begin
          a[i]:=MReal[0,i];
          st:=st+FloatToStr(a[i]);
          if i<>l then st:=st+' '
        end;
        TextListBox1.Items.Add(st+m_eq+IntToStr(j))
      end;
      MReal:=UnAssigned;
      MImage:=UnAssigned
    end
    else
    begin
      j:=1;
      while j<=m do
      begin
        buf1:=0;
        st:='';
        for i:=l downto 0 do
        begin
          buf2:=(a[i]-buf1*p)/(1-p);
          a[i]:=buf1;
          buf1:=buf2;
          if i<l-1 then st:=' '+st;
          if i<>l then st:=FloatToStr(a[i])+st
        end;
        for i:=1 to j do st:=st+' 0';
        dec(l);
        if st<>'' then TextListBox1.Items.Add(st+m_eq+IntToStr(j));
        inc(j)
      end
    end
  end
end;

procedure TReverseForm.Button8Click(Sender: TObject);
begin
  TextListBox1.Clear
end;

end.
