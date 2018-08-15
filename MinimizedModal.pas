unit MinimizedModal;

interface

uses Forms, Classes, ExtCtrls, AppEvnts;

type
  TMinimizedModal = class(TComponent)
    constructor Create(AOwner: TComponent); override;
  private
    ModalForm: TForm;
    Timer1: TTimer;
    ApplicationEvents1: TApplicationEvents;
    procedure Timer1Timer(Sender: TObject);
    procedure ApplicationEvents1Restore(Sender: TObject);
  end;

implementation

constructor TMinimizedModal.Create(AOwner: TComponent);
begin
  inherited;
  ModalForm:=AOwner as TForm;
  ApplicationEvents1:=TApplicationEvents.Create(Self);
  ApplicationEvents1.OnRestore:=ApplicationEvents1Restore;
  Timer1:=TTimer.Create(Self);
  Timer1.Interval:=50;
  Timer1.OnTimer:=Timer1Timer;
  Timer1.Enabled:=true
end;

procedure TMinimizedModal.Timer1Timer(Sender: TObject);
begin
  if ModalForm.WindowState=wsMinimized then
  begin
    Timer1.Enabled:=false;
    Application.Minimize
  end
end;

procedure TMinimizedModal.ApplicationEvents1Restore(Sender: TObject);
begin
  ModalForm.WindowState:=wsNormal;
  Timer1.Enabled:=true
end;

end.
