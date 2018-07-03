library HISDHC;

uses
  ComServ,
  HISDHC_TLB in 'HISDHC_TLB.pas',
  DHC in 'DHC.pas',
  RegShareDoc in 'RegShareDoc.pas';

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.RES}

begin
end.
