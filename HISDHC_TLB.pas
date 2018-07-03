unit HISDHC_TLB;

// ************************************************************************ //
// WARNING
// -------
// The types declared in this file were generated from data read from a
// Type Library. If this type library is explicitly or indirectly (via
// another type library referring to this type library) re-imported, or the
// 'Refresh' command of the Type Library Editor activated while editing the
// Type Library, the contents of this file will be regenerated and all
// manual modifications will be lost.
// ************************************************************************ //

// $Rev: 17244 $
// File generated on 2014/9/26 星期五 15:32:58 from Type Library described below.

// ************************************************************************  //
// Type Lib: E:\CODE\delphi\hisdll\HISDHC (1)
// LIBID: {C8B52066-33B9-4F61-AEA0-BCBBE65BC7E6}
// LCID: 0
// Helpfile:
// HelpString:
// DepndLst:
// (1) v2.0 stdole, (C:\Windows\SysWow64\stdole2.tlb)
// (2) v4.0 StdVCL, (C:\Windows\SysWOW64\stdvcl40.dll)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers.
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Windows, ActiveX, Classes, StdVCL, Variants, IniFiles, SysUtils, DHC,RegShareDoc,
  SOAPHTTPClient;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:
// Type Libraries     : LIBID_xxxx
// CoClasses          : CLASS_xxxx
// DISPInterfaces     : DIID_xxxx
// Non-DISP interfaces: IID_xxxx
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  HISDHCMajorVersion = 1;
  HISDHCMinorVersion = 0;

  LIBID_HISDHC: TGUID = '{C8B52066-33B9-4F61-AEA0-BCBBE65BC7E6}';

implementation

uses ComObj;

var
  gwebsvrurl: string;
  gwebsvrdocurl: string;
  isDebug: Boolean;

function WriteTxt(strWrite: WideString): Boolean;
var
  wLogFile: TextFile;
  DateTime: TDateTime;
  strTxtName, strContent: string;
begin
  DateTime := now;
  strTxtName := FormatdateTime('yyyy-mm-dd', DateTime) + '_WSLog.txt';
  AssignFile(wLogFile, strTxtName);
  if FileExists(strTxtName) then
    Append(wLogFile)
  else
  begin
    ReWrite(wLogFile);
  end;
  strContent := FormatdateTime('tt', DateTime) + ' ' + strWrite;
  Writeln(wLogFile, strContent);
  CloseFile(wLogFile);
  Result := true;
end;

function GetWebSVRUrl: string;
var
  myinifile: TIniFile;
begin
  if gwebsvrurl = '' then
  begin
    if FileExists('weburl.ini') then
    begin
      myinifile := TIniFile.create(getcurrentdir + '\weburl.ini'); //
      gwebsvrurl := myinifile.readstring('webservice', 'url', ''); //
      isDebug := myinifile.ReadBool('webservice', 'debug', False); // 
      FreeAndNil(myinifile);
    end
    else
    begin
      gwebsvrurl := 'http://172.18.0.36/csp/i-ris/DHC.RIS.BS.WebRisService.cls?wsdl';
    end;
  end;
  Result := gwebsvrurl;
end;

function GetDocWebSVRUrl: string;
var
  myinifile: TIniFile;
begin
  if gwebsvrdocurl = '' then
  begin
    if FileExists('weburl.ini') then
    begin
      myinifile := TIniFile.create(getcurrentdir + '\weburl.ini'); //
      gwebsvrdocurl := myinifile.readstring('webservice', 'docurl', ''); //
      isDebug := myinifile.ReadBool('webservice', 'debug', False); //
      FreeAndNil(myinifile);
    end
    else
    begin
      gwebsvrdocurl := 'http://172.18.53.34/csp/hsb/hsb.DhcEns.BS.WebMOHDocumentService.cls?wsdl';
    end;
  end;
  Result := gwebsvrdocurl;
end;

