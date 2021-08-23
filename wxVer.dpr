library wxVer;

uses
  System.SysUtils,
  Winapi.Windows,
  Vcl.Forms,
  System.Classes,
  Unit2 in 'Unit2.pas' {Form2},
  u_debug in 'u_debug.pas',
  Method1 in 'Method1.pas';

type
  Test = record
    a: Integer;
    b: Integer;
  end;
{$R *.res}
//  procedure ff();
//  begin
//    Application.Terminate;
//  end;
//  exports ff;

function MyThreadFun(var Param: Test): Integer; stdcall;
begin
  if Form2 = nil then
    Form2 := tform2.Create(nil);
  form2.ShowModal;
  Result := 0;
end;



procedure DLLEntryInit(fdwReason: DWord);
var
  Id: Dword;
  P: test;
begin
  case (fdwReason) of
    DLL_PROCESS_ATTACH:
      begin
        P.a := 5;
        Createthread(nil, 0, @MyThreadFun, @P, 0, Id);
//   var hw:=    GetModuleHandleW('WeChatWin.dll');
//     hw:=    hw+$3f2a20     ;
//      CreateThread(nil,0,@hw,0,0,id);
      end;

    DLL_PROCESS_DETACH:
      ;
    DLL_THREAD_ATTACH:
      ;
    DLL_THREAD_DETACH:
      ;
  end;
end;

begin
  DllProc := @DLLEntryInit;
  DLLEntryInit(DLL_PROCESS_ATTACH);
end.

