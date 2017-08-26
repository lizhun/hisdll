library HISDHC;

uses
  ComServ,
  HISDHC_TLB in 'HISDHC_TLB.pas',
  DHC in 'DHC.pas';

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.RES}

begin
end.
