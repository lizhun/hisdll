// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : C:\Users\zhun.li\Desktop\DHC.RIS.BS.WebRisService.wsdl
//  >Import : C:\Users\zhun.li\Desktop\DHC.RIS.BS.WebRisService.wsdl>0
// Encoding : UTF-8
// Version  : 1.0
// (2014/9/26 ÐÇÆÚÎå 11:47:42 - - $Rev: 25127 $)
// ************************************************************************ //

unit DHC;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_REF  = $0080;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]



  // ************************************************************************ //
  // Namespace : http://tempuri.org
  // soapAction: http://tempuri.org/DHC.RIS.BS.WebRisService.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // binding   : WebRisServiceSoap
  // service   : WebRisService
  // port      : WebRisServiceSoap
  // URL       : http://172.18.0.36/csp/i-ris/DHC.RIS.BS.WebRisService.cls
  // ************************************************************************ //
  WebRisServiceSoap = interface(IInvokable)
  ['{B5B614DE-FEEA-F349-3A29-C0D247195577}']
    function  BookedInfo(const Input: WideString): WideString; stdcall;
    function  CancelBookedInfo(const Input: WideString): string; stdcall;
    function  CancelFeeApp(const Input: WideString): WideString; stdcall;
    function  CancelReport(const Input: WideString): WideString; stdcall;
    function  CheckComplete(const Input: WideString): WideString; stdcall;
    function  GetAppForm(const Input: WideString): WideString; stdcall;
    function  GetDictInfo(const Input: WideString): WideString; stdcall;
    function  GetPatInfoToRIS(const Input: WideString): WideString; stdcall;
    function  GetPatOrdList(const Input: WideString): WideString; stdcall;
    function  RegInfo(const Input: WideString): WideString; stdcall;
    function  ReturnReports(const Input: WideString): WideString; stdcall;
    function  SendPatOrdListToRis(const Input: WideString): WideString; stdcall;
    function  SaveAntCVResult(const Input: WideString): WideString; stdcall;
    function  TestReturnReports(const Input: WideString): WideString; stdcall;
    function  DHCWebInterface(const input1: WideString; const input2: WideString): WideString; stdcall;
  end;

function GetWebRisServiceSoap(UseWSDL: Boolean=System.False; Addr: WideString=''; HTTPRIO: THTTPRIO = nil): WebRisServiceSoap;


implementation
  uses SysUtils;

function GetWebRisServiceSoap(UseWSDL: Boolean; Addr: WideString; HTTPRIO: THTTPRIO): WebRisServiceSoap;
const
  defWSDL = 'http://172.18.0.36/csp/i-ris/DHC.RIS.BS.WebRisService.cls?wsdl';
  defURL  = 'http://172.18.0.36/csp/i-ris/DHC.RIS.BS.WebRisService.cls';
  defSvc  = 'DztRisService';
  defPrt  = 'DztRisServiceSoap';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as WebRisServiceSoap);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
      RIO.HTTPWebNode.UseUTF8InHeader := True;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  InvRegistry.RegisterInterface(TypeInfo(WebRisServiceSoap), 'http://tempuri.org', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(WebRisServiceSoap), 'http://tempuri.org/DHC.Published.DztRisService.BS.DztRisService.DHCWebInterface');
  InvRegistry.RegisterInvokeOptions(TypeInfo(WebRisServiceSoap), ioDocument);

end.