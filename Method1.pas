unit Method1;

interface
 uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, tlhelp32,
  PsAPI, Vcl.StdCtrls, Vcl.ExtCtrls, u_debug;

var
  jmpCode: array[0..4] of Byte;
    jmpCodeExt: array[0..5] of Byte;

  procedure F1(new_addr,HookAddress:pointer);
  procedure F1Ext(new_addr,HookAddress:pointer);
implementation


procedure F1(new_addr,HookAddress:pointer);
begin

  ZeroMemory(@jmpcode[0], 5);
  jmpCode[0] := $E9;
//	*(DWORD*)&jmpCode[1] = (DWORD)HookFun - HookAddress - 5;
//jmpCode[1]:=    Pointer(HookAddress)
  var tmp: dword;
//  iix := NativeInt(@new_addr) - NativeInt(Pointer(HookAddress)) - 5;
 tmp := NativeInt(new_addr) - NativeInt(HookAddress) - 5;
  move(tmp, jmpcode[1], 4);
//  debug.show('------------------' + iix.ToHexString);
//  debug.Show('--------------------' + dword(jmpcode[1]).ToHexString);
  var xv: SIZE_T;
  WriteProcessMemory(GetCurrentProcess(), Pointer(HookAddress), @jmpCode[0], 5, xv);
end;



procedure F1Ext(new_addr,HookAddress:pointer);
begin

  ZeroMemory(@jmpCodeExt[0], 6);
  jmpCodeExt[0] := $E9; //jmp
  jmpCodeExt[5] := $90; //nop
//	*(DWORD*)&jmpCode[1] = (DWORD)HookFun - HookAddress - 5;
//jmpCode[1]:=    Pointer(HookAddress)
  var tmp: dword;
//  iix := NativeInt(@new_addr) - NativeInt(Pointer(HookAddress)) - 5;
 tmp := NativeInt(new_addr) - NativeInt(HookAddress) - 5;
  move(tmp, jmpCodeExt[1], 4);
//  debug.show('------------------' + iix.ToHexString);
//  debug.Show('--------------------' + dword(jmpcode[1]).ToHexString);
  var xv: SIZE_T;
  WriteProcessMemory(GetCurrentProcess(), Pointer(HookAddress), @jmpCodeExt[0], 6, xv);
end;
end.
