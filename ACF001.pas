
unit ACF001;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls, ExtCtrls, Buttons, ComCtrls, ToolWin, ControlGridDisp, Mant,
  fcLabel, ImgList, Grids, Wwdbigrd, Wwdbgrid, ppComm, ppRelatv, ppProd,
  ppClass, ppReport, ppBands, ppCache;

type

   RCabComprobante = record
       CiaDes,
       CIAID,
       TDIARID,
       Diario,
       Proveedor,
       numchq,
       banco,
       cuenta,
       Moneda,
       Glosa,
       Lote,
       TipoDoc,
       TipoCamb,
       Periodo,
       NoComp,
       NoDoc,
       Importe,
       Tmoneda
       : String;

  end;


  TFPrincipal = class(TForm)
    clbMenu: TCoolBar;
    tlbMenu00: TToolBar;
    Z1sbMenu01: TSpeedButton;
    Z1sbMenu02: TSpeedButton;
    Z1sbMenu03: TSpeedButton;
    Z1sbMenu04: TSpeedButton;
    sbMenu06: TSpeedButton;
    ControlGridDisp1: TControlGridDisp;
    Mant2: TMant;
    Mant3: TMant;
    Z1sbMenu05: TSpeedButton;
    ppReport1: TppReport;
    pnlMenu01: TPanel;
    Z1sbRefe: TSpeedButton;
    SpeedButton2: TSpeedButton;
    pnlMenu02: TPanel;
    Z1sbActivo: TSpeedButton;
    Z1sbTActivo: TSpeedButton;
    SpeedButton3: TSpeedButton;
    pnlMenu03: TPanel;
    Z1sbDepre: TSpeedButton;
    Z1sbCierreDep: TSpeedButton;
    Z1sbRevalua: TSpeedButton;
    Z1sbLoadTexto: TSpeedButton;
    Z1sbContabiliza: TSpeedButton;
    Z1sbIniDep: TSpeedButton;
    Z1sbCierreOpe: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Z1sbReclasif: TSpeedButton;
    Z1sbAjusteAnual: TSpeedButton;
    Z1sbLimReex: TSpeedButton;
    Z1sbDesdeprecia: TSpeedButton;
    SpeedButton4: TSpeedButton;
    pnlMenu04: TPanel;
    Z1sbResumenMov: TSpeedButton;
    Z1sbDepCta: TSpeedButton;
    Z1sbDepLoc: TSpeedButton;
    Z1sbResumenDep: TSpeedButton;
    SpeedButton10: TSpeedButton;
    Z1sbDefinitivo: TSpeedButton;
    Z1sbPreliminar: TSpeedButton;
    fclCxP: TfcLabel;
    Label1: TLabel;
    Z1sbResumen: TSpeedButton;
    Z1sbLegaliza: TSpeedButton;
    procedure SacaMenu;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pnLogoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Z1sbMenu01MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Z1sbMenu02MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Z1sbMenu03MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Z1sbMenu04MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Z1sbActivoClick(Sender: TObject);
    procedure sbMenu06Click(Sender: TObject);
    procedure sbMenu06MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbMenu05MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Z1sbDepreClick(Sender: TObject);
    procedure Z1sbRefeClick(Sender: TObject);
    procedure Z1sbCierreDepClick(Sender: TObject);
    procedure Z1sbResumenDepClick(Sender: TObject);
    procedure Z1sbResumenMovClick(Sender: TObject);
    procedure Z1sbDepCtaClick(Sender: TObject);
    procedure Z1sbDepLocClick(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure Mant2Delete(Sender: TObject; MantFields: TFields);
    procedure Mant2Edit(Sender: TObject; MantFields: TFields);
    procedure Mant2Insert(Sender: TObject);
    procedure Z1sbTActivoClick(Sender: TObject);
    procedure Mant3Insert(Sender: TObject);
    procedure Mant3Edit(Sender: TObject; MantFields: TFields);
    procedure Mant3Delete(Sender: TObject; MantFields: TFields);
    procedure Z1sbMenu05Click(Sender: TObject);
    procedure Z1sbMenu05MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Z1sbRevaluaClick(Sender: TObject);
    procedure Z1sbDefinitivoClick(Sender: TObject);
    procedure Z1sbPreliminarClick(Sender: TObject);
    procedure Z1sbLoadTextoClick(Sender: TObject);
    procedure Z1sbIniDepClick(Sender: TObject);
    procedure Z1sbContabilizaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Z1sbMenu04Click(Sender: TObject);
    procedure Z1sbMenu03Click(Sender: TObject);
    procedure Z1sbMenu02Click(Sender: TObject);
    procedure Z1sbMenu01Click(Sender: TObject);
    procedure Z1sbCierreOpeClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Z1sbReclasifClick(Sender: TObject);
    procedure Z1sbAjusteAnualClick(Sender: TObject);
    procedure Z1sbLimReexClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Z1sbDesdepreciaClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Z1sbResumenClick(Sender: TObject);
    procedure Z1sbLegalizaClick(Sender: TObject);
  private
    { Private declarations }
    procedure ReclasEdit(Sender: TObject; MantFields: TFields);
    procedure ReclasInsert(Sender: TObject);
  public
    { Public declarations }

    // Para Accesos
    procedure CreaAccesos;
    procedure CreaOpciones;
    procedure AppMessage(var Msg:TMsg; var Handled:Boolean );
    procedure ListaComponentes( xForm : TForm);
    Procedure MueveMouse(xObjeto: TObject; Shift: TShiftState; X, Y: Integer);
    // End Accesos

    procedure InvInsert(Sender: TObject);
    procedure InvEdit(Sender: TObject; MantFields: TFields);
    procedure RevInsert(Sender: TObject);
    procedure LimiteInsert(Sender: TObject);
    procedure RevEdit(Sender: TObject; MantFields: TFields);
    procedure LimiteEdit(Sender: TObject; MantFields: TFields);
    procedure ProcInsertOn( xxTMant:TMant; ccUser,ccFec,ccHor:String );
    procedure ProcTools(Sender: TObject);
    procedure ProcToolsRep(Sender: TObject);
    procedure ToolsInv(Sender: TObject);
    procedure ToolsRev(Sender: TObject);
    procedure ToolsLoad(Sender: TObject);
  end;

var
  FPrincipal: TFPrincipal;
  MantRefe  : TMant;
  MantInvC  : TMant;
  MantInvD  : TMant;
  MantRevC  : TMant;
  MantLimite  : TMant;
  MantRevD  : TMant;
  GReporte,GReporte1  : TMant;
  MantLoad  : TMant;
  MantRecl  : TMant;
implementation

uses ACFDM, ACF210, ACF220, ACF230, ACF240, ACF250, ACF777, ACF778, ACF779,
     ACF260, ACF776, ACF310, ACF275, ACF280, ACF290, ACF007, ACF008, ACF232,
  ACF294, ACF296, ACF222, ACF298, ACF223, ACF224, ACF231, ACF320, ACF774;

{$R *.DFM}

procedure TFPrincipal.CreaAccesos;
begin
   if FMantAcceso<>NIL then Exit;

   Try
      FMantAcceso:=TFMantAcceso.Create(Self);
      FMantAcceso.ShowModal;
   Finally
      FMantAcceso.Free;
      FMantAcceso:=NIL;
   End;
end;

procedure TFPrincipal.CreaOpciones;
begin
   FMantOpcion:=TFMantOpcion.Create(Self);
   With FMantOpcion Do
   Try
      If Length(DMAF.wGrupoTmp)>0 then begin
         ShowModal;
      end;
   Finally
      Free;
   End;
end;


procedure TFPrincipal.AppMessage(var Msg:TMsg; var Handled:Boolean );
begin
   if Msg.message = WM_KEYDOWN then begin

      if ( Msg.wParam=VK_F5 ) then begin

         If (Copy(DMAF.wObjetoNombr,1,2)='Z1') or
            (Copy(DMAF.wObjetoNombr,1,2)='Z2') then begin
            CreaOpciones;
         end;
      end;

      if ( Msg.wParam=VK_F12 ) then begin

         CreaAccesos;
      end;
   end;

end;

procedure TFPrincipal.ListaComponentes( xForm : TForm);
var
  i : integer;
begin

   for i:=0 to xForm.ComponentCount-1 do begin

      if xForm.Components[i].ClassName = 'TPanel' then
         TPanel(xForm.components[i]).OnMouseMove := MueveMouse;
      // para botones
      if xForm.Components[i].ClassName = 'TButton' then
         TButton(xForm.components[i]).OnMouseMove := MueveMouse;
      // para bitbuttons
      if xForm.Components[i].ClassName = 'TBitBtn' then
         TBitBtn(xForm.components[i]).OnMouseMove := MueveMouse;
      // para speedbuttons
      if xForm.Components[i].ClassName = 'TSpeedButton' then
         TSpeedButton(xForm.components[i]).OnMouseMove := MueveMouse;
      // Boton de Grid
      if xForm.Components[i].ClassName = 'TwwIButton' then
         TwwIButton(xForm.components[i]).OnMouseMove := MueveMouse;

      // para la forma
      xForm.onMouseMove := MueveMouse;
   end;
end;

Procedure TFPrincipal.MueveMouse(xObjeto: TObject; Shift: TShiftState; X, Y: Integer);
var
  xComponente : String;
  xForma : TForm;
begin
   xForma      := Screen.ActiveForm;
   xComponente := xForma.Name;

   if xObjeto is TForm then
   else begin

      xComponente := xComponente+'.'+TControl(xObjeto).Name;

      DMAF.wObjetoForma := xForma.Name;
      DMAF.wObjetoNombr := TControl(xObjeto).Name;
      If Copy(DMAF.wObjetoNombr,2,1)='2' then
         DMAF.wObjetoDescr := DMAF.wObjetoDesPr+' - '+TControl(xObjeto).Hint
      else begin
         DMAF.wObjetoDescr := TControl(xObjeto).Hint;
      end;
   end;
end;


procedure TFPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
   DMAF.DCOM1.Connected:=False;
  end;
procedure TFPrincipal.pnLogoMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
   SacaMenu;
end;
procedure TFPrincipal.SacaMenu;
begin
   pnlMenu01.Visible:=false;
   pnlMenu02.Visible:=false;
   pnlMenu03.Visible:=false;
   pnlMenu04.Visible:=false;
end;

procedure TFPrincipal.Z1sbMenu01MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   pnlMenu02.Visible:=false;
   pnlMenu03.Visible:=false;
   pnlMenu04.Visible:=false;
   pnlMenu01.Visible:=true;
end;

procedure TFPrincipal.Z1sbMenu02MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   pnlMenu01.Visible:=false;
   pnlMenu03.Visible:=false;
   pnlMenu04.Visible:=false;
   pnlMenu02.Visible:=true;
end;

procedure TFPrincipal.Z1sbMenu03MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   pnlMenu01.Visible:=false;
   pnlMenu02.Visible:=false;
   pnlMenu04.Visible:=false;
   pnlMenu03.Visible:=true;
end;

procedure TFPrincipal.Z1sbMenu04MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   pnlMenu01.Visible:=false;
   pnlMenu02.Visible:=false;
   pnlMenu03.Visible:=false;
   pnlMenu04.Visible:=true;
end;

procedure TFPrincipal.Z1sbActivoClick(Sender: TObject);
begin
   DMAF.cdsTipAct.Open;
   FMaestro:=TFMaestro.Create(Self);
   FToolsActivo:=TFToolsActivo.Create(Self);

   Mant2.User:=DMAF.wUsuario;
   Mant2.OnCreateMant:=ProcTools;
   Mant2.Execute;
   FMaestro.Free;
   FToolsActivo.Free;

   DMAF.cdsActfij.Close;
   DMAF.cdsTipAct.Close;
end;

procedure TFPrincipal.Mant2Edit(Sender: TObject; MantFields: TFields);
begin
   if DMAF.cdsActFij.RecordCount=0 then Exit;
   DMAF.wModo:='M';
   FMaestro.ShowModal;
end;

procedure TFPrincipal.Mant2Insert(Sender: TObject);
begin
   DMAF.wModo:='A';
   FMaestro.ShowModal;
end;

procedure TFPrincipal.ProcInsertOn( xxTMant:TMant; ccUser,ccFec,ccHor:String );
var
   xxFec, xxFil, xxTim, ccSQL : String;
begin
   xxFec:=FORMATDATETIME('YYYY-MM-DD',Date);
   xxTim:=FORMATDATETIME('HH:MM:SS',Time);
   xxFil:=xxTMant.Filter;
   ccSQL :='Select * From '+xxTMant.TableName+' Where ';
   if Length(xxFil)>0 then
      ccSQL:=ccSQL+'('+xxFil+')'+' and '+ccFec+'='''+xxFec+''' and '
            +ccHor+'>='''+xxTim+''' and '+ccUser+'='''+DMAF.wUsuario+''''
   else begin
      ccSQL:=ccSQL+ccFec+'='''+xxFec+''' and '
            +ccHor+'>='''+xxTim+''' and '+ccUser+'='''+DMAF.wUsuario+'''';
   end;
   xxTMant.FMant.cds2.Close;
   xxTMant.FMant.cds2.DataRequest( ccSQL );
   xxTMant.FMant.cds2.Open;
end;

procedure TFPrincipal.Mant2Delete(Sender: TObject; MantFields: TFields);
var
   xSql, xxCia, xxAct, xxAcD, xxFRe, xxRef : String;
begin
   if DMAF.cdsActFij.RecordCount=0 then Exit;

   xxCia := MantFields.FieldByName('CIAID'     ).AsString;
   xxAct := MantFields.FieldByName('ACFID'     ).AsString;
   xxAcD := MantFields.FieldByName('ACFDES'    ).AsString;
   xxFRe := MantFields.FieldByName('ACFFLAGREF').AsString;
   xxRef := MantFields.FieldByName('ACFREFOR'  ).AsString;

   xSql:='Select * From ACF204 '
        +'Where CIAID='''     +xxCia+''' and ACFID='''   +xxAct+''' and '
        +      'DEPFLAGREF='''+xxFRe+''' and ACFREFOR='''+xxRef+''' and '
        +      'DEPFLAGPRO=''P''';

   DMAF.cdsQry.Close;
   DMAF.cdsQry.ProviderName:='dspTGE';
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;

   if DMAF.cdsQry.RecordCount>0 then begin
      ShowMessage('Activo Fijo Ya Fue Depreciado. NO se puede Eliminar');
      Exit;
   end;

   if MessageDlg('¿  Eliminar Registro  ? '+chr(13)+chr(13)
      +'Compañía='  +''''+ xxCia +''''+chr(13)
      +'Código   =' +''''+ xxAct +''''+chr(13)
      +'Activo   =' +''''+ xxAcD +''''+chr(13)
      +'Reforma  =' +''''+ xxRef +'''' ,
      mtConfirmation, [mbYes, mbNo], 0)=mrNo then Exit;


   DMAF.cdsActFij.Delete;
   DMAF.cdsActFij.DataRequest('Select * from ACF201');

   DMAF.ControlTran;  // graba regs.original/y duplicados si los hay

   // Archivo de Activo Fijo
   xSql:='Update ACF201 Set ACFIDCOMP='''' '
        +'Where CIAID='''+xxCia+''' and ACFIDCOMP='''+xxAct+'''';
   DMAF.DCom1.AppServer.EjecutaSQL(xSql);

   // Archivo de C.Costo
   xSql:='Delete From ACF103 '
        +'Where CIAID='''+xxCia+''' and ACFID='''+xxAct+'''';
   DMAF.DCom1.AppServer.EjecutaSQL(xSql);

   // Archivo de Depreciacion
   xSql:='Delete From ACF204 '
        +'Where CIAID='''     +xxCia+''' and ACFID='''   +xxAct+''' and '
        +      'DEPFLAGREF='''+xxFRe+''' and ACFREFOR='''+xxRef+'''';
   DMAF.DCom1.AppServer.EjecutaSQL(xSql);

   // Archivo de Depreciacion Work
   xSql:='Delete From ACF204W '
        +'Where CIAID='''     +xxCia+''' and ACFID='''   +xxAct+''' and '
        +      'DEPFLAGREF='''+xxFRe+''' and ACFREFOR='''+xxRef+'''';
   DMAF.DCom1.AppServer.EjecutaSQL(xSql);

   Mant2.RefreshFilter;

   ShowMessage('Activo Fijo ELIMINADO')
end;


procedure TFPrincipal.ProcTools(Sender: TObject);
var
 pl, pg : TPanel;
begin
  pg := FToolsActivo.pnlAct;
  pl := TMant(Sender).FMant.pnlBtns;

  pl.AutoSize := True;
  pg.Align    := alClient;
  pg.Parent   := TMant(Sender).FMant.pnlBtns;
  pl.Height   := pg.Height + 0;
//  pl.Height   := pg.Height + 5;

  TMant(Sender).FMant.pnlBtns.Visible  := True;
end;


procedure TFPrincipal.ProcToolsRep(Sender: TObject);
var
 pl, pg : TPanel;
begin
  pg := FRepLegal.pnlAct;
  pl := TMant(Sender).FMant.pnlBtns;

  pl.AutoSize := True;
  pg.Align    := alClient;
  pg.Parent   := TMant(Sender).FMant.pnlBtns;
  pl.Height   := pg.Height + 0;
//  pl.Height   := pg.Height + 5;

  TMant(Sender).FMant.pnlBtns.Visible  := True;
end;


procedure TFPrincipal.sbMenu06Click(Sender: TObject);
begin
   Close;
end;

procedure TFPrincipal.sbMenu06MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  SacaMenu;
end;

procedure TFPrincipal.sbMenu05MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   SacaMenu
end;

procedure TFPrincipal.Z1sbDepreClick(Sender: TObject);
begin
{
   FDeprecia:=TFDeprecia.Create(Self);
   With FDeprecia Do
   Try
      ShowModal;
   Finally
      Free;
   end;
}
   FDeprecia1:=TFDeprecia1.Create(Self);
   With FDeprecia1 Do
   Try
      ShowModal;
   Finally
      Free;
   end;
end;

procedure TFPrincipal.Z1sbRefeClick(Sender: TObject);
begin
   Try
      MantRefe:=TMant.Create( Self );
      MantRefe.DComC :=DMAF.DCom1;
      MantRefe.Module:='ACF';
      MantRefe.Admin :=DMAF.wAdmin;
      MantRefe.User  :=DMAF.wUsuario;
      MantRefe.MultiColorRows :=True;
      MantRefe.ControlGridDisp:=ControlGridDisp1;
      MantRefe.Execute;
   Finally
      MantRefe.Free;
      DMAF.cdsLocalidad.Close;
      DMAF.cdsLocalidad.Open;
      DMAF.cdsUbica.Close;
      DMAF.cdsUbica.Open;
      DMAF.cdsMaterial.Close;
      DMAF.cdsMaterial.Open;
      DMAF.cdsDesac.Close;
      DMAF.cdsDesac.Open;
      DMAF.cdsTrab.Close;
      DMAF.cdsTrab.Open;
      DMAF.cdsMotivo.Close;
      DMAF.cdsMotivo.Open;
      DMAF.cdsEstado.Close;
      DMAF.cdsEstado.Open;
   end;
end;


procedure TFPrincipal.Z1sbCierreDepClick(Sender: TObject);
begin
   FCierraDepre:=TFCierraDepre.Create(Self);
   With FCierraDepre Do
   Try
      ShowModal;
   Finally
      Free;
   end;
end;

// Reportes:
procedure TFPrincipal.Z1sbResumenDepClick(Sender: TObject);
begin
// Resumen de la Depreciación
   DMAF.wboton:='5';
   DMAF.wtitulo:=Z1sbResumenDep.caption;
   FReporte:=TFReporte.Create(Self);
   With FReporte Do
   Try
      ShowModal;
   Finally
      Free;
   end;

end;

procedure TFPrincipal.Z1sbResumenMovClick(Sender: TObject);
begin
// Depreciacion X Tipo de Activo
   DMAF.wboton:='2';
   DMAF.wtitulo:=Z1sbResumenMov.caption;
   FReporte:=TFReporte.Create(Self);
   With FReporte Do
   Try
      ShowModal;
   Finally
      Free;
   end;

end;

procedure TFPrincipal.Z1sbDepCtaClick(Sender: TObject);
begin
// Depreciación x cuenta
   DMAF.wboton:='3';
   DMAF.wtitulo:=Z1sbDepCta.caption;
   FReporte:=TFReporte.Create(Self);
   With FReporte Do
   Try
      ShowModal;
   Finally
      Free;
   end;

end;

procedure TFPrincipal.Z1sbDepLocClick(Sender: TObject);
begin
// Resumen x Tipo de Activo
   DMAF.wboton:='4';
   DMAF.wtitulo:=Z1sbDepLoc.caption;
   FReporte:=TFReporte.Create(Self);
   With FReporte Do
   Try
      ShowModal;
   Finally
      Free;
   end;

end;

procedure TFPrincipal.SpeedButton10Click(Sender: TObject);
begin
// Catálogo de Activos
   DMAF.wboton:='1';
   DMAF.wtitulo:=speedbutton10.caption;
   FReporte:=TFReporte.Create(Self);
   With FReporte Do
   Try
      ShowModal;
   Finally
      Free;
   end;
end;


procedure TFPrincipal.Z1sbTActivoClick(Sender: TObject);
begin
   FTActivo:=TFTActivo.Create(Self);

   Mant3.User:=DMAF.wUsuario;
   Mant3.Execute;

   FTActivo.Free;
end;

procedure TFPrincipal.Mant3Insert(Sender: TObject);
begin
   DMAF.wModo:='A';
   FTActivo.ShowModal;
end;

procedure TFPrincipal.Mant3Edit(Sender: TObject; MantFields: TFields);
begin
   DMAF.wModo:='M';
   FTActivo.ShowModal;
end;

procedure TFPrincipal.Mant3Delete(Sender: TObject; MantFields: TFields);
var
   xCia, xTActivo : String;
begin
   if DMAF.cdsTipAct.RecordCount=0 then Exit;

   xCia    :=DMAF.cdsTipAct.FieldByname('CiaId').AsString;
   xTActivo:=DMAF.cdsTipAct.FieldByname('TAcFId').AsString;

   xSQL:='Select * From ACF201 Where CIAID=''' +xCia    +''' and '
        +                           'TACFID='''+xTActivo+'''';
   DMAF.cdsQry.Close;
   DMAF.cdsQry.ProviderName:='dspTGE';
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;
   if DMAF.cdsQry.RecordCount>0 then begin
      ShowMessage('Tipo de Activo Fijo No Se Puede Eliminar. Ya Fue Usado');
      exit;
   end;

   if MessageDlg('¿  Eliminar Registro  ? '+chr(13)+chr(13)
      +'Compañía   ='+''''+xCia    +''''+chr(13)
      +'Tipo Activo='+''''+xTActivo+''''+chr(13),
      mtConfirmation, [mbYes, mbNo], 0)=mrNo then Exit;

   DMAF.cdsTipAct.Delete;
   DMAF.ControlTran;
end;

procedure TFPrincipal.Z1sbMenu05Click(Sender: TObject);
begin
   FManteInv := TFManteInv.Create(Self);
   FToolsInv := TFToolsInv.Create(Self);
   MantInvC  := TMant.Create(Self);
   MantInvC.ControlGridDisp:= ControlGridDisp1;
   MantInvC.Admin          := DMAF.wAdmin;
   MantInvC.OnInsert       := InvInsert;
   MantInvC.OnEdit         := InvEdit;
   MantInvC.OnCreateMant   := ToolsInv;
//   MantInvC.OnDelete       := ProvisionDelete;
   MantInvC.DComC          := DMAF.DCom1;
   MantInvC.ClientDataSet  := DMAF.cdsInvC;
   MantInvC.TableName      := 'ACF301';
   MantInvC.Module         := 'ACF';
   MantInvC.Titulo         := 'Inventario';
   MantInvC.User           := DMAF.wUsuario;
////////////////////
   MantInvC.SectionName:='ACFInventario';
   MantInvC.FileNameIni:='\SOLACF.INI';
////////////////////
   MantInvC.Execute;

   MantInvC.Free;
   FManteInv.Free;
   FToolsInv.Free;
//   SacaMenu(sender);
end;

procedure TFPrincipal.InvInsert(Sender: TObject);
begin
   DMAF.wModo:='A';
   FManteInv.ShowModal;
end;

procedure TFPrincipal.InvEdit(Sender: TObject; MantFields: TFields);
begin
   if DMAF.cdsInvC.FieldByname('InvEstado').AsString='Aceptado' then
      Raise Exception.Create('Inventario Aceptado. No se Puede Modificar');

   DMAF.wModo:='M';
   FManteInv.ShowModal;
end;


procedure TFPrincipal.ToolsInv(Sender: TObject);
var
 pl, pg : TPanel;
begin
  pg := FToolsInv.pnlAct;
  pl := TMant(Sender).FMant.pnlBtns;

  pl.AutoSize := True;
  pg.Align    := alClient;
  pg.Parent   := TMant(Sender).FMant.pnlBtns;
  pl.Height   := pg.Height + 0;

  TMant(Sender).FMant.pnlBtns.Visible  := True;
end;

procedure TFPrincipal.ToolsRev(Sender: TObject);
var
 pl, pg : TPanel;
begin
  pg := FToolRev.pnlAct;
  pl := TMant(Sender).FMant.pnlBtns;

  pl.AutoSize := True;
  pg.Align    := alClient;
  pg.Parent   := TMant(Sender).FMant.pnlBtns;
  pl.Height   := pg.Height + 0;

  TMant(Sender).FMant.pnlBtns.Visible  := True;
end;


procedure TFPrincipal.ToolsLoad(Sender: TObject);
var
 pl, pg : TPanel;
begin
  pg := FToolsLoadTexto.pnlAct;
  pl := TMant(Sender).FMant.pnlBtns;

  pl.AutoSize := True;
  pg.Align    := alClient;
  pg.Parent   := TMant(Sender).FMant.pnlBtns;
  pl.Height   := pg.Height + 0;

  TMant(Sender).FMant.pnlBtns.Visible  := True;
end;



procedure TFPrincipal.Z1sbMenu05MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   pnlMenu01.Visible:=false;
   pnlMenu02.Visible:=false;
   pnlMenu04.Visible:=false;
   pnlMenu03.Visible:=False;
end;

procedure TFPrincipal.Z1sbRevaluaClick(Sender: TObject);
begin
   DMAF.cdsTipAct.Open;
   FManteReval:= TFManteReval.Create(Self);
   FToolRev := TFToolRev.Create(Self);

   MantRevC := TMant.Create(Self);
   MantRevC.ControlGridDisp:= ControlGridDisp1;
   MantRevC.Admin          := DMAF.wAdmin;
   MantRevC.OnInsert       := RevInsert;
   MantRevC.OnEdit         := RevEdit;
   MantRevC.OnCreateMant   := ToolsRev;
   MantRevC.DComC          := DMAF.DCom1;
   MantRevC.ClientDataSet  := DMAF.cdsReva;
   MantRevC.TableName      := 'ACF303';
   MantRevC.Titulo         := 'Revaluación';
   MantRevC.User           := DMAF.wUsuario;
   MantRevC.SectionName    := 'ACFRevaluacion';
   MantRevC.FileNameIni    := '\SOLACF.INI';
   Try
     MantRevC.Execute;
   finally
     MantRevC.Free;
     FManteReval.Free;
     FToolRev.Free;
     DMAF.cdsTipAct.Close;
   end;
end;

procedure TFPrincipal.RevInsert(Sender: TObject);
begin
   DMAF.wModo:='A';
   FManteReval.ShowModal;
end;

procedure TFPrincipal.LimiteInsert(Sender: TObject);
begin
   DMAF.wModo:='A';
   FLimReexpres.ShowModal;
end;

procedure TFPrincipal.RevEdit(Sender: TObject; MantFields: TFields);
begin
   if DMAF.cdsReva.FieldByName('Estado').AsString='Aceptado' then
      Raise Exception.Create('Revaluación Aceptada. No se Puede Modificar');

   DMAF.wModo:='M';
   FManteReval.ShowModal;
end;

procedure TFPrincipal.LimiteEdit(Sender: TObject; MantFields: TFields);
begin
{   if DMAF.cdsReva.FieldByName('Estado').AsString='Aceptado' then
      Raise Exception.Create('Revaluación Aceptada. No se Puede Modificar');
 }
   DMAF.wModo:='M';
   FLimReexpres.ShowModal;
end;


procedure TFPrincipal.Z1sbDefinitivoClick(Sender: TObject);
begin
   try
      GReporte:=TMant.Create(Self);
      GReporte.User         := DMAF.wUsuario;
      GReporte.Admin        := DMAF.wAdmin;
      GReporte.DComC        := DMAF.DCom1;
      GReporte.ClientDataSet:= DMAF.cdsQry;
      GReporte.TableName    := 'ACF204';
      //GReporte.Filter    := 'ACFFDEP=''S''';
      GReporte.Titulo       := 'Depreciación Definitiva';
      GReporte.User         := DMAF.wUsuario;
      GReporte.Module       := 'ACF' ;
      GReporte.SectionName  := 'ACFDepreciacion';
      GReporte.FileNameIni  := '\SOLACF.INI';
      GReporte.Execute;
  finally
      GReporte.Free;
  end;
end;

procedure TFPrincipal.Z1sbPreliminarClick(Sender: TObject);
begin
   try
      GReporte:=TMant.Create(Self);
      GReporte.User         := DMAF.wUsuario;
      GReporte.Admin        := DMAF.wAdmin;
      GReporte.DComC        := DMAF.DCom1;
      GReporte.ClientDataSet:= DMAF.cdsQry;
      GReporte.TableName    := 'ACF204W';
      GReporte.Titulo       := 'Depreciación Preliminar';
      GReporte.User         := DMAF.wUsuario;
      GReporte.Module       := 'ACF' ;
      GReporte.SectionName  := 'ACFDeprePreliminar';
      GReporte.FileNameIni  := '\SOLACF.INI';
      GReporte.ControlGridDisp:=nil;
      GReporte.Execute;
  finally
      GReporte.Free;
  end;
end;

procedure TFPrincipal.Z1sbLoadTextoClick(Sender: TObject);
begin

   DMAF.cdsTipAct.Close;
   DMAF.cdsTipAct.DataRequest( 'Select * From ACF101' );
   DMAF.cdsTipAct.Open;
   DMAF.cdsTipAct.IndexFieldNames:='TACFID';

   FToolsLoadTexto:= TFToolsLoadTexto.Create(Self);
   MantLoad       := TMant.Create(Self);
   MantLoad.ControlGridDisp:= ControlGridDisp1;
   MantLoad.Admin          := DMAF.wAdmin;
   MantLoad.OnCreateMant   := ToolsLoad;
   MantLoad.DComC          := DMAF.DCom1;
   MantLoad.ClientDataSet  := DMAF.cdsQry;
   MantLoad.TableName      := 'ACF305';
   MantLoad.Titulo         := 'Recuperar Texto';
   MantLoad.User           := DMAF.wUsuario;
   MantLoad.SectionName    := 'ACFLoadTexto';
   MantLoad.FileNameIni    := '\SOLACF.INI';
   Try
      DMAF.cdsUbica.IndexFieldNames    :='UBICID';
      DMAF.cdsLocalidad.IndexFieldNames:='LOCID';
      MantLoad.Execute;
   finally
      MantLoad.Free;
      FToolsLoadTexto.Free;
      DMAF.cdsUbica.IndexFieldNames    :='';
      DMAF.cdsLocalidad.IndexFieldNames:='';
      DMAF.cdsTipAct.IndexFieldNames   :='';
      DMAF.cdsTipAct.Close;
   end;
end;

procedure TFPrincipal.Z1sbIniDepClick(Sender: TObject);
var
   xSQL : String;
begin
   if MessageDlg('Proceso Inicializa la data para '+#13+#13+
                 '   Depreciar por Primera Vez.   '+#13+#13+
                 ' Solo se Debe Ejecutar Una Vez. '+#13+#13+
                 ' Para Esto todas las Tablas de  '+#13+#13+
                 '   Referencia deben estar Ok.   '+#13+#13+
                 '  ¿ Esta Seguro de Procesar ?  ', mtconfirmation,[mbYes,MbNo],0)=mrYes then begin

      if MessageDlg('Proceso Eliminara Data de Depreciación'+#13+#13+
                    '         de Periodos Anteriores       '+#13+#13+
                    '      ¿ Esta Seguro de Procesar ?     ', mtconfirmation,[mbYes,MbNo],0)=mrNo then Exit;

      xSQL:='DELETE FROM ACF204';

      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest( xSQL );
      TRY
         DMAF.cdsQry.Execute;
      EXCEPT

      END;

     if  (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then begin
      xSQL:='Insert into ACF204 ( CIAID, ACFID, TACFID, CUENTAID, DEPVALHIST, '
           +  'DEPVALAJUS, DEPFLAGPRO, TACFDEPREC, DEPCOD, CCOSID, ACFVALOMN, '
           +  'ACFDES, ACFFECADQ, DEPFECHA, ACFREFOR, FAPERIODO, DEPNOMESES,DEPNETOAJU ) '
           +'Select ACF201.CIAID, ACFID, ACF201.TACFID, ACF201.CUENTAID, '
           +  'ACFVALOMN, ACFVALOMN, ''X'', ACF101.TACFDEPREC, ''01'', CCOSID, '
           +  'ACFVALOMN, ACFDES, ACFFECADQ, ACFFINIDEP, ACF201.ACFREFOR, '
           +  'SUBSTR( CHAR( ACFFINIDEP ),1,4)||SUBSTR( CHAR( ACFFINIDEP ), 6, 2 ), 1,ACFVALOMN '
           +'From ACF201, ACF101, ACF110 '
           +'Where ACF201.CIAID=ACF101.CIAID and ACF201.TACFID=ACF101.TACFID '
           +  'and ACF201.ACFVALOMN>0 AND ACFFLAGACT=''A'' '
           + ' AND ACF110.CUENTAID=ACF201.CUENTAID AND ACF110.FLGASTO=''N'' ';
     end;
     if (SRV_D = 'ORACLE') then
     begin
      xSQL:='Insert into ACF204 ( CIAID	, ACFID, TACFID, CUENTAID, DEPVALHIST, '
           +  'DEPVALAJUS, DEPFLAGPRO, TACFDEPREC, DEPCOD, CCOSID, ACFVALOMN, '
           +  'ACFDES, ACFFECADQ, DEPFECHA, ACFREFOR, FAPERIODO, DEPNOMESES,DEPNETOAJU ) '
           +'Select ACF201.CIAID, ACFID, ACF201.TACFID, ACF201.CUENTAID, '
           +  'ACFVALOMN, ACFVALOMN, ''X'', ACF101.TACFDEPREC, ''01'', CCOSID, '
           +  'ACFVALOMN, SUBSTR(ACFDES,1,40), ACFFECADQ, ACFFECADQ, ACF201.ACFREFOR, '
           +  'TO_CHAR( ACFFECADQ,''YYYYMM''),1,ACFVALOMN '
           +'From ACF201, ACF101, ACF110 '
           +'Where ACF201.CIAID=ACF101.CIAID and ACF201.TACFID=ACF101.TACFID '
           +  'and ACF201.ACFVALOMN>0 AND ACFFLAGACT=''A'' '
           + ' AND ACF110.CUENTAID=ACF201.CUENTAID AND ACF110.FLGASTO=''N'' ';

     end;

      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest( xSQL );
      DMAF.cdsQry.Execute;

     if  (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
            xSQL:='Update ACF102 set FAPROC=''X'', FLCONTA='''', FLREI='''', FLANUAL='''' ' ;
     if (SRV_D = 'ORACLE') then
            xSQL:='Update ACF102 set FAPROC=''X'', FLCONTA=NULL, FLREI=NULL, FLANUAL=NULL ' ;
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest( xSQL );
      DMAF.cdsQry.Execute;
     if  (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
        xSQL:='Update ACF104 set FAPERIODO='''', FAFECDEPRE=''01/01/1900''' ;
     if (SRV_D = 'ORACLE') then
        xSQL:='Update ACF104 set FAPERIODO=''199901'', FAFECDEPRE=''01/01/1900''' ;

      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest( xSQL );
      DMAF.cdsQry.Execute;

      ShowMessage('Proceso Terminado');
   end;
end;

procedure TFPrincipal.Z1sbContabilizaClick(Sender: TObject);
var
   xSQL : String;
begin

   DMAF.cdsTDiario.Close;
   DMAF.cdsTDiario.DataRequest('Select * from TGE104');
   DMAF.cdsTDiario.Open;
   DMAF.cdsTDiario.IndexFieldNames:='TDIARID';

   try
      FContabilidad:= TFContabilidad.Create(Self);
      xSQL:='Select '''' CIAID, '''' TACFID, '''' TACFDES, '''' CUENTAID, '''' CCOSID, '''' DH, '
           +  '0 DEBE, 0 HABER, '''' CTADES '
           +'From ACF204 '
           +'Where CIAID=''ZZ'' and FAPERIODO=''9999'' ';

      DMAF.cdsTrasSel.Close;
      DMAF.cdsTrasSel.DataRequest( xSQL );
      DMAF.cdsTrasSel.Open;

      FContabilidad.dbgConta.DataSource:=DMAF.dsTrasSel;

      FContabilidad.dbgConta.Selected.Clear;
      FContabilidad.dbgConta.Selected.Add('TACFID'#9'8'#9'Tipo~Activo'#9 );
      FContabilidad.dbgConta.Selected.Add('TACFDES'#9'30'#9'Descripcion'#9);
      FContabilidad.dbgConta.Selected.Add('CUENTAID'#9'18'#9'Cuenta~Contable'#9);
      FContabilidad.dbgConta.Selected.Add('CCOSID'#9'10'#9'Centro~Costo'#9);
      FContabilidad.dbgConta.Selected.Add('DEBE'#9'16'#9'Debe'#9);
      FContabilidad.dbgConta.Selected.Add('HABER'#9'16'#9'Haber'#9);

      FContabilidad.ShowModal;
   finally
      FContabilidad.Free;
      DMAF.cdsTDiario.Close;
   end;
end;

procedure TFPrincipal.FormCreate(Sender: TObject);
begin
   If DMAF.wAdmin='G' then begin

      DMAF.wGrupoTmp := '';

      Application.OnMessage:=AppMessage;

      ListaComponentes(Self);
   end;

end;

procedure TFPrincipal.FormActivate(Sender: TObject);
begin
   DMAF.AccesosUsuarios( DMAF.wModulo, DMAF.wUsuario, '1','' );
end;

procedure TFPrincipal.Z1sbMenu04Click(Sender: TObject);
begin
   pnlMenu01.Visible:=false;
   pnlMenu02.Visible:=false;
   pnlMenu03.Visible:=false;
   pnlMenu04.Visible:=true;
end;

procedure TFPrincipal.Z1sbMenu03Click(Sender: TObject);
begin
   pnlMenu01.Visible:=false;
   pnlMenu02.Visible:=false;
   pnlMenu04.Visible:=false;
   pnlMenu03.Visible:=true;
end;

procedure TFPrincipal.Z1sbMenu02Click(Sender: TObject);
begin
   pnlMenu01.Visible:=false;
   pnlMenu03.Visible:=false;
   pnlMenu04.Visible:=false;
   pnlMenu02.Visible:=true;
end;

procedure TFPrincipal.Z1sbMenu01Click(Sender: TObject);
begin
   pnlMenu02.Visible:=false;
   pnlMenu03.Visible:=false;
   pnlMenu04.Visible:=false;
   pnlMenu01.Visible:=true;
end;

procedure TFPrincipal.Z1sbCierreOpeClick(Sender: TObject);
begin
   FCierreOpe:=TFCierreOpe.Create(Self);
   With FCierreOpe Do
   Try
      ShowModal;
   Finally
      Free;
   end;
end;

procedure TFPrincipal.SpeedButton1Click(Sender: TObject);
begin
   DMAF.cdsTDiario.Close;
   DMAF.cdsTDiario.DataRequest('Select * from TGE104');
   DMAF.cdsTDiario.Open;
   DMAF.cdsTDiario.IndexFieldNames:='TDIARID';

   try
      FContaREI:= TFContaREI.Create(Self);
      
      xSQL:='Select '' '' CIAID, '' '' CTAORI, '' '' CTADESORI, '' '' CUENTAID, '' '' CCOSID, '' '' DH, '
           +  '0 DEBE, 0 HABER, '' '' CTADES '
           +'From ACF204 '
           +'Where CIAID=''ZZ'' and FAPERIODO=''9999'' ';

      DMAF.cdsTrasSel.Close;
      DMAF.cdsTrasSel.DataRequest( xSQL );
      DMAF.cdsTrasSel.Open;

      FContaREI.dbgConta.DataSource:=DMAF.dsTrasSel;

      FContaREI.dbgConta.Selected.Clear;
      FContaREI.dbgConta.Selected.Add('CTAORI'#9'18'#9'Cuenta~Origen'#9 );
      FContaREI.dbgConta.Selected.Add('CTADESORI'#9'40'#9'Descripcion'#9);
      FContaREI.dbgConta.Selected.Add('CUENTAID'#9'18'#9'Cuenta~Contable'#9);
      FContaREI.dbgConta.Selected.Add('CCOSID'#9'10'#9'Centro~Costo'#9);
      FContaREI.dbgConta.Selected.Add('DEBE'#9'16'#9'Debe'#9);
      FContaREI.dbgConta.Selected.Add('HABER'#9'16'#9'Haber'#9);
      FContaREI.ShowModal;
   finally
      FContaREI.Free;
      DMAF.cdsTDiario.Close;
   end;

end;

procedure TFPrincipal.Z1sbReclasifClick(Sender: TObject);
var
   xSQL : String;
begin

   xSQL:='SELECT * FROM ACF110 ';
   DMAF.cdsCTA.Close;
   DMAF.cdsCTA.DataRequest( xSQL );
   DMAF.cdsCTA.IndexFieldNames:='CUENTAID';
   DMAF.cdsCTA.Open;

   DMAF.cdsTDiario.Close;
   DMAF.cdsTDiario.DataRequest('Select * from TGE104');
   DMAF.cdsTDiario.Open;
   DMAF.cdsTDiario.IndexFieldNames:='TDIARID';

   DMAF.cdsTrasSel.close;

   xSQL:='Select ACFID, TACFID, ACFDES, CUENTAID, ''                    '' CUENTAID2, '
        +  '0 VALORHIS, 0 AJUSTE, 0 DEPHIS, 0 DEPAJU '
        +'From ACF204 '
        +'Where CIAID=''ZZ'' and FAPERIODO=''9999'' ';

   DMAF.cdsTrasSel.Close;
   DMAF.cdsTrasSel.DataRequest( xSQL );
   DMAF.cdsTrasSel.Open;


   try
      FReclasifica:= TFReclasifica.Create(Self);

      FReclasifica.dbgConta.Selected.Clear;
      FReclasifica.dbgConta.Selected.Add('ACFID'#9'8'#9'Activo~Id.'#9'F');
      FReclasifica.dbgConta.Selected.Add('TACFID'#9'7'#9'Tipo~Activo'#9'F');
      FReclasifica.dbgConta.Selected.Add('ACFDES'#9'25'#9'Activo Fijo'#9'F');
      FReclasifica.dbgConta.Selected.Add('CUENTAID'#9'17'#9'Cuenta~Contable'#9'F');
      FReclasifica.dbgConta.Selected.Add('CUENTAID2'#9'17'#9'Nueva~Cuenta'#9);
      FReclasifica.dbgConta.Selected.Add('VALORHIS'#9'12'#9'Valor~Historico'#9'F');
      FReclasifica.dbgConta.Selected.Add('AJUSTE'#9'10'#9'Valor~Ajuste'#9'F');
      FReclasifica.dbgConta.Selected.Add('DEPHIS'#9'10'#9'Deprec.~Acumulada.'#9'F');
      FReclasifica.dbgConta.Selected.Add('DEPAJU'#9'10'#9'Deprec.~Ajuste'#9'F');

      FReclasifica.dbgConta.DataSource:=DMAF.dsTrasSel;

      MantRecl:=TMant.Create(Self);
      MantRecl.User         := DMAF.wUsuario;
      MantRecl.Admin        := DMAF.wAdmin;
      MantRecl.DComC        := DMAF.DCom1;
      MantRecl.OnInsert     := ReclasInsert;
      MantRecl.OnEdit       := ReclasEdit;
      MantRecl.ClientDataSet:= DMAF.cdsReva;
      MantRecl.TableName    := 'ACF307';
      MantRecl.Titulo       := 'Reclasificación de Activos';
      MantRecl.User         := DMAF.wUsuario;
      MantRecl.Module       := 'ACF' ;
      MantRecl.SectionName  := 'ACFReclasificacion';
      MantRecl.FileNameIni  := '\SOLACF.INI';
      MantRecl.ControlGridDisp:=nil;
      MantRecl.Execute;
  finally
      GReporte.Free;
      FReclasifica.Free;
      DMAF.cdsTDiario.Close;
      DMAF.cdsTrasSel.IndexFieldNames:='';
  end;

end;


procedure TFPrincipal.ReclasEdit(Sender: TObject; MantFields: TFields);
begin
   if DMAF.cdsReva.RecordCount=0 then Exit;
   DMAF.wModo:='M';
   FReclasifica.ShowModal;
end;

procedure TFPrincipal.ReclasInsert(Sender: TObject);
begin
   DMAF.wModo:='A';
   FReclasifica.ShowModal;
end;


procedure TFPrincipal.Z1sbAjusteAnualClick(Sender: TObject);
var
   xSQL : String;
begin
   DMAF.cdsTDiario.Close;
   DMAF.cdsTDiario.DataRequest('Select * from TGE104');
   DMAF.cdsTDiario.Open;
   DMAF.cdsTDiario.IndexFieldNames:='TDIARID';

   try
      FAjusteAnual:= TFAjusteAnual.Create(Self);
      xSQL:='Select CIAID, ACFID, TACFID, ACFDES, CUENTAID, '
           +  '0 VALORHIS, 0 AJUSTE, 0 VALORAJU, 0 DEPAJU '
           +'From ACF204 '
           +'Where CIAID=''ZZ'' and FAPERIODO=''9999'' ';

      DMAF.cdsTrasSel.Close;
      DMAF.cdsTrasSel.DataRequest( xSQL );
      DMAF.cdsTrasSel.Open;

      FAjusteAnual.dbgConta.Selected.Clear;
      FAjusteAnual.dbgConta.Selected.Add('TACFID'#9'7'#9'Tipo~Activo'#9'F');
      FAjusteAnual.dbgConta.Selected.Add('ACFID'#9'8'#9'Activo~Id.'#9'F');
      FAjusteAnual.dbgConta.Selected.Add('ACFDES'#9'30'#9'Activo Fijo'#9'F');
      FAjusteAnual.dbgConta.Selected.Add('CUENTAID'#9'17'#9'Cuenta~Contable'#9'F');
      FAjusteAnual.dbgConta.Selected.Add('VALORHIS'#9'14'#9'Valor~Historico'#9'F');
      FAjusteAnual.dbgConta.Selected.Add('AJUSTE'#9'14'#9'Valor~Ajuste'#9'F');
      FAjusteAnual.dbgConta.Selected.Add('VALORAJU'#9'14'#9'Valor~Nuevo'#9'F');
      FAjusteAnual.dbgConta.Selected.Add('DEPAJU'#9'14'#9'Deprec.~Ajuste'#9'F');

      FAjusteAnual.dbgConta.DataSource:=DMAF.dsTrasSel;

      FAjusteAnual.ShowModal;
   finally
      FAjusteAnual.Free;
      DMAF.cdsTDiario.Close;
   end;

end;

procedure TFPrincipal.Z1sbLimReexClick(Sender: TObject);
begin

  MantLimite := TMant.Create(Self);
  FLimReexpres := TFLimReexpres.create(self);

  try
    MantLimite.User   := DMAF.wUsuario;
    MantLimite.Admin  := DMAF.wAdmin;
    MantLimite.Module := DMAF.wModulo;
    MantLimite.DComC  := DMAF.DCOM1;
    MantLimite.ControlGridDisp := ControlGridDisp1;
    MantLimite.OnCreateMant  := nil ;
    MantLimite.TableName     := 'ACF309';
    MantLimite.ClientDataSet := DMAF.cdsLimReCab;
    MantLimite.Filter        := '';
   	MantLimite.Titulo 				:= 'Límite de Reexpresión';
    MantLimite.OnInsert 			:= LimiteInsert;
    MantLimite.OnEdit 				:= LimiteEdit;
  	MantLimite.OnDelete 			:= nil;
    MantLimite.OnShow 				:= nil;
    MantLimite.SectionName		:='LimiteR';
    MantLimite.FileNameIni		:='\SOLACF.ini';
    MantLimite.Execute;
  finally
    MantLimite.Free;
    FLimReexpres.Free;

  end;

end;
{   FLimReexpres:= TFLimReexpres.Create(Self);
  // FToolRev := TFToolRev.Create(Self);

   MantLimite := TMant.Create(Self);
   MantLimite.ControlGridDisp:= ControlGridDisp1;
   MantLimite.Admin          := DMAF.wAdmin;
   MantLimite.OnInsert       := LimiteInsert;
   MantLimite.OnEdit         := LimiteEdit;
   MantLimite.OnCreateMant   := nil; //ToolsRev;
   MantLimite.DComC          := DMAF.DCom1;
   MantLimite.ClientDataSet  := DMAF.cdsLimReCab;
   MantLimite.TableName      := 'ACF309';
   MantLimite.Titulo         := 'Límite de Reexpresión';
   MantLimite.User           := DMAF.wUsuario;
   MantLimite.SectionName    := 'ACFLimiteRee';
   MantLimite.FileNameIni    := '\SOLACF.INI';
   Try
     MantLimite.Execute;
   finally
     MantLimite.Free;
     FLimReexpres.Free;
//     FToolRev.Free;

   end;
end;
 }


{begin
   FLimReexpres:=TFLimReexpres.Create(Self);
   With FLimReexpres Do
   Try
      ShowModal;
   Finally
      Free;
   end;

end;}

procedure TFPrincipal.SpeedButton3Click(Sender: TObject);
begin
   try
      GReporte1:=TMant.Create(Self);
      GReporte1.User         := DMAF.wUsuario;
      GReporte1.Admin        := DMAF.wAdmin;
      GReporte1.DComC        := DMAF.DCom1;
      GReporte1.ClientDataSet:= DMAF.cdsQry;
      GReporte1.TableName    := 'ACF201UBAC';
      //GReporte.Filter    := 'ACFFDEP=''S''';
      GReporte1.Titulo       := 'Depreciación Definitiva';
      GReporte1.User         := DMAF.wUsuario;
      GReporte1.Module       := 'ACF' ;
      GReporte1.SectionName  := 'ACFDepreciacion1';
      GReporte1.FileNameIni  := '\SOLACF.INI';
      GReporte1.Execute;
  finally
      GReporte1.Free;
  end;

end;

procedure TFPrincipal.Z1sbDesdepreciaClick(Sender: TObject);
begin
   XSQL:='SELECT * FROM TGE101 ORDER BY CIAID';
   DMAF.cdsCia.Close;
   DMAF.cdsCia.DataRequest(XSQL);
   DMAF.cdsCia.open;

   FDesDeprecia:=TFDesDeprecia.Create(Self);
   With FDesDeprecia Do
   Try
      ShowModal;
   Finally
      Free;
   end;

end;

procedure TFPrincipal.SpeedButton4Click(Sender: TObject);
VAR
 VALHIST :double;
begin
  XSQL:='SELECT CIAID,ACFID,TACFID FROM ACF204 WHERE CIAID=''01'' group by CIAID,ACFID,TACFID ';
  DMAF.cdsQry.close;
  DMAF.cdsQry.DataRequest(xsql);
  DMAF.cdsQry.Open;

   while not DMAF.cdsqry.Eof do
   begin
       XSQL:=' select * from ACF204 '
             +' WHERE ACFID='''+DMAF.cdsQry.FIELDBYNAME('ACFID').asstring
             +''' and TACFID='''+DMAF.cdsQry.FIELDBYNAME('TACFID').asstring
             +''' AND FAPERIODO>=''200201'' ORDER BY CIAID,ACFID,TACFID,FAPERIODO ';
       DMAF.cdsQry2.close;
       DMAF.cdsQry2.DataRequest(xsql);
       DMAF.cdsQry2.Open;
       VALHIST:=DMAF.CDSQRY2.fieldbyname('DEPVALHIST').asfloat;
              while not DMAF.cdsQry2.eof do
       begin
         VALHIST:=VALHIST+DMAF.cdsQry2.FIELDBYNAME('ACFREIPERI').asfloat;
         DMAF.CDSQRY2.EDIT;
         DMAF.CDSQRY2.FIELDBYNAME('ACFREIACUM').ASFLOAT:=VALHIST;
         DMAF.cdsQry2.next;

       end;
       DMAF.cdsQry2.ApplyUpdates(0);

       DMAF.cdsQry.next;
   end;

   SHOWMESSAGE('PROCESO TERMINADITO');
end;

procedure TFPrincipal.Z1sbResumenClick(Sender: TObject);
begin
   FResumen:=TFResumen.Create(Self);
   With FResumen Do
   Try
      ShowModal;
   Finally
      Free;
   end;
end;

procedure TFPrincipal.Z1sbLegalizaClick(Sender: TObject);
var
   xSQL : String;
begin

// PRESENTA TIPOS DE DEPRECIACION ACTIVOS
    wSQL:= 'SELECT * FROM ACF104 WHERE';
    wSql:=wSql+' DEPFLAGACT='+''''+'A'+'''';

    DMAF.cdsUDEP.Close;
    DMAF.cdsUDEP.DataRequest(wSQL);
    DMAF.cdsUDEP.Open;


   xSQL:='SELECT CIAID, '' ''CIADES, '' '' MESANO, FAPERIODO, ACFFECADQ, '
        +  'CUENTAID, ACFID, ACFDES, TACFID, '' '' TACFDES, '' '' ARTCODBAR, '
        +  'DEPVALHIST, 0.00 REVALUACION, 0.00 DIFCAMBIO, 0.00 MEJORAS, 0.00 RETIROS, '
        +  'DEPACUHIST, ACFREIPERI, DEPNETOAJU, ACFDEPEST, ACFREIDEPR, DEPNETOHIS '
        +'From ACF204 Where CIAID=''XX''';

   try
      FRepLegal:=TFRepLegal.Create( nil );
      GReporte:=TMant.Create(Self);
      GReporte.User         := DMAF.wUsuario;
      GReporte.Admin        := DMAF.wAdmin;
      GReporte.DComC        := DMAF.DCom1;
      GReporte.ClientDataSet:= DMAF.cdsQry2;
      GReporte.TableName    := 'VWACFLEGAL';
      GReporte.Titulo       := 'Legalizacion de Activos Fijos';
      GReporte.User         := DMAF.wUsuario;
      GReporte.Module       := 'ACF' ;
      GReporte.SectionName  := 'ACFLegalizacion';
      GReporte.FileNameIni  := '\SOLACF.INI';
      GReporte.OnCreateMant := ProcToolsRep;
      GReporte.UsuarioSQL.Add( xSQL );
      GReporte.Execute;
  finally
      GReporte.Free;
      FRepLegal.Free;
  end;
end;

end.
