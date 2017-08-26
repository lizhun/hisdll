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
//   (1) v2.0 stdole, (C:\Windows\SysWow64\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\Windows\SysWOW64\stdvcl40.dll)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers.
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}
interface

uses Windows, ActiveX, Classes,  StdVCL, Variants,IniFiles,SysUtils,DHC,SOAPHTTPClient;


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:
//   Type Libraries     : LIBID_xxxx
//   CoClasses          : CLASS_xxxx
//   DISPInterfaces     : DIID_xxxx
//   Non-DISP interfaces: IID_xxxx
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  HISDHCMajorVersion = 1;
  HISDHCMinorVersion = 0;

  LIBID_HISDHC: TGUID = '{C8B52066-33B9-4F61-AEA0-BCBBE65BC7E6}';


implementation

uses ComObj;

 var
   gwebsvrurl:string;

function GetWebSVRUrl: string;
var
  myinifile:TIniFile;
begin
  if gwebsvrurl ='' then
  begin
    if FileExists('weburl.ini') then
    begin
        myinifile := Tinifile.create(getcurrentdir+'\weburl.ini');//打开 文件。
        gwebsvrurl := myinifile.readstring('webservice','url','');//读取字符型数据。
        FreeAndNil(myinifile);
    end
    else
    begin
      gwebsvrurl := 'http://172.18.0.36/csp/i-ris/DHC.RIS.BS.WebRisService.cls?wsdl';
    end;
  end;
  Result := gwebsvrurl;
end;


function  BookedInfo(Input: PWideChar): PWideChar; stdcall;
var
   rio:THTTPRIO;
   str:WideString;
   soap :DHC.WebRisServiceSoap;
begin
   rio := THTTPRIO.Create(nil);
   soap:= DHC.GetWebRisServiceSoap(True,GetWebSVRUrl,rio);
   str := soap.BookedInfo(widestring(Input));
   Result := PWideChar(str);
end;
function  CancelBookedInfo(const Input: PWideChar): PWideChar; stdcall;
    var
   rio:THTTPRIO;
   str:WideString;
   soap :DHC.WebRisServiceSoap;
begin
   rio := THTTPRIO.Create(nil);
   soap:= DHC.GetWebRisServiceSoap(True,GetWebSVRUrl,rio);
   str := soap.CancelBookedInfo(widestring(Input));
   Result := PWideChar(str);
end;

function  CancelFeeApp(const Input: PWideChar): PWideChar; stdcall;
    var
   rio:THTTPRIO;
   str:WideString;
   soap :DHC.WebRisServiceSoap;
begin
   rio := THTTPRIO.Create(nil);
   soap:= DHC.GetWebRisServiceSoap(True,GetWebSVRUrl,rio);
   str := soap.CancelFeeApp(widestring(Input));
   Result := PWideChar(str);
end;

function  CancelReport(const Input: PWideChar): PWideChar; stdcall;
    var
   rio:THTTPRIO;
   str:WideString;
   soap :DHC.WebRisServiceSoap;
begin
   rio := THTTPRIO.Create(nil);
   soap:= DHC.GetWebRisServiceSoap(True,GetWebSVRUrl,rio);
   str := soap.CancelReport(widestring(Input));
   Result := PWideChar(str);
end;

function  CheckComplete(const Input: PWideChar): PWideChar; stdcall;
    var
   rio:THTTPRIO;
   str:WideString;
   soap :DHC.WebRisServiceSoap;
begin
   rio := THTTPRIO.Create(nil);
   soap:= DHC.GetWebRisServiceSoap(True,GetWebSVRUrl,rio);
   str := soap.CheckComplete(widestring(Input));
   Result := PWideChar(str);
end;

function  GetAppForm(const Input: PWideChar): PWideChar; stdcall;
    var
   rio:THTTPRIO;
   str:WideString;
   soap :DHC.WebRisServiceSoap;
begin
   rio := THTTPRIO.Create(nil);
   soap:= DHC.GetWebRisServiceSoap(True,GetWebSVRUrl,rio);
   str := soap.GetAppForm(widestring(Input));
   Result := PWideChar(str);
