unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Menus;

type
  TForm1 = class(TForm)
    RichEdit1: TRichEdit;
    Button1: TButton;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    Timer2: TTimer;
    PaintBox1: TPaintBox;
    Label4: TLabel;
    Edit2: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    Label7: TLabel;
    Edit3: TEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer2Timer(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
  private
  public
    in_zahl_0: Integer;
    graph_zahl: Integer;
    gap_zahl: Integer;
    gap_zahl_old: Integer;
    run_zahl: Integer;
    Fseconds: Integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.About1Click(Sender: TObject);
begin
  ShowMessage('Prime Searcher Version 0.0.1' +
  #10 + '(c) 2024 by Jens Kallup' +
  #10 +
  #10 + 'You can stop calculation by pressing Escape Key.');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  FSeconds := 0;

  gap_zahl_old := 0;
  Edit3.Text := IntToStr(gap_zahl_old);

  Button1.Enabled := false;
  Timer1.Interval := StrToInt(Edit2.Text);
  Timer1.Enabled := true;
  Timer2.Enabled := true;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_Escape) or (key = vk_F2) then
  begin
    Timer1.Enabled := false;
    Timer2.Enabled := false;
    Button1.Enabled := true;
  end;
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_Escape) or (key = vk_F2) then
  begin
    Timer1.Enabled := false;
    Timer2.Enabled := false;
    Button1.Enabled := true;
  end;
end;

procedure TForm1.PaintBox1Paint(Sender: TObject);
var
  rect: TRect;
  i, StartY, LineSpacing: Integer;
  GreenStartX, GreenEndX: Integer;
  Radius, EndY: Integer;
  GreenRect: TRect;
begin
  rect := TRect.Create(30,0,PaintBox1.Width,PaintBox1.Height);

  // Hintergrund
  PaintBox1.Canvas.Brush.Color := clWhite;
  PaintBox1.Canvas.FillRect(rect);

  // Rand
  rect := TRect.Create(30,1,PaintBox1.Width-1,PaintBox1.Height-1);
  PaintBox1.Canvas.Brush.Style := bsClear;
  PaintBox1.Canvas.Pen.Color := clBlack;
  PaintBox1.Canvas.Rectangle(rect);

  // Abstand zwischen den Linien
  LineSpacing := rect.Height div 16;

  PaintBox1.Canvas.Pen.Color := clNavy;

  for i := 0 to 15 do
  begin
    StartY := Rect.Top + i * LineSpacing;

    PaintBox1.Canvas.TextOut(Rect.Left - 20, StartY + 6, IntToStr(15-i));

    PaintBox1.Canvas.MoveTo(Rect.Left, StartY);
    PaintBox1.Canvas.LineTo(Rect.Right, StartY);
  end;

  // Definiere die Position des grünen Bereichs
  graph_zahl := graph_zahl + 4 ;
  GreenStartX := Rect.Left + 2 + graph_zahl;
  GreenEndX := GreenStartX + 7;

  // Berechne die Y-Positionen für den Anfang und das Ende des grünen Bereichs
  EndY := Rect.Bottom; // Y-Position der Linie 0 (unten)
  case gap_zahl of
     0: begin StartY := Rect.Bottom - 18 *  1 +  1; end;
     1: begin StartY := Rect.Bottom - 18 *  2 +  2; end;
     2: begin StartY := Rect.Bottom - 18 *  3 +  3; end;
     3: begin StartY := Rect.Bottom - 18 *  4 +  4; end;
     4: begin StartY := Rect.Bottom - 18 *  5 +  5; end;
     5: begin StartY := Rect.Bottom - 18 *  6 +  6; end;
     6: begin StartY := Rect.Bottom - 18 *  7 +  7; end;
     7: begin StartY := Rect.Bottom - 18 *  8 +  8; end;
     8: begin StartY := Rect.Bottom - 18 *  9 +  9; end;
     9: begin StartY := Rect.Bottom - 18 * 10 + 10; end;
    10: begin StartY := Rect.Bottom - 18 * 11 + 11; end;
    11: begin StartY := Rect.Bottom - 18 * 12 + 12; end;
    12: begin StartY := Rect.Bottom - 18 * 13 + 13; end;
    13: begin StartY := Rect.Bottom - 18 * 14 + 14; end;
    14: begin StartY := Rect.Bottom - 18 * 15 + 15; end;
    15: begin StartY := Rect.Bottom - 18 * 16 + 16; end;
  end;

  // Setze die Farbe für den grünen Bereich
  PaintBox1.Canvas.Brush.Color := clGreen;
  PaintBox1.Canvas.Brush.Style := bsSolid;

  // Zeichne das gefüllte Rechteck für den grünen Bereich
  GreenRect := Rect.Create(GreenStartX, StartY, GreenEndX, EndY);
  PaintBox1.Canvas.FillRect(GreenRect);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  in_zahl_2: Integer;
  in_zahl_3: Integer;
  in_zahl_5: Integer;
  in_zahl_7: Integer;
  //
  prime: Boolean;
begin
  graph_zahl := 1;
  run_zahl := 0;

  in_zahl_0 := StrToInt(Edit1.Text);

  in_zahl_2 := in_zahl_0 mod 2;
  in_zahl_3 := in_zahl_0 mod 3;
  in_zahl_5 := in_zahl_0 mod 5;
  in_zahl_7 := in_zahl_0 mod 7;

  if (in_zahl_2 <> 0) and (in_zahl_3 <> 0) and (in_zahl_5 <> 0) and (in_zahl_7 <> 0) then
  begin
    prime := true;
  end else
  begin
    prime := false;
  end;

  if prime then
  begin
    RichEdit1.Lines.Insert(0, Edit1.Text);
  end;

  if not checkbox1.checked then
  begin
    Timer1.Enabled := false;
    Timer2.Enabled := false;
    Button1.Enabled := true;
    exit;
  end;

  inc(in_zahl_0);

  if RichEdit1.Lines.Count > 0 then
  if Length(RichEdit1.Lines.Strings[0]) > 0 then
  gap_zahl := StrToInt(Edit1.Text) - StrToInt(RichEdit1.Lines.Strings[0]);
  run_zahl := run_zahl + 1;

  if gap_zahl > gap_zahl_old then
  begin
    Edit3.Text := IntToStr(gap_zahl);
    gap_zahl_old := gap_zahl;
  end;

  // text
  Edit1.Text := IntToStr(in_zahl_0);
  Panel2.Caption := Format(' %d', [gap_zahl + 1]);

  PaintBox1Paint(Sender);
end;

procedure TForm1.Timer2Timer(Sender: TObject);
var
  Hours, Minutes, Seconds: Integer;
begin
  inc(FSeconds);

  // Umrechnung der Sekunden in Stunden, Minuten und Sekunden
  Hours   :=  FSeconds div 3600;
  Minutes := (FSeconds div 60) mod 60;
  Seconds :=  FSeconds mod 60;

  Panel1.Caption := Format(' %.2d - %.2d - %.2d',
  [Hours, Minutes, Seconds]);
end;

end.

