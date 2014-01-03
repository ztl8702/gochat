program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {EditName},
  Unit3 in 'Unit3.pas' {WordFace};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TEditName, EditName);
  Application.CreateForm(TWordFace, WordFace);
  Application.Run;
end.
