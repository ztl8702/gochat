unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TWordFace = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WordFace: TWordFace;

implementation

uses Unit1;

{$R *.dfm}

procedure TWordFace.FormCreate(Sender: TObject);
begin
  self.Top:=form1.top;
  self.Left:=form1.left;
end;

end.