function BookedInfo(Input: PWideChar): PWideChar; stdcall;
var
  rio: THTTPRIO;
  str: WideString;
  soap: DHC.WebRisServiceSoap;
begin
  try
    rio := THTTPRIO.create(nil);
    soap := DHC.GetWebRisServiceSoap(true, GetWebSVRUrl, rio);
    if isDebug then
    begin
      WriteTxt(Input);
    end;
    // str := soap.BookedInfo(widestring(Input));
    str := soap.DHCWebInterface('RisBookedInfo', WideString(Input));
    if isDebug then
    begin
      WriteTxt(str);
    end;
    Result := PWideChar(str);
  except
    on ex: Exception do
      if isDebug then
      begin
        WriteTxt(ex.Message);
      end;
  end;
end;

function CancelBookedInfo(const Input: PWideChar): PWideChar; stdcall;
var
  rio: THTTPRIO;
  str: WideString;
  soap: DHC.WebRisServiceSoap;
begin
  try
    if isDebug then
    begin
      WriteTxt(str);
    end;
    rio := THTTPRIO.create(nil);
    soap := DHC.GetWebRisServiceSoap(true, GetWebSVRUrl, rio);
    // str := soap.CancelBookedInfo(widestring(Input));
    str := soap.DHCWebInterface('RisCancelBookedInfo', WideString(Input));
    if isDebug then
    begin
      WriteTxt(Input);
    end;
    Result := PWideChar(str);

  except
    on ex: Exception do
      if isDebug then
      begin
        WriteTxt(ex.Message);
      end;

  end;
end;

function CancelFeeApp(const Input: PWideChar): PWideChar; stdcall;
var
  rio: THTTPRIO;
  str: WideString;
  soap: DHC.WebRisServiceSoap;
begin
  if isDebug then
  begin
    WriteTxt(Input);
  end;
  rio := THTTPRIO.create(nil);
  soap := DHC.GetWebRisServiceSoap(true, GetWebSVRUrl, rio);
  // str := soap.CancelFeeApp(widestring(Input));
  str := soap.DHCWebInterface('RisCancelFeeApp', WideString(Input));
  if isDebug then
  begin
    WriteTxt(str);
  end;
  Result := PWideChar(str);
end;

function CancelReport(const Input: PWideChar): PWideChar; stdcall;
var
  rio: THTTPRIO;
  str: WideString;
  soap: DHC.WebRisServiceSoap;
begin
  if isDebug then
  begin
    WriteTxt(Input);
  end;
  rio := THTTPRIO.create(nil);
  soap := DHC.GetWebRisServiceSoap(true, GetWebSVRUrl, rio);
  // str := soap.CancelReport(widestring(Input));
  str := soap.DHCWebInterface('RisCancelReport', WideString(Input));
  if isDebug then
  begin
    WriteTxt(str);
  end;
  Result := PWideChar(str);
end;

function CheckComplete(const Input: PWideChar): PWideChar; stdcall;
var
  rio: THTTPRIO;
  str: WideString;
  soap: DHC.WebRisServiceSoap;
begin
  if isDebug then
  begin
    WriteTxt(Input);
  end;
  rio := THTTPRIO.create(nil);
  soap := DHC.GetWebRisServiceSoap(true, GetWebSVRUrl, rio);
  // str := soap.CheckComplete(widestring(Input));
  str := soap.DHCWebInterface('RisCheckComplete', WideString(Input));
  if isDebug then
  begin
    WriteTxt(str);
  end;
  Result := PWideChar(str);
end;

function GetAppForm(const Input: PWideChar): PWideChar; stdcall;
var
  rio: THTTPRIO;
  str: WideString;
  soap: DHC.WebRisServiceSoap;
