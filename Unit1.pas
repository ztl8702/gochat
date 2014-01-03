unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, WinSkinData, Sockets, ExtCtrls, ComCtrls, Buttons,
  ToolWin, te_forms, te_controls, te_extctrls, ImgList, IdBaseComponent,
  IdComponent, IdIPWatch, Menus, CoolTrayIcon, TextTrayIcon, WinSkinStore;

type
  TForm1 = class(TForm)
    TcpClient1: TTcpClient;
    TcpServer1: TTcpServer;
    SkinData1: TSkinData;
    memSend: TMemo;
    btnSend: TButton;
    EditLocal: TEdit;
    LabelLocal: TLabel;
    btnChangeLocal: TButton;
    Shape1: TShape;
    RcRecv: TRichEdit;
    StatusBar1: TStatusBar;
    TeSpeedButton1: TTeSpeedButton;
    RcImp: TRichEdit;
    ILTool: TImageList;
    ILHead: TImageList;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Image1: TImage;
    GroupBox2: TGroupBox;
    Shape2: TShape;
    Label2: TLabel;
    Image2: TImage;
    IdIPWatch1: TIdIPWatch;
    Label3: TLabel;
    Label4: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    E1: TMenuItem;
    S1: TMenuItem;
    H1: TMenuItem;
    CoolTrayIcon1: TCoolTrayIcon;
    N2: TMenuItem;
    HA1: TMenuItem;
    procedure btnChangeLocalClick(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure systemwrite(s:string);
    procedure mywrite(s:ansistring);
    procedure noimp;
    function changeimg(num:integer):Tbitmap;
    procedure TcpServer1Accept(Sender: TObject;
      ClientSocket: TCustomIpClient);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure H1Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure CoolTrayIcon1Click(Sender: TObject);
    procedure HA1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  myname,hisname:string[12];
  myhead,hishead:integer;

implementation

uses Unit2, Unit3;

{$R *.dfm}

procedure TForm1.btnChangeLocalClick(Sender: TObject);
begin
      TcpServer1.LocalPort := '2008';
      TcpServer1.Active := True;
      memsend.SetFocus;
end;

procedure TForm1.btnSendClick(Sender: TObject);
var
  I,j: Integer;
begin
  if memsend.lines.Count=0 then exit;
  TcpClient1.RemoteHost := EditLocal.Text;
  TcpClient1.RemotePort := '2008';
  try
    if TcpClient1.Connect then
      begin
        TcpClient1.Sendln(myname);
        TcpClient1.Sendln(inttostr(myhead));
        for I := 0 to memSend.Lines.Count - 1 do
        TcpClient1.Sendln(memSend.Lines[I]);
      end;
  finally
    TcpClient1.Disconnect;
  end;
  systemwrite('我说:');
  for j:=0 to memsend.Lines.count-1 do mywrite(memsend.Lines[j]);
  memSend.Lines.Clear;
  memsend.SetFocus;
end;

procedure TForm1.systemwrite(s:string);
begin
  RcRecv.SelAttributes.Color:=clGray;//设置字体颜色
  RcRecv.Lines.Add(s);
  RcRecv.SelAttributes.Color:=clBlack
end;
procedure TForm1.mywrite(s:ansistring);
begin
  RcRecv.SelAttributes.Color:=clBlack;//设置字体颜色
  RcRecv.Lines.Add(s);
end;

procedure TForm1.TcpServer1Accept(Sender: TObject;
  ClientSocket: TCustomIpClient);
var
  s,nname:string;nhead:integer;
begin

  // Load the Threads ListBuffer

  nname:= ClientSocket.Receiveln;
  nhead:= strtoint(ClientSocket.Receiveln);
  systemwrite(hisname+'(' + ClientSocket.RemoteHost + ')'+'说:');
  s := ClientSocket.Receiveln;
  while s <> '' do
  begin
    mywrite(s);
    s := ClientSocket.Receiveln;
  end;
  statusbar1.Panels[0].Text:='最后一条消息收于'+formatdatetime('YYYY-MM-DD HH:MM:SS',NOW);
  if nname<>hisname then begin
    label1.Caption:=nname;
    hisname:=nname;
  end;
  if nhead<>hishead then begin
    image1.Picture.Bitmap:=changeimg(nhead);
    hishead:=nhead;
  end;
end;

procedure TForm1.noimp;
begin
  rcimp.Hide;
  rcrecv.Height:=rcrecv.Height+35;
  rcrecv.Top:=rcrecv.Top-35;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  application.Title:=self.Caption;
  self.Icon:=application.Icon;
  RcRecv.Clear;
  memsend.Lines.Clear;
  rcimp.clear;
  rcimp.Lines.Add('在聊天之前请输入对方的IP地址，并单击“更改”按钮。请不要在聊天过程中泄露您的密码等信息。');
  Label1.Caption:='';
  myname:='';
  myhead:=0;
  image2.Picture.Bitmap:=changeimg(myhead);
  image1.Picture.Bitmap:=changeimg(myhead);
  Label2.Caption:=myname;
  Label3.Caption:=label3.Caption+IdIPWatch1.LocalIP;
  //statusbar1.Panels[1].text:='内网IP:'+IdIPWatch1.LocalIP;
  coolTrayIcon1.Icon:=application.Icon;
end;

function TForm1.changeimg(num:integer):Tbitmap;
 var img:Tbitmap;
begin
  img := TBitmap.Create;
  ILHead.GetBitmap(num, img);
  changeimg:=img;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  wordface.show;
end;

procedure TForm1.Label4Click(Sender: TObject);
begin
  editname.ShowModal;
end;

procedure TForm1.S1Click(Sender: TObject);
begin
  editname.showmodal;
end;

procedure TForm1.H1Click(Sender: TObject);
begin
  self.Hide;
  cooltrayicon1.IconVisible:=true;
end;

procedure TForm1.E1Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TForm1.CoolTrayIcon1Click(Sender: TObject);
begin
  self.show;
  cooltrayicon1.IconVisible:=false;
end;

procedure TForm1.HA1Click(Sender: TObject);
begin
  ShowMessage('                 点对点聊天'#13#13'藏宝库软件开发工作室[Canboc Software Studio]');
end;

end.
