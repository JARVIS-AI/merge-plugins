unit mpProgressForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls,
  mpLogger, mpTracker;

type
  TProgressForm = class(TForm)
    ProgressBar: TProgressBar;
    ProgressLabel: TLabel;
    DetailsButton: TButton;
    LogMemo: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure DetailsButtonClick(Sender: TObject);
    procedure ProgressMessage(const s: string);
    procedure UpdateProgress(const i: integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ProgressForm: TProgressForm;

implementation

{$R *.dfm}

procedure TProgressForm.ProgressMessage(const s: string);
begin
  if Pos(' ', s) <> 1 then
    ProgressLabel.Caption := s;
  LogMemo.Lines.Add(s);
end;

procedure TProgressForm.UpdateProgress(const i: integer);
begin
  ProgressBar.StepBy(i);
end;

procedure TProgressForm.DetailsButtonClick(Sender: TObject);
begin
  DetailsButton.Visible := false;
  LogMemo.Visible := true;
  Height := 435;
end;

procedure TProgressForm.FormCreate(Sender: TObject);
begin
  Tracker.OnLogEvent := ProgressMessage;
  Tracker.OnProgressEvent := UpdateProgress;
end;

end.
