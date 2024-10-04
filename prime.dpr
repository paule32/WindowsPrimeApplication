program prime;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  gmp_lib in 'gmp_lib.pas',
  gmp_obj in 'gmp_obj.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