end;
function  GetDictInfo(const Input: PWideChar): PWideChar; stdcall;
    var
   rio:THTTPRIO;
   str:WideString;
   soap :DHC.WebRisServiceSoap;
begin
   rio := THTTPRIO.Create(nil);
   soap:= DHC.GetWebRisServiceSoap(True,GetWebSVRUrl,rio);
   str := soap.GetDictInfo(widestring(Input));
   Result := PWideChar(str);
end;
function  GetPatInfoToRIS(Input: PWideChar): PWideChar; stdcall;
var
   rio:THTTPRIO;
   str:WideString;
   soap :DHC.WebRisServiceSoap;
begin
   rio := THTTPRIO.Create(nil);
   soap:= DHC.GetWebRisServiceSoap(True,GetWebSVRUrl,rio);
   str := soap.GetPatInfoToRIS(widestring(Input));
   Result := PWideChar(str);
end;
function  GetPatOrdList(Input: PWideChar): PWideChar; stdcall;
var
   rio:THTTPRIO;
   str:WideString;
   soap :DHC.WebRisServiceSoap;
begin
   rio := THTTPRIO.Create(nil);
   soap:= DHC.GetWebRisServiceSoap(True,GetWebSVRUrl,rio);
   str := soap.GetPatOrdList(widestring(Input));
   Result := PWideChar(str);
end;
function  RegInfo(const Input: PWideChar): PWideChar; stdcall;
    var
   rio:THTTPRIO;
   str:WideString;
   soap :DHC.WebRisServiceSoap;
begin
   rio := THTTPRIO.Create(nil);
   soap:= DHC.GetWebRisServiceSoap(True,GetWebSVRUrl,rio);
   str := soap.RegInfo(widestring(Input));
   Result := PWideChar(str);
end;
function  ReturnReports(const Input: PWideChar): PWideChar; stdcall;
    var
   rio:THTTPRIO;
   str:WideString;
   soap :DHC.WebRisServiceSoap;
begin
   rio := THTTPRIO.Create(nil);
   soap:= DHC.GetWebRisServiceSoap(True,GetWebSVRUrl,rio);
   str := soap.ReturnReports(widestring(Input));
   Result := PWideChar(str);
end;
function  SendPatOrdListToRis(const Input: PWideChar): PWideChar; stdcall;
    var
   rio:THTTPRIO;
   str:WideString;
   soap :DHC.WebRisServiceSoap;
begin
   rio := THTTPRIO.Create(nil);
   soap:= DHC.GetWebRisServiceSoap(True,GetWebSVRUrl,rio);
   str := soap.SendPatOrdListToRis(widestring(Input));
   Result := PWideChar(str);
end;
function  TestReturnReports(const Input: PWideChar): PWideChar; stdcall;
    var
   rio:THTTPRIO;
   str:WideString;
   soap :DHC.WebRisServiceSoap;
begin
   rio := THTTPRIO.Create(nil);
   soap:= DHC.GetWebRisServiceSoap(True,GetWebSVRUrl,rio);
   str := soap.TestReturnReports(widestring(Input));
   Result := PWideChar(str);
end;

function  SaveAntCVResult(const Input: PWideChar): PWideChar; stdcall;
    var
   rio:THTTPRIO;
   str:WideString;
   soap :DHC.WebRisServiceSoap;
begin
   rio := THTTPRIO.Create(nil);
   soap:= DHC.GetWebRisServiceSoap(True,GetWebSVRUrl,rio);
   str := soap.SaveAntCVResult(widestring(Input));
   Result := PWideChar(str);
end;

function showweburl:PWideChar;stdcall;
begin
  Result:= PWideChar(GetWebSVRUrl );
end;

exports
BookedInfo ,
CancelBookedInfo,
CancelFeeApp,
CancelReport,
CheckComplete,
GetAppForm,
GetDictInfo,
GetPatInfoToRIS,
GetPatOrdList,
RegInfo,
ReturnReports,
SendPatOrdListToRis,
TestReturnReports,
SaveAntCVResult,
showweburl;



end.

