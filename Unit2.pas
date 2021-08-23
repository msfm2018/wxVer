unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, tlhelp32,
  PsAPI, Vcl.StdCtrls, Vcl.ExtCtrls, u_debug, Vcl.ComCtrls, Vcl.Mask;

type
  TForm2 = class(TForm)
    Button1: TButton;
    MaskEdit1: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  public
  end;

var
  Form2: TForm2;
  HookAddress: dword;
  g_baseaddr: Nativeuint;

implementation
{$R *.dfm}

procedure ChangeVer(v: dword);
var
  lpNumberOfBytesWritten: SIZE_T;
begin
    const _OFFSET = $1275910;
    var DwCall1 := g_baseaddr + _OFFSET;
    writeprocessmemory(GetCurrentProcess, Pointer(DwCall1), @v, 4, lpNumberOfBytesWritten);
  end;


procedure TForm2.Button1Click(Sender: TObject);
var
  ver: string;  //  版本号生成规则       3.2.0.58=630200hex(58)
begin

  ver := MaskEdit1.Text;
  var vv := ver.Split(['.']);
  var v0 := '6' + vv[0];
  var v1 := '0' + vv[1];
  var v2 := '0' + vv[2];
  var v3 := IntToHex(vv[3].ToInteger, 2);
  var gg := '$' + v0 + v1 + v2 + v3;
  var ii := strtoint(gg);
  ChangeVer(ii);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  g_baseaddr := GetModuleHandle('WeChatWin.dll');

end;

end.