begin
  if isDebug then
  begin
    WriteTxt(Input);
  end;
  rio := THTTPRIO.create(nil);
  soap := DHC.GetWebRisServiceSoap(true, GetWebSVRUrl, rio);
  // str := soap.GetAppForm(widestring(Input));
  str := soap.DHCWebInterface('GetAppForm', WideString(Input));
  if isDebug then
  begin
    WriteTxt(str);
  end;

  Result := PWideChar(str);
end;

function GetDictInfo(const Input: PWideChar): PWideChar; stdcall;
var
  rio: THTTPRIO;
  str: WideString;
  soap: DHC.WebRisServiceSoap;
begin
  try
    if isDebug then
    begin
      WriteTxt(Input);
    end;
    rio := THTTPRIO.create(nil);
    soap := DHC.GetWebRisServiceSoap(true, GetWebSVRUrl, rio);
    // str := soap.GetDictInfo(widestring(Input));
    str := soap.DHCWebInterface('GetDictInfo', WideString(Input));
    if isDebug then
    begin
      WriteTxt(str);
    end;
    Result := PWideChar(str);
  except
    on ex: Exception do
      if isDebug then
      begin
        WriteTxt(ex.Message);
      end;
  end;

end;

function GetPatInfoToRIS(Input: PWideChar): PWideChar; stdcall;
var
  rio: THTTPRIO;
  str: WideString;
  soap: DHC.WebRisServiceSoap;
begin
  try
    if isDebug then
    begin
      WriteTxt(Input);
    end;
    rio := THTTPRIO.create(nil);
    soap := DHC.GetWebRisServiceSoap(true, GetWebSVRUrl, rio);
    // str := soap.GetPatInfoToRIS(widestring(Input));
    str := soap.DHCWebInterface('GetPatInfo', WideString(Input));
    if isDebug then
    begin
      WriteTxt(str);
    end;
    Result := PWideChar(str);
  except
    on ex: Exception do
      if isDebug then
      begin
        WriteTxt(ex.Message);
      end;
  end;
end;

function GetPatOrdList(Input: PWideChar): PWideChar; stdcall;
var
  rio: THTTPRIO;
  str: WideString;
  soap: DHC.WebRisServiceSoap;
begin
  try
    if isDebug then
    begin
      WriteTxt(Input);
    end;
    rio := THTTPRIO.create(nil);
    soap := DHC.GetWebRisServiceSoap(true, GetWebSVRUrl, rio);
    // str := soap.GetPatOrdList(widestring(Input));
    str := soap.DHCWebInterface('RisGetPatOrdList', WideString(Input));
    if isDebug then
    begin
      WriteTxt(str);
    end;
    Result := PWideChar(str);

  except
    on ex: Exception do
      if isDebug then
      begin
        WriteTxt(ex.Message);
      end;
  end;
end;

function RegInfo(const Input: PWideChar): PWideChar; stdcall;
var
  rio: THTTPRIO;
  str: WideString;
  soap: DHC.WebRisServiceSoap;
begin
  try
    if isDebug then
    begin
      WriteTxt(Input);
    end;
    rio := THTTPRIO.create(nil);
    soap := DHC.GetWebRisServiceSoap(true, GetWebSVRUrl, rio);
    // str := soap.RegInfo(widestring(Input));
    str := soap.DHCWebInterface('RisRegInfo', WideString(Input));
    if isDebug then
    begin
      WriteTxt(str);
    end;
    Result := PWideChar(str);
  except
    on ex: Exception do
      if isDebug then
      begin
        WriteTxt(ex.Message);
      end;
  end;
end;

function ReturnReports(const Input: PWideChar): PWideChar; stdcall;
var
  rio: THTTPRIO;
  str: WideString;
  soap: DHC.WebRisServiceSoap;
begin
  try
    if isDebug then
    begin
      WriteTxt(Input);
    end;
    rio := THTTPRIO.create(nil);
    soap := DHC.GetWebRisServiceSoap(true, GetWebSVRUrl, rio);
    // str := soap.ReturnReports(widestring(Input));
    str := soap.DHCWebInterface('RisReturnReports', WideString(Input));
    if isDebug then
    begin
      WriteTxt(str);
    end;
    Result := PWideChar(str);
  except
    on ex: Exception do
      if isDebug then
      begin
        WriteTxt(ex.Message);
      end;
  end;
