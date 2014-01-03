unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, te_forms, te_controls;

type
  TEditName = class(TForm)
    LabeledEdit2: TLabeledEdit;
    Button1: TButton;
    Button2: TButton;
    labelededit1: TTeSpinEdit;
    Label1: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditName: TEditName;

implementation

uses Unit1;

{$R *.dfm}

procedure TEditName.Button2Click(Sender: TObject);
begin
  self.Close;
end;

procedure TEditName.Button1Click(Sender: TObject);
begin
  if length(labelededit2.Text)>12 then begin showmessage('昵称不能超过12个字符或6个汉字!');
                                             exit;
                                       end;
  if (strtoint(labelededit1.text)>1)or(strtoint(labelededit1.text)<0) then begin showmessage('头像ID必须介于0~1!');
                                             exit;
                                       end;
  myhead:=strtoint(labelededit1.Text);
  myname:=labelededit2.Text;
  form1.Label2.Caption:=myname;
  form1.Image2.Picture.Bitmap:=form1.changeimg(myhead);
  self.Close;
end;

procedure TEditName.FormCreate(Sender: TObject);
begin
  labelededit1.Text:=inttostr(myhead);
  labelededit2.Text:=myname;
end;

end.
