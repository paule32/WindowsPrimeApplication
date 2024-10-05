﻿unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Menus,
  gmp_lib, gmp_obj;

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
    Label8: TLabel;
    RichEdit2: TRichEdit;
    Label9: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer2Timer(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
  public
    in_zahl_0: Integer;
    graph_zahl: Integer;

    Fseconds: Integer;

    twin_zahl_old: mpz_t;
    twin_zahl    : mpz_t;

    gap_zahl     : mpz_t;
    gap_zahl_old : mpz_t;

    input_number : mpz_t;

    p, in_zahl_2 : mpz_t;
    a, b         : mpz_t;
    z1, z2, z3   : mpz_t;
  end;

var
    Form1: TForm1;

    // Vorbelegung des prim_array
    prim_array : Array[0..15] of AnsiString = (
         '2', '3', '5', '7','11','13','17','19','23','29',
        '31','37','41','43','47','53'
    );

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

    if mpz_set_str(gap_zahl_old,
    PAnsiChar(AnsiString('0')), 10) <> 0
    then
    raise Exception.Create('invalid "gap_zahl_old" string.');

    if mpz_set_str(twin_zahl_old,
    PAnsiChar(AnsiString('0')), 10) <> 0
    then
    raise Exception.Create('invalid "twin_zahl_old" string.');

    if mpz_set_str(twin_zahl,
    PAnsiChar(AnsiString('0')), 10) <> 0
    then
    raise Exception.Create('invalid "twin_zahl" string.');

    Edit3.Text := mpz_get_str(nil, 10, gap_zahl_old);

    if mpz_set_str(input_number,
    PAnsiChar(AnsiString(Trim(Edit3.Text))), 10) <> 0
    then
    raise Exception.Create('invalide "mpz_set_str" string.');


    Button1.Enabled := false;
    Timer1.Interval := StrToInt(Edit2.Text);
    Timer1.Enabled := true;
    Timer2.Enabled := true;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
    Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    // initialization ...
    mpz_init(input_number);

    mpz_init(twin_zahl_old);
    mpz_init(twin_zahl);

    mpz_init(gap_zahl_old);
    mpz_init(in_zahl_2);

    mpz_init(a);
    mpz_init(b);

    mpz_init(z1);
    mpz_init(z2);
    mpz_init(z3);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
    // clean up
    mpz_clear(input_number);

    mpz_clear(twin_zahl_old);
    mpz_clear(twin_zahl);

    mpz_clear(gap_zahl_old);
    mpz_clear(in_zahl_2);

    mpz_clear(a);
    mpz_clear(b);

    mpz_clear(z1);
    mpz_clear(z2);
    mpz_clear(z3);
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
    s: String;
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
    graph_zahl  := graph_zahl  + 4 ;
    GreenStartX := Rect.Left   + 2 + graph_zahl;
    GreenEndX   := GreenStartX + 7;

    // Berechne die Y-Positionen für den Anfang und das Ende des grünen Bereichs
    EndY   := Rect.Bottom;
    StartY := Rect.Bottom - 10 *  1;

    // Setze die Farbe für den grünen Bereich
    PaintBox1.Canvas.Brush.Color := clGreen;
    PaintBox1.Canvas.Brush.Style := bsSolid;

    // Zeichne das gefüllte Rechteck für den grünen Bereich
    GreenRect := Rect.Create(GreenStartX, StartY, GreenEndX, EndY);
    PaintBox1.Canvas.FillRect(GreenRect);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
    prime: Boolean;
    s1, s2: String;
    i: Integer;
begin
    graph_zahl := 1;

    if mpz_set_str(z1,
    PAnsiChar(AnsiString(Trim(Edit1.Text))), 10) <> 0
    then
    raise Exception.Create('invalid "twin 0" string.');

    for i := Low(prim_array) to High(prim_array) do
    begin
        mpz_set(a, input_number);

        if mpz_set_str(b,
        PAnsiChar(AnsiString(prim_array[i])), 10) <> 0
        then
        raise Exception.Create('invalid "prime array" string.');

        mpz_mod(in_zahl_2, a, b);

        if mpz_cmp_ui(in_zahl_2, 0) <> 0 then
        begin
            prime := true;
        end else
        begin
            prime := false;
            break;
        end;
    end;

    if prime then
    begin
        s1 := Edit1.Text;
        RichEdit1.Lines.Insert(0, s1);
    end;

    if not checkbox1.checked then
    begin
        Timer1.Enabled := false;
        Timer2.Enabled := false;
        Button1.Enabled := true;
        exit;
    end;

    // zwilling ?
    if RichEdit1.Lines.Count > 1 then
    begin
        if mpz_set_str(z1,
        PAnsiChar(AnsiString(RichEdit1.Lines.Strings[0])), 10) <> 0
        then
        raise Exception.Create('invalid "twin 0" string.');

        if mpz_set_str(z2,
        PAnsiChar(AnsiString(RichEdit1.Lines.Strings[1])), 10) <> 0
        then
        raise Exception.Create('invalid "twin 1" string.');

        // check for twins:
        mpz_sub(z3, z1, z2);

        if (prime = true) and (mpz_cmp_ui(z3, 2)  = 0) then
        begin
            s1 := mpz_get_str(nil, 10, z1);
            s2 := mpz_get_str(nil, 10, z2);

            RichEdit2.Lines.Insert(0,Format('%s, %s',[s1, s2]));
        end;
    end;

    mpz_set_ui(b, 1);
    mpz_add(input_number, input_number, b);

    // reduziere Resourcenverbrauch ...
    if RichEdit1.Lines.Count >= 50 then
    begin
        Timer1.Enabled := false;
        Timer2.Enabled := false;

        s1 := RichEdit1.Lines.Strings[0]; // Erste Zeile speichern

        RichEdit1.Lines.Clear;
        RichEdit1.Lines.Add(s1);

        Timer1.Enabled := True;
        Timer2.Enabled := True;
    end;

    if mpz_cmp(gap_zahl,gap_zahl_old) > 0 then
    begin
        Edit3.Text := mpz_get_str(nil, 10, gap_zahl);
        mpz_set(gap_zahl_old, gap_zahl);
    end;

    // text
    Edit1.Text     := mpz_get_str(nil, 10, input_number);
    Panel2.Caption := mpz_get_str(nil, 10, gap_zahl);

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