end;

function SendPatOrdListToRis(const Input: PWideChar): PWideChar; stdcall;
var
  rio: THTTPRIO;
  str: WideString;
  soap: DHC.WebRisServiceSoap;
begin
  try
    rio := THTTPRIO.create(nil);
    if isDebug then
    begin
      WriteTxt(Input);
    end;
    soap := DHC.GetWebRisServiceSoap(true, GetWebSVRUrl, rio);
    // str := soap.SendPatOrdListToRis(widestring(Input));
    str := soap.DHCWebInterface('SendPatOrdListToRis', WideString(Input));
    if isDebug then
    begin
      WriteTxt(str);
    end;
    Result := PWideChar(str);
  except
    on ex: Exception do
      if isDebug then
      begin
        WriteTxt(ex.Message);
      end;
  end;
end;


function SaveAntCVResult(const Input: PWideChar): PWideChar; stdcall;
var
  rio: THTTPRIO;
  str: WideString;
  soap: DHC.WebRisServiceSoap;
begin
  try
    rio := THTTPRIO.create(nil);
    soap := DHC.GetWebRisServiceSoap(true, GetWebSVRUrl, rio);
    // str := soap.SaveAntCVResult(widestring(Input));
    if isDebug then
    begin
      WriteTxt(Input);
    end;
    str := soap.DHCWebInterface('SaveAntCVResult', WideString(Input));
    if isDebug then
    begin
      WriteTxt(str);
    end;
    Result := PWideChar(str);
  except
    on ex: Exception do
      if isDebug then
      begin
        WriteTxt(ex.Message);
      end;
  end;
end;

function DHCWebInterface(const Input: PWideChar;const Input1: PWideChar): PWideChar; stdcall;
var
  rio: THTTPRIO;
  str: WideString;
  soap: DHC.WebRisServiceSoap;
begin
  try
    rio := THTTPRIO.create(nil);
    soap := DHC.GetWebRisServiceSoap(true, GetWebSVRUrl, rio);
    if isDebug then
    begin
      WriteTxt(Input+': '+Input1);
    end;
    str := soap.DHCWebInterface(Input, WideString(Input1));
    if isDebug then
    begin
      WriteTxt(str);
    end;
    Result := PWideChar(str);
  except
    on ex: Exception do
      if isDebug then
      begin
        WriteTxt(ex.Message);
      end;
  end;
end;

function RegisterDocument(const Input: PWideChar;const Input1: PWideChar): PWideChar; stdcall;
var
  rio: THTTPRIO;
  str: WideString;
  soap: RegShareDoc.WebMOHDocumentServiceSoap;
begin
  try
    rio := THTTPRIO.create(nil);
    soap := RegShareDoc.GetWebMOHDocumentServiceSoap(true, GetDocWebSVRUrl, rio);
    if isDebug then
    begin
      WriteTxt(Input+': '+Input1);
    end;
    str := soap.HIPMessageServer(WideString(Input), WideString(Input1));
    if isDebug then
    begin
      WriteTxt(str);
    end;
    Result := PWideChar(str);
  except
    on ex: Exception do
      if isDebug then
      begin
        WriteTxt(ex.Message);
      end;
  end;
end;

function showweburl: PWideChar; stdcall;
begin
  Result := PWideChar(GetWebSVRUrl);
end;

exports BookedInfo, CancelBookedInfo, CancelFeeApp, CancelReport, CheckComplete,
  GetAppForm, GetDictInfo, GetPatInfoToRIS, GetPatOrdList, RegInfo,
  ReturnReports, SendPatOrdListToRis,  SaveAntCVResult,DHCWebInterface,RegisterDocument,
   showweburl;

end.
