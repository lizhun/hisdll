// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : C:\Users\admin\Desktop\¹²ÏíÎÄµµwsdl.txt
// (2018/7/3 15:32:26 - 1.33.2.5)
// ************************************************************************ //

unit RegShareDoc;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"



  // ************************************************************************ //
  // Namespace : http://tempuri.org
  // soapAction: http://tempuri.org/hsb.DhcEns.BS.WebMOHDocumentService.HIPMessageServer
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // binding   : WebMOHDocumentServiceSoap
  // service   : WebMOHDocumentService
  // port      : WebMOHDocumentServiceSoap
  // URL       : http://172.18.53.34/csp/hsb/hsb.DhcEns.BS.WebMOHDocumentService.cls
  // ************************************************************************ //
  WebMOHDocumentServiceSoap = interface(IInvokable)
  ['{B2C1FCC0-9261-42C3-D358-F0CBE6C4CC9F}']
    function  HIPMessageServer(const InputString: WideString; const InputContent: WideString): WideString; stdcall;
  end;

function GetWebMOHDocumentServiceSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): WebMOHDocumentServiceSoap;


implementation

function GetWebMOHDocumentServiceSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): WebMOHDocumentServiceSoap;
const
  defWSDL = 'http://172.18.53.34/csp/hsb/hsb.DhcEns.BS.WebMOHDocumentService.cls?wsdl';
  defURL  = 'http://172.18.53.34/csp/hsb/hsb.DhcEns.BS.WebMOHDocumentService.cls';
  defSvc  = 'WebMOHDocumentService';
  defPrt  = 'WebMOHDocumentServiceSoap';
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
    Result := (RIO as WebMOHDocumentServiceSoap);
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
  InvRegistry.RegisterInterface(TypeInfo(WebMOHDocumentServiceSoap), 'http://tempuri.org', '');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(WebMOHDocumentServiceSoap), 'http://tempuri.org/hsb.DhcEns.BS.WebMOHDocumentService.HIPMessageServer');
  InvRegistry.RegisterInvokeOptions(TypeInfo(WebMOHDocumentServiceSoap), ioDocument);

end.