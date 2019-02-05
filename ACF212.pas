unit ACF212;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Mask, wwdbedit, StdCtrls, wwdblook,
  Wwdbdlg, Buttons, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppCache,
  ppDB, ppDBPipe, wwdbdatetimepicker, ppCtrls, ppBands, ppPrnabl, ppModule,
  daDatMod;

type
  TFGuiaR = class(TForm)
    pnlBarra: TPanel;
    pnlBotones: TPanel;
    pnlCab: TPanel;
    Z2bbtnInsert: TBitBtn;
    Z2bbtnEdita: TBitBtn;
    dblcdBGuia: TwwDBLookupComboDlg;
    Z2bbtnGraba: TBitBtn;
    Z2bbtnImprime: TBitBtn;
    Z2bbtnAcepta: TBitBtn;
    Z2bbtnCancela: TBitBtn;
    Label1: TLabel;
    dbeNumGuia: TwwDBEdit;
    pnlDetalle: TPanel;
    ppdbGuia: TppDBPipeline;
    pprGuia: TppReport;
    dtpFecha: TwwDBDateTimePicker;
    dbeRuc: TwwDBEdit;
    dbeTransp: TwwDBEdit;
    dbePlaca: TwwDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    Label6: TLabel;
    dbgPend: TwwDBGrid;
    Panel2: TPanel;
    Label7: TLabel;
    dbgSele: TwwDBGrid;
    pnlEstado: TPanel;
    lblGraba: TLabel;
    lblAcepta: TLabel;
    Label8: TLabel;
    dbeObser: TwwDBEdit;
    Bevel1: TBevel;
    Label9: TLabel;
    Bevel2: TBevel;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel21: TppLabel;
    ppLabel23: TppLabel;
    ppLabel25: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppLabel10: TppLabel;
    ppDBText10: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppLabel41: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText1: TppDBText;
    ppDBText8: TppDBText;
    ppLabel6: TppLabel;
    ppDBText9: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel34: TppLabel;
    ppLabel36: TppLabel;
    ppLabel38: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLabel7: TppLabel;
    pplReg: TppLabel;
    ppDBText15: TppDBText;
    ppLabel15: TppLabel;
    ppLabel14: TppLabel;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel19: TppLabel;
    ppLabel18: TppLabel;
    ppLabel20: TppLabel;
    ppLabel22: TppLabel;
    ppLabel24: TppLabel;
    ppLabel26: TppLabel;
    procedure FormActivate(Sender: TObject);
    procedure Z2bbtnInsertClick(Sender: TObject);
    procedure Z2bbtnEditaClick(Sender: TObject);
    procedure dblcdBGuiaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgPendEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure dbgSeleDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbgPendMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgSeleEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure dbgPendDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbgSeleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Z2bbtnGrabaClick(Sender: TObject);
    procedure Z2bbtnImprimeClick(Sender: TObject);
    procedure Z2bbtnAceptaClick(Sender: TObject);
    procedure Z2bbtnCancelaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure GuiaEstado( xxEstado : String );
  public
    { Public declarations }
  end;

var
  FGuiaR: TFGuiaR;

implementation

//USES ACFDM, ACF001;
USES ACFDM;

{$R *.DFM}

procedure TFGuiaR.FormActivate(Sender: TObject);
var
   xSQL : String;
begin
   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
     xSQL:='SELECT * FROM ACF202 '
          +'WHERE COALESCE(TRAESTADO,'''')=''A'' and '
          +      'COALESCE(F_ULTIMO, '''')=''S'' and '
          +      'COALESCE(EXTERNO,  '''')=''S'' ';
   end;
   if SRV_D = 'ORACLE' then
   begin
     xSQL:='SELECT * FROM ACF202 '
          +'WHERE NVL(TRAESTADO,'''')=''A'' and '
          +      'NVL(F_ULTIMO, '''')=''S'' and '
          +      'NVL(EXTERNO,  '''')=''S'' ';
   end;

   DMAF.cdsTrasPen.Close;
   DMAF.cdsTrasPen.DataRequest(xSQL);
   DMAF.cdsTrasPen.Open;

   DMAF.cdsTrasPen.Filtered:=False;
   DMAF.cdsTrasPen.Filter  :='';
   DMAF.cdsTrasPen.Filter  :='TRAGUIA_R='''' OR TRAGUIA_R IS NULL';
   DMAF.cdsTrasPen.Filtered:=true;

   xSQL:='SELECT * FROM ACF202 Where CIAID=''ZZ'' ';

   DMAF.cdsTraslado.Close;
   DMAF.cdsTraslado.DataRequest(xSQL);
   DMAF.cdsTraslado.Open;

   dblcdBGuia.Visible:=False;
   pnlDetalle.Enabled:=False;
   pnlBotones.Enabled:=False;
   pnlCab.Enabled    :=False;
   GuiaEstado( '' );
end;

procedure TFGuiaR.Z2bbtnInsertClick(Sender: TObject);
var
   xSQL, xNumGuia, xNumMax : String;
begin
   dblcdBGuia.Enabled:=False;

   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  	  xSQL:='SELECT COALESCE( MAX( TRAGUIA_R ), ''0'' ) AS MAXGUIA FROM ACF202 ';
   if SRV_D = 'ORACLE' then
  	  xSQL:='SELECT NVL(TO_CHAR (MAX( TO_NUMBER(TRAGUIA_R) )), ''0'' ) AS MAXGUIA FROM ACF202 ';

   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest( xSQL );
   DMAF.cdsQry.Open;
   if DMAF.cdsQry.FieldByName('MAXGUIA').AsString='' then
      xNumMax:='0'
   else
      xNumMax:=DMAF.cdsQry.FieldByName('MAXGUIA').AsString;

   xNumGuia:=DMAF.StrZero( StrToInt( xNumMax )+1, 10 );

   dbeNumGuia.Text:=xNumGuia;
   dtpFecha.Date  :=Date; ;
   dbeTransp.Text :='';
   dbeRuc.Text    :='';
   dbePlaca.Text  :='';

   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
	   xSQL:='SELECT * FROM ACF202 Where COALESCE(TRAGUIA_R,'''')='''+dbeNumGuia.Text+ ''' or '
        +                           'COALESCE(TRAGUIA_R,'''')='''' ';
	   xSQL:='SELECT * FROM ACF202 Where COALESCE(TRAGUIA_R,'''')='''+dbeNumGuia.Text+ ''' or '
        +                           'COALESCE(TRAGUIA_R,'''')='''' ';
   end;

	 if SRV_D = 'ORACLE' then
   begin
	   xSQL:='SELECT * FROM ACF202 Where NVL(TRAGUIA_R,'''')='''+dbeNumGuia.Text+ ''' or '
        +                           'NVL(TRAGUIA_R,''nulo'')=''nulo'' ';
   end;

   DMAF.cdsTraslado.Close;
   DMAF.cdsTraslado.DataRequest(xSQL);
   DMAF.cdsTraslado.Open;

   DMAF.cdsTraslado.Filtered:=False;
   DMAF.cdsTraslado.Filter  :='';
   DMAF.cdsTraslado.Filter  :='TRAGUIA_R='''+dbeNumGuia.Text+''' ';
   DMAF.cdsTraslado.Filtered:=true;

   pnlBarra.Enabled  :=False;
   pnlDetalle.Enabled:=True;
   pnlBotones.Enabled:=True;
   pnlCab.Enabled    :=True;
   dblcdBGuia.Visible:=False;
   GuiaEstado( '' );
   dtpFecha.SetFocus;
end;

procedure TFGuiaR.Z2bbtnEditaClick(Sender: TObject);
var
   xSQL : String;
begin
   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
     xSQL:='Select TRAGUIA_R AS GUIA, TRARECIBE AS RESPONSABLE FROM ACF202 '
          +'Where COALESCE(TRAGUIA_R,'''')<>'''' '
          +'Group by TRAGUIA_R, TRARECIBE ';
   end;
   if SRV_D = 'ORACLE' then
   begin
     xSQL:='Select TRAGUIA_R AS GUIA, TRARECIBE AS RESPONSABLE FROM ACF202 '
          +'Where NVL(TRAGUIA_R,''nulo'')<>''nulo'' '
          +'Group by TRAGUIA_R, TRARECIBE ';
   end;

   DMAF.cdsTrasSel.Close;
   DMAF.cdsTrasSel.DataRequest( xSQL );
   DMAF.cdsTrasSel.Open;

   dblcdBGuia.LookupField:='GUIA';
   dblcdBGuia.Enabled:=True;
   dblcdBGuia.Visible:=True;
end;

procedure TFGuiaR.dblcdBGuiaExit(Sender: TObject);
var
   xSQL : String;
begin

   if dblcdBGuia.Text='' then Exit;

   dblcdBGuia.Text:=DMAF.StrZero( StrToInt(dblcdBGuia.Text) , 10 );

   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
	   xSQL:='SELECT * FROM ACF202 Where COALESCE(TRAGUIA_R,'''')='''+dblcdBGuia.Text+'''';

   if SRV_D = 'ORACLE' then
     xSQL:='SELECT * FROM ACF202 Where NVL(TRAGUIA_R,'''')='''+dblcdBGuia.Text+'''';

   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;

   if DMAF.cdsQry.RecordCount=0 then begin
      ShowMessage('Guia NO Existe');
      Exit;
   end;

   dbeNumGuia.Text:=dblcdBGuia.Text;

   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
     xSQL:='SELECT * FROM ACF202 Where COALESCE(TRAGUIA_R,'''')='''+dbeNumGuia.Text+ ''' or '
          +                           'COALESCE(TRAGUIA_R,'''')='''' ';
   end;
   if SRV_D = 'ORACLE' then
   begin
     xSQL:='SELECT * FROM ACF202 Where NVL(TRAGUIA_R,'''')='''+dbeNumGuia.Text+ ''' or '
          +                           'NVL(TRAGUIA_R,''nulo'')=''nulo'' ';
   end;
   DMAF.cdsTraslado.Close;
   DMAF.cdsTraslado.DataRequest(xSQL);
   DMAF.cdsTraslado.Open;

   DMAF.cdsTraslado.Filtered:=False;
   DMAF.cdsTraslado.Filter  :='';
   DMAF.cdsTraslado.Filter  :='TRAGUIA_R='''+dbeNumGuia.Text+''' ';
   DMAF.cdsTraslado.Filtered:=true;

   dtpFecha.date :=DMAF.cdsTraslado.FieldByName('GUIAFEC').AsDateTime;
   dbeTransp.Text:=DMAF.cdsTraslado.FieldByName('GUIATRANSP').AsString;
   dbeRuc.Text   :=DMAF.cdsTraslado.FieldByName('GUIARUC').AsString;
   dbePlaca.Text :=DMAF.cdsTraslado.FieldByName('GUIAPLACA').AsString;
   dbeObser.text :=DMAF.cdsTraslado.FieldByName('TRAOBSER').AsString;

   dblcdBGuia.Enabled:=True;

   pnlDetalle.Enabled:=False;
   pnlCab.Enabled    :=False;
   Z2bbtnGraba.Enabled :=False;
   Z2bbtnAcepta.Enabled:=False;
   if( DMAF.cdsTraslado.FieldByName('TraGuiaFl').AsString='') or
     ( DMAF.cdsTraslado.FieldByName('TraGuiaFl').AsString='G') then begin
      pnlDetalle.Enabled  :=True;
      pnlCab.Enabled      :=True;
      Z2bbtnGraba.Enabled :=True;
      Z2bbtnAcepta.Enabled:=True;
   end;
   pnlBotones.Enabled:=True;
   dblcdBGuia.Visible:=False;
   pnlBarra.Enabled  :=False;
   GuiaEstado( DMAF.cdsTraslado.FieldByName('TRAGUIAFL').AsString );
end;

procedure TFGuiaR.FormCreate(Sender: TObject);
var
   xSQL : String;
begin

   dbgPend.Selected.Clear;
   dbgPend.Selected.Add('TRADOCMTO'#9'09'#9'Movimiento'#9'F');
   dbgPend.Selected.Add('TRAFECHA'#9'10'#9'Fecha'#9'F');
   dbgPend.Selected.Add('TACFID'#9'07'#9'Tipo~Activo'#9'F');
   dbgPend.Selected.Add('ACFID'#9'07'#9'Activo~Fijo'#9'F');
   dbgPend.Selected.Add('RECIBEID'#9'08'#9'Recibe'#9'F');
   dbgPend.Selected.Add('TRARECIBE'#9'20'#9'Recibe Nombre'#9'F');
   dbgPend.Selected.Add('LOCID'#9'08'#9'Localidad'#9'F');
   dbgPend.Selected.Add('UBICID'#9'08'#9'Ubicación'#9'F');
   dbgPend.Selected.Add('CCOSID'#9'08'#9'Centro~Costo'#9'F');
   dbgPend.Selected.Add('TRAMOTIVO'#9'20'#9'Motivo'#9'F');

   dbgSele.Selected.Clear;
   dbgSele.Selected.Add('TRADOCMTO'#9'09'#9'Movimiento'#9'F');
   dbgSele.Selected.Add('TRAFECHA'#9'10'#9'Fecha'#9'F');
   dbgSele.Selected.Add('TACFID'#9'07'#9'Tipo~Activo'#9'F');
   dbgSele.Selected.Add('ACFID'#9'07'#9'Activo~Fijo'#9'F');
   dbgSele.Selected.Add('RECIBEID'#9'08'#9'Recibe'#9'F');
   dbgSele.Selected.Add('TRARECIBE'#9'20'#9'Recibe Nombre'#9'F');
   dbgSele.Selected.Add('LOCID'#9'08'#9'Localidad'#9'F');
   dbgSele.Selected.Add('UBICID'#9'08'#9'Ubicación'#9'F');
   dbgSele.Selected.Add('CCOSID'#9'08'#9'Centro~Costo'#9'F');
   dbgSele.Selected.Add('TRAMOTIVO'#9'20'#9'Motivo'#9'F');

   xSQL:='SELECT * FROM ACF202 Where CIAID=''ZZ'' ';
   DMAF.cdsTraslado.Close;
   DMAF.cdsTraslado.DataRequest(xSQL);
   DMAF.cdsTraslado.Open;
   DMAF.cdsTraslado.IndexFieldNames:='TRADOCMTO';
   DMAF.cdsTrasPen.IndexFieldNames :='TRADOCMTO';
   
end;

procedure TFGuiaR.dbgPendEndDrag(Sender, Target: TObject; X, Y: Integer);
var
   i : Integer;
begin
     If Target=dbgSele then begin

      DMAF.cdsTraslado.DisableControls;
      DMAF.cdsTraslado.Filtered:=False;
      
      DMAF.cdsTrasPen.DisableControls;
{      for i:= 0 to dbgPend.SelectedList.Count-1 do begin
          dbgPend.datasource.dataset.GotoBookmark(dbgPend.SelectedList.items[i]);
}
          DMAF.cdsTraslado.SetKey;
          DMAF.cdsTraslado.FieldByname('TRADOCMTO').Value:=DMAF.cdsTrasPen.FieldByname('TRADOCMTO').AsString;
          if DMAF.cdsTraslado.GotoKey then begin
             DMAF.cdsTraslado.Edit;
             DMAF.cdsTraslado.FieldByname('TRAGUIA_R').Value:=dbeNumGuia.Text;
             DMAF.cdsTrasPen.Edit;
             DMAF.cdsTrasPen.FieldByname('TRAGUIA_R').Value:=dbeNumGuia.Text;
          end;
{      end;

      dbgPend.SelectedList.clear;
}
      DMAF.cdsTrasPen.EnableControls;
      DMAF.cdsTraslado.EnableControls;
      DMAF.cdsTraslado.Filtered:=True;
      DMAF.cdsTrasPen.Filtered:=True;

   end;

end;

procedure TFGuiaR.dbgSeleDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TFGuiaR.dbgPendMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   dbgPend.BeginDrag(False);
end;

procedure TFGuiaR.dbgSeleEndDrag(Sender, Target: TObject; X, Y: Integer);
var
   i : Integer;
begin
   If Target=dbgPend then begin

      DMAF.cdsTrasPen.DisableControls;
      DMAF.cdsTraslado.DisableControls;
      DMAF.cdsTrasPen.Filtered:=False;

{      for i:= 0 to dbgSele.SelectedList.Count-1 do begin
          dbgSele.datasource.dataset.GotoBookmark(dbgSele.SelectedList.items[i]);
}
          DMAF.cdsTrasPen.SetKey;
          DMAF.cdsTrasPen.FieldByname('TRADOCMTO').Value:=DMAF.cdsTraslado.FieldByname('TRADOCMTO').AsString;
          if DMAF.cdsTrasPen.GotoKey then begin
             DMAF.cdsTraslado.Edit;
             DMAF.cdsTraslado.FieldByname('TRAGUIA_R').Value:='';
             DMAF.cdsTrasPen.Edit;
             DMAF.cdsTrasPen.FieldByname('TRAGUIA_R').Value:='';
          end;
{      end;

      dbgSele.SelectedList.clear;
}
      DMAF.cdsTrasPen.EnableControls;
      DMAF.cdsTraslado.EnableControls;
      DMAF.cdsTraslado.Filtered:=True;
      DMAF.cdsTrasPen.Filtered:=True;
      
   end;
end;

procedure TFGuiaR.dbgPendDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TFGuiaR.dbgSeleMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   dbgSele.BeginDrag(False);
end;

procedure TFGuiaR.Z2bbtnGrabaClick(Sender: TObject);
begin
   DMAF.cdsTraslado.First;
   while not DMAF.cdsTraslado.Eof do begin
      DMAF.cdsTraslado.Edit;
      DMAF.cdsTraslado.FieldByName('GuiaFec').Value   := dtpFecha.Date ;
      DMAF.cdsTraslado.FieldByName('GuiaTRansp').Value:= dbeTransp.Text;
      DMAF.cdsTraslado.FieldByName('GuiaRuc').Value   := dbeRuc.Text;
      DMAF.cdsTraslado.FieldByName('GuiaPlaca').Value := dbePlaca.Text;
      DMAF.cdsTraslado.FieldByName('TraGuiaFl').Value := 'G';
      DMAF.cdsTraslado.FieldByName('TraObser').Value  := dbeObser.Text;
      if DMAF.cdsTraslado.FieldByName('TraObser').AsString='' then
         DMAF.cdsTraslado.FieldByName('TraObser').AsString:='.';
      DMAF.cdsTraslado.FieldByName('TraHReg').Value   := Time;
      DMAF.cdsTraslado.FieldByName('TraFReg').Value   := Date;
      DMAF.cdsTraslado.FieldByName('TraUser').Value   := DMAF.wUsuario ;
      cdsPost( DMAF.cdsTraslado );
      DMAF.cdsTraslado.Next;
   end;
   lblGraba.visible:=True;
   DMAF.cdsTraslado.DataRequest('Select * from ACF202');
   DMAF.AplicaDatos(DMAF.cdsTraslado, 'TRASLADO');
   DMAF.cdsTraslado.First;

   ShowMessage(' Guía Grabada ');
end;

procedure TFGuiaR.GuiaEstado( xxEstado : String );
begin
   lblGraba.visible :=False;
   lblAcepta.visible:=False;
   if xxEstado='G' then lblGraba.visible :=True;
   if xxEstado='P' then lblAcepta.visible:=True;
end;


procedure TFGuiaR.Z2bbtnImprimeClick(Sender: TObject);
var
   xSQL : String;
begin
   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
     xSQL:='SELECT ACF202.*, ACF201.ACFSERIE, ACF201.ACFDES, ACF201.ACFMODELO, '
          +       'CASE WHEN COALESCE(TGE201.PROVDIR,'''')='''' '
          +            'THEN TGE126.DIRECCION ELSE TGE201.PROVDIR END DIREC, '
          +       'CASE WHEN COALESCE(TGE201.PROVDIR,'''')='''' '
          +            'THEN TGE126.LOCDES    ELSE '''' END AGENCIA, '
          +       'CASE WHEN COALESCE(TGE201.PROVDIR,'''')='''' '
          +            'THEN TGE126.TELEFONO  ELSE '''' END TELEFONO, '
          +       'CASE WHEN COALESCE(TGE201.PROVDIR,'''')='''' '
          +            'THEN TGE101.CIARUC    ELSE TGE201.PROVRUC END PROVRUC, '
          +       'TGE201.PROVRUC, ACF207.CARGO, TGE126.LOCDES '
          +'FROM ACF202 '
          +'Left Join TGE101 on ( TGE101.CIAID =ACF202.CIAID ) '
          +'Left Join ACF201 on ( ACF202.CIAID =ACF201.CIAID  AND '
          +                      'ACF202.TACFID=ACF201.TACFID AND '
          +                      'ACF202.ACFID =ACF201.ACFID ) '
          +'Left Join TGE201 on ( ACF202.RECIBEID=TGE201.PROV ) '
          +'Left Join ACF207 on ( ACF202.RECIBEID=ACF207.TRABID ) '
          +'Left Join TGE126 on ( ACF202.LOCID=TGE126.LOCID ) '
          +'Where COALESCE(TRAGUIA_R,'''')='''+dbeNumGuia.Text+'''';
   end;
   if SRV_D = 'ORACLE' then
   begin
     xSQL:='SELECT A.*, C.ACFSERIE, C.ACFDES, C.ACFMODELO, '
          +       'DECODE(NVL(D.PROVDIR,''''),'''',F.DIRECCION,D.PROVDIR) DIREC, '
          +       'DECODE(NVL(D.PROVDIR,''''),'''',F.LOCDES,'''') AGENCIA, '
          +       'DECODE(NVL(D.PROVDIR,''''),'''',F.TELEFONO,'''') TELEFONO,'
          +       'DECODE(NVL(D.PROVDIR,''''),'''',B.CIARUC,D.PROVRUC) PROVRUC,'
          +       ' D.PROVRUC, E.CARGO, F.LOCDES '
          +'FROM ACF202 A, TGE101 B, ACF201 C,TGE201 D,ACF207 E,TGE126 F '
          +' WHERE  B.CIAID =A.CIAID(+) AND  '
          +' A.CIAID =C.CIAID(+)  AND '
          +' A.TACFID=C.TACFID(+) AND '
          +' A.ACFID =C.ACFID(+) AND '
          +' A.RECIBEID=D.PROV(+) AND '
          +' A.RECIBEID=E.TRABID(+) AND '
          +' A.LOCID=F.LOCID(+) AND '
          +' NVL(TRAGUIA_R,'''')='''+dbeNumGuia.Text+'''';
   end;

   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;

   ppdbGuia.DataSource:=DMAF.dsQry;

//   pprGuia.template.fileName:=ExtractFilePath( application.ExeName )+'SolFormatos\ACFTraslado_A4.rtm';
   pprGuia.template.fileName:=ExtractFilePath( application.ExeName )+wRutaRpt+'ACF\DEMA\ACFGuiaRemision_A4.rtm';
//           xVoucherRTM:= ExtractFilePath(application.ExeName )+wRutaRpt+'\ACFVoucherG.RTM'
   pprGuia.template.LoadFromFile;

   pplReg.caption:= DMAF.StrZero( DMAF.cdsQry.RecordCount, 4 );

   pprGuia.Print;
   pprGuia.Stop;
   ppdbGuia.DataSource:=Nil;
end;

procedure TFGuiaR.Z2bbtnAceptaClick(Sender: TObject);
begin

   DMAF.cdsTraslado.First;
   while not DMAF.cdsTraslado.Eof do begin
      DMAF.cdsTraslado.Edit;
      DMAF.cdsTraslado.FieldByName('GuiaFec').Value   := dtpFecha.Date ;
      DMAF.cdsTraslado.FieldByName('GuiaTRansp').Value:= dbeTransp.Text;
      DMAF.cdsTraslado.FieldByName('GuiaRuc').Value   := dbeRuc.Text;
      DMAF.cdsTraslado.FieldByName('GuiaPlaca').Value := dbePlaca.Text;
      DMAF.cdsTraslado.FieldByName('TraGuiaFl').Value:= 'P';
      DMAF.cdsTraslado.FieldByName('TraHReg').Value  := Time ;
      DMAF.cdsTraslado.FieldByName('TraFReg').Value  := Date ;
      DMAF.cdsTraslado.FieldByName('TraUser').Value  := DMAF.wUsuario ;
      cdsPost( DMAF.cdsTraslado );
      DMAF.cdsTraslado.Next;
   end;
   GuiaEstado( DMAF.cdsTraslado.FieldByName('TRAGUIAFL').AsString );
   DMAF.AplicaDatos(DMAF.cdsTraslado, 'TRASLADO');
   DMAF.cdsTraslado.First;

   pnlDetalle.Enabled   :=False;
   pnlCab.Enabled       :=False;
   pnlBotones.Enabled   :=True;
   Z2bbtnGraba.Enabled  :=False;
   Z2bbtnAcepta.Enabled :=False;
   Z2bbtnCancela.Enabled:=False;
   Z2bbtnImprime.Enabled:=True;
   ShowMessage(' Guía Aceptada ');
end;

procedure TFGuiaR.Z2bbtnCancelaClick(Sender: TObject);
var
   xSQL : String;
begin
   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
     xSQL:='SELECT * FROM ACF202 '
          +'WHERE COALESCE(TRAESTADO,'''')=''A'' and '
          +      'COALESCE(F_ULTIMO, '''')=''S'' and '
          +      'COALESCE(EXTERNO,  '''')=''S'' ';
   end;
   if SRV_D = 'ORACLE' then
   begin
     xSQL:='SELECT * FROM ACF202 '
          +'WHERE NVL(TRAESTADO,'''')=''A'' and '
          +      'NVL(F_ULTIMO, '''')=''S'' and '
          +      'NVL(EXTERNO,  '''')=''S'' ';
   end;

   DMAF.cdsTrasPen.Close;
   DMAF.cdsTrasPen.DataRequest(xSQL);
   DMAF.cdsTrasPen.Open;

   DMAF.cdsTrasPen.Filtered:=False;
   DMAF.cdsTrasPen.Filter  :='';
   DMAF.cdsTrasPen.Filter  :='TRAGUIA_R='''' ';
   DMAF.cdsTrasPen.Filtered:=true;

   xSQL:='SELECT * FROM ACF202 Where CIAID=''ZZ'' ';

   DMAF.cdsTraslado.Close;
   DMAF.cdsTraslado.DataRequest(xSQL);
   DMAF.cdsTraslado.Open;

   pnlDetalle.Enabled:=False;
   pnlBotones.Enabled:=False;
   pnlCab.Enabled    :=False;

   dbeNumGuia.Text:='';
   dtpFecha.Date  :=0;
   dbeTransp.Text :='';
   dbeRuc.Text    :='';
   dbePlaca.Text  :='';
   dbeObser.text  :='';

   pnlBarra.Enabled  :=True;
   GuiaEstado( '' );
end;

procedure TFGuiaR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DMAF.cdsTraslado.Filtered:=False;
   DMAF.cdsTraslado.Filter  :='';
   DMAF.cdsTraslado.Close;

   //AGREGADO POR ANA
   DMAF.cdsTrasPen.Filtered:=False;
   DMAF.cdsTrasPen.Filter  :='';
   DMAF.cdsTrasPen.Close;
   DMAF.cdsTrasPen.IndexFieldNames:='';


end;

procedure TFGuiaR.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
   begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0 );
   end;
end;

end.
