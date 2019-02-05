unit ACF231;
// HPC_201401_ACF  se ha modificado el Query para actualizar todo lo que este en estado 'P' a estado 'X' de la tabla ACF204
//                 ya que aún no se ha depreciado en su totalidad.

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Mask, wwdbedit, wwdblook;

type
  TFDesDeprecia = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    lblPeriodo: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCiades: TEdit;
    dblcTipoD: TwwDBLookupCombo;
    dbeTipo: TwwDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    bbtnAceptar: TBitBtn;
    bbtnCancel: TBitBtn;
    procedure spProcesaClick(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblcTipoDExit(Sender: TObject);
    procedure dblcTipoDClick(Sender: TObject);
    procedure bbtnAceptarClick(Sender: TObject);
    procedure bbtnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dblcTipoDEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDesDeprecia: TFDesDeprecia;
  periodo : String;
implementation

uses ACFDM;

{$R *.DFM}

procedure TFDesDeprecia.spProcesaClick(Sender: TObject);
var
  xsql,  nperiodo,Wsql :String;
  WFECDEPRE: TDATE;
begin

   if MessageDlg('Proceso Elimina el  '+#13+#13+
                 '   ultimo Periodo   '+#13+#13+
                 ' Procesado ' +periodo+' . '+#13+#13+
                 ' Para Esto todas las Tablas de  '+#13+#13+
                 '   Referencia deben estar Ok.   '+#13+#13+
                 '  ¿ Esta Seguro de Re Procesar ?  ', mtconfirmation,[mbYes,MbNo],0)=mrYes then
   begin

      if MessageDlg('Proceso Eliminara Data de Depreciación'+#13+#13+
                    '         del Periodo '+periodo+'       '+#13+#13+
                    '      ¿ Esta Seguro de Procesar ?     ', mtconfirmation,[mbYes,MbNo],0)=mrNo
                     then Exit
      else
      Begin

         if dblcCia.Text='' then
         begin
           dblcCia.SetFocus;
           ShowMessage('Error : Falta Seleccionar Compañía');
           Exit;
         end;

         if edtCiades.Text='' then
         begin
           dblcCia.SetFocus;
           ShowMessage('Error : Falta Seleccionar Compañía');
           Exit;
         end;

         if dblcTipoD.Text='' then begin
            dblcTipoD.SetFocus;
            ShowMessage('Error : Falta Tipo de Depreciación');
            Exit;
         end;

         if dbeTipo.Text='' then begin
            dblcTipoD.SetFocus;
            ShowMessage('Error : Falta Tipo de Depreciación');
            Exit;
         end;

       // Verifica se el Periodo que desea des depreciar ya se enceuntra cerrado
         xsql:='SELECT DEPCOD,FAPERIODO FROM ACF104 ';
         DMAF.cdsQry2.close;
         DMAF.cdsQry2.Datarequest(XSQL);
         DMAF.cdsQry2.Open;
         If DMAF.cdsQry2.fieldbyname('FAPERIODO').asstring<>periodo then
         Begin
            If DMAF.cdsQry2.fieldbyname('DEPCOD').asstring<>dblcTipoD.text then
            Begin
               Showmessage('Debe cerrar el Periodo '+periodo+' antes de Procesar' );
               Exit;
            End;
         End;

      //Prepara el periodo  para ser Procesado Nuevamente
         xsql:='UPDATE  ACF102  SET FAPROC=''X'' WHERE  FAPERIODO='''+periodo+''' ';
         DMAF.cdsQry2.close;
         DMAF.cdsQry2.Datarequest(XSQL);
         DMAF.cdsQry2.Execute;
      //Obtiene el Ultimo periodo  Depreciado
         xsql:='select FAPERIODO,FAFECDEPRE from ACF102 WHERE  FAPROC=''P'' ORDER BY   FAPERIODO ';
         DMAF.cdsQry2.close;
         DMAF.cdsQry2.Datarequest(XSQL);
         DMAF.cdsQry2.Open;
         DMAF.cdsQry2.last;

         nperiodo:=DMAF.cdsQry2.fieldbyname('FAPERIODO').asstring;
         wFecDepre :=DMAF.cdsQry2.fieldbYName('FAFECDEPRE').value;

         if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
         begin
         wSql:='Update ACF104 SET FAFECDEPRE=(DATE(';
         wSql:=wSql+''''+FORMATDATETIME('YYYY-MM-DD', WFECDEPRE )+'''';
         wSql:=wSql+')), FAPERIODO=' +''''+nperiodo    +''', DEPFCIERRE=(DATE(';
         wSql:=wSql+''''+FORMATDATETIME('YYYY-MM-DD', WFECDEPRE )+'''';
         wSql:=wSql+')) ';
         wSql:=wSql+ ' WHERE DEPCOD='+''''+dblcTipoD.Text+'''';
         end;

         if (SRV_D = 'ORACLE') then
         begin
            wSql:='Update ACF104 SET FAFECDEPRE=(TO_DATE(';
            wSql:=wSql+''''+FORMATDATETIME(DMAF.wFormatFecha,WFECDEPRE)+'''';
            wSql:=wSql+')), FAPERIODO=' +''''+nperiodo    +''' ,DEPFCIERRE=(TO_DATE(';
            wSql:=wSql+''''+FORMATDATETIME(DMAF.wFormatFecha,WFECDEPRE)+'''';
            wSql:=wSql+')) ';
            wSql:=wSql+ ' WHERE DEPCOD='+''''+dblcTipoD.Text+'''';
         end;

         DMAF.cdsQry.close;
         DMAF.cdsQry.Datarequest(WSQL);
         DMAF.cdsQry.Execute;

         //Elimina los registros depreciados del Periodo que se va a reprocesar
         XSQL:=' DELETE  FROM ACF204 '
            + ' WHERE FAPERIODO='''+periodo
            +''' AND CIAID='''+dblcCia.text
            +''' AND ACFDEPEST=''DEPRECIADO'' AND DEPCOD='''+dblcTipoD.text+'''';
         Try
           DMAF.DCOM1.AppServer.EjecutaSQL(XSQL);
         Except
         End;

         XSQL:=' UPDATE  ACF204 SET DEPANTHIST=0, DEPNETOHIS=0,DEPFLAGPRO=''X'', '
            +' ACFDEPEST='' '''
            + ' WHERE FAPERIODO='''+periodo
            +''' AND CIAID='''+dblcCia.text
            +''' AND ACFDEPEST=''COMPRAS'' AND DEPCOD='''+dblcTipoD.text+'''';
         Try
           DMAF.DCOM1.AppServer.EjecutaSQL(XSQL);
         Except
         End;

         XSQL:=' SELECT FAPERIODO FROM ACF104  WHERE DEPCOD='''+dblcTipoD.text+'''';
         DMAF.cdsQry.close;
         DMAF.cdsQry.Datarequest(xSQL);
         DMAF.cdsQry.Open;

         XSQL:=' UPDATE  ACF204 SET DEPFLAGPRO=''X'' '
            + ' WHERE FAPERIODO='''+DMAF.cdsQry.fieldbyname('FAPERIODO').asstring
            +''' AND CIAID='''+dblcCia.text
            +''' AND DEPCOD='''+dblcTipoD.text+'''';
         Try
           DMAF.DCOM1.AppServer.EjecutaSQL(XSQL);
         Except
         End;


         Showmessage('Proceso Terminado');
      End;
   End;


end;

procedure TFDesDeprecia.dblcCiaExit(Sender: TObject);
var
  xwhere : String;
  xsql : String;
begin
   xWhere:='CIAID='''+dblcCia.Text+'''';
   edtCiades.Text:=DMAF.DisplayDescrip('dspTGE','TGE101','CIADES',xWhere,'CIADES');

   if edtCiades.Text='' then begin
      dblcCia.SetFocus;
      ShowMessage('Error : Falta Seleccionar Compañía');
      Exit;
   end;

   xsql:='select FAPERIODO, DEPCOD from ACF102 '
        +'WHERE CIAID='''+dblcCia.Text+''' AND FAPROC=''P'' ORDER BY FAPERIODO ';
   DMAF.cdsQry2.close;
   DMAF.cdsQry2.Filter  :='';
   DMAF.cdsQry2.Filtered:=False;
   DMAF.cdsQry2.Datarequest(XSQL);
   DMAF.cdsQry2.Open;
   DMAF.cdsQry2.last;

   periodo:=DMAF.cdsQry2.fieldbyname('FAPERIODO').asstring;
   lblPeriodo.caption:=DMAF.cdsQry2.fieldbyname('FAPERIODO').asstring;

   XSQL:='Select A.DEPCOD, A.DEPDESCRI FROM ACF104 A, ACF102 B '
        +'WHERE A.CIAID='''+dblcCia.Text+''' '
        +  'AND A.CIAID=B.CIAID AND A.DEPCOD=B.DEPCOD AND B.FAPERIODO='''+periodo+'''';
   DMAF.cdsQry9.close;
   DMAF.cdsQry9.Datarequest(XSQL);
   DMAF.cdsQry9.Open;

   dblcTipoD.Selected.Clear;
   dblcTipoD.Selected.Add('DEPCOD'#9'8'#9'Código'#9'F');
   dblcTipoD.Selected.Add('DEPDESCRI'#9'20'#9'Descripción'#9'F');

   dblcTipoD.Enabled:=True;

end;

procedure TFDesDeprecia.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
   begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0 );
   end;

end;

procedure TFDesDeprecia.dblcTipoDExit(Sender: TObject);
var
  xwhere : String;
begin
   xWhere:='DEPCOD='''+dblcTipoD.Text+'''';
   dbeTipo.Text:=DMAF.DisplayDescrip('dspTGE','ACF104','DEPDESCRI',xWhere,'DEPDESCRI');

   if dbeTipo.Text='' then begin
      dblcTipoD.SetFocus;
      ShowMessage('Error : Falta Tipo de Depreciación');
   end;

end;

procedure TFDesDeprecia.dblcTipoDClick(Sender: TObject);
begin
dblcTipoDExit(Sender);
end;

procedure TFDesDeprecia.bbtnAceptarClick(Sender: TObject);
var
  xsql,  nperiodo,Wsql :String;
  WFECDEPRE: TDATE;
begin
   if MessageDlg('Proceso Elimina el  '+#13+#13+
                 '   último Periodo   '+#13+#13+
                 ' Procesado ' +periodo+' . '+#13+#13+
                 '  ¿ Esta Seguro de Re Procesar ?  ', mtconfirmation,[mbYes,MbNo],0)=mrYes then
   begin

      if MessageDlg('Proceso Eliminara Data de Depreciación'+#13+#13+
                    '         del Periodo '+periodo+'       '+#13+#13+
                    '      ¿ Esta Seguro de Procesar ?     ', mtconfirmation,[mbYes,MbNo],0)=mrNo
                     then Exit
      else
      Begin

         if dblcCia.Text='' then
         begin
           dblcCia.SetFocus;
           ShowMessage('Error : Falta Seleccionar Compañía');
           Exit;
         end;

         if edtCiades.Text='' then
         begin
           dblcCia.SetFocus;
           ShowMessage('Error : Falta Seleccionar Compañía');
           Exit;
         end;

         if dblcTipoD.Text='' then begin
            dblcTipoD.SetFocus;
            ShowMessage('Error : Falta Tipo de Depreciación');
            Exit;
         end;

         if dbeTipo.Text='' then begin
            dblcTipoD.SetFocus;
            ShowMessage('Error : Falta Tipo de Depreciación');
            Exit;
         end;

       // Verifica se el Periodo que desea des depreciar ya se enceuntra cerrado
         xsql:='SELECT CIAID, DEPCOD, FAPERIODO FROM ACF104 '
              +'WHERE CIAID='''+dblcCia.Text+'''';
         DMAF.cdsQry2.close;
         DMAF.cdsQry2.Datarequest(XSQL);
         DMAF.cdsQry2.Open;
         If DMAF.cdsQry2.fieldbyname('FAPERIODO').asstring<>periodo then
         Begin
            If DMAF.cdsQry2.fieldbyname('DEPCOD').asstring<>dblcTipoD.text then
            Begin
               Showmessage('Debe cerrar el Periodo '+periodo+' antes de Procesar' );
               Exit;
            End;
         End;

         Screen.Cursor:=CrHourGlass;

      //Prepara el periodo  para ser Procesado Nuevamente
         xsql:='UPDATE ACF102 SET FAPROC=''X'' '
              +'WHERE CIAID='''+dblcCia.Text+''' AND FAPERIODO='''+periodo+'''';
         DMAF.cdsQry2.close;
         DMAF.cdsQry2.Datarequest(XSQL);
         DMAF.cdsQry2.Execute;

         xsql:='delete ACF102 '
              +'WHERE CIAID='''+dblcCia.Text+''' AND FAPERIODO>'''+periodo+'''';
         DMAF.cdsQry2.close;
         DMAF.cdsQry2.Datarequest(XSQL);
         DMAF.cdsQry2.Execute;

      //Obtiene el Ultimo periodo  Depreciado
         xsql:='select FAPERIODO, FAFECDEPRE from ACF102 '
              +'WHERE CIAID='''+dblcCia.Text+''' AND FAPROC=''P'' '
              +'ORDER BY FAPERIODO ';
         DMAF.cdsQry2.close;
         DMAF.cdsQry2.Datarequest(XSQL);
         DMAF.cdsQry2.Open;
         DMAF.cdsQry2.last;

         nperiodo :=DMAF.cdsQry2.fieldbyname('FAPERIODO').asstring;
         wFecDepre:=DMAF.cdsQry2.fieldbYName('FAFECDEPRE').AsDateTime;

         if nPeriodo='' then
         begin
            xSQL:='Select MIN(FAPERIODO) FAPERIODO, MIN(FAFECDEPRE) FAFECDEPRE '
                 +'From ACF102 '
                 +'WHERE CIAID='''+dblcCia.Text+'''';
            DMAF.cdsQry2.close;
            DMAF.cdsQry2.Datarequest(XSQL);
            DMAF.cdsQry2.Open;
            nperiodo :=DMAF.cdsQry2.fieldbyname('FAPERIODO').asstring;
            wFecDepre:=DMAF.cdsQry2.fieldbYName('FAFECDEPRE').AsDateTime;
         end;

         wSql:='Update ACF104 SET '
              +   'FAFECDEPRE=(TO_DATE('''+FORMATDATETIME(DMAF.wFormatFecha,WFECDEPRE)+''' )), '
              +   'FAPERIODO='''+ nperiodo +''', '
              +   'DEPFCIERRE=(TO_DATE('''+FORMATDATETIME(DMAF.wFormatFecha,WFECDEPRE)+''' )) '
              +'WHERE CIAID='''+dblcCia.Text+''' AND DEPCOD='''+dblcTipoD.Text+'''';
         DMAF.cdsQry.close;
         DMAF.cdsQry.Datarequest(WSQL);
         DMAF.cdsQry.Execute;

         //Elimina los registros depreciados del Periodo que se va a reprocesar
         xSQL:='DELETE  FROM ACF204 '
              +'WHERE FAPERIODO='''+periodo+''' AND CIAID='''+dblcCia.text+''' '
              +  'AND DEPCOD='''+dblcTipoD.text+'''';
         Try
           DMAF.cdsQry.close;
           DMAF.cdsQry.Datarequest(xSQL);
           DMAF.cdsQry.Execute;
         Except
         End;
         {
         xSQL:='UPDATE ACF204 SET DEPANTHIST=0, DEPNETOHIS=0, DEPFLAGPRO=''X'', ACFDEPEST='' '' '
              +'WHERE FAPERIODO='''+periodo+''' AND CIAID='''+dblcCia.text+''' '
              +  'AND ACFDEPEST=''COMPRAS'' AND DEPCOD='''+dblcTipoD.text+'''';
         Try
           DMAF.DCOM1.AppServer.EjecutaSQL(XSQL);
         Except
         End;
         }
         xSQL:='SELECT FAPERIODO FROM ACF104 WHERE CIAID='''+dblcCia.Text+''' AND DEPCOD='''+dblcTipoD.text+'''';
         DMAF.cdsQry.close;
         DMAF.cdsQry.Datarequest(xSQL);       //200203
         DMAF.cdsQry.Open;
// Inicio HPC_201401_ACF
         {xSQL:='UPDATE ACF204 SET DEPFLAGPRO=''X'' '
              +'WHERE FAPERIODO='''+DMAF.cdsQry.fieldbyname('FAPERIODO').asstring+''' '
              +  'AND CIAID='''+dblcCia.text+''' AND DEPCOD='''+dblcTipoD.text+'''';}
          xSQL:='UPDATE (SELECT * FROM (Select * from ACF204 where DEPFECHA=(SELECT MAX(DEPFECHA) FROM ACF204 B where B.ARTCODBAR=ACF204.ARTCODBAR)) AA WHERE AA.DEPFLAGPRO IN (''P'')) '
              + 'SET DEPFLAGPRO=''X'' ';
// Fin HPC_201401_ACF
         Try
           DMAF.cdsQry.close;
           DMAF.cdsQry.Datarequest(xSQL);
           DMAF.cdsQry.Execute;
         Except
         End;

         Screen.Cursor:=CrDefault;

         bbtnAceptar.Enabled:=False;
         dblcCia.Enabled    :=False;
         dblcTipoD.Enabled  :=False;

         Showmessage('Proceso Terminado');
      End;
   End;


end;


procedure TFDesDeprecia.bbtnCancelClick(Sender: TObject);
begin
FDesDeprecia.close;
end;

procedure TFDesDeprecia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMAF.cdsQry.Filtered:=False;
   DMAF.cdsQry.Filter  :='';
   DMAF.cdsQry.IndexFieldNames:='';
   DMAF.cdsQry.Close;

   DMAF.cdsQry2.Filtered:=False;
   DMAF.cdsQry2.Filter  :='';
   DMAF.cdsQry2.IndexFieldNames:='';
   DMAF.cdsQry2.Close;

   DMAF.cdsQry9.Filtered:=False;
   DMAF.cdsQry9.Filter  :='';
   DMAF.cdsQry9.IndexFieldNames:='';
   DMAF.cdsQry9.Close;
end;

procedure TFDesDeprecia.FormShow(Sender: TObject);
begin
   dblcCia.Enabled:=True;
   dblcCia.SetFocus;
   bbtnAceptar.Enabled:=True;
end;

procedure TFDesDeprecia.dblcTipoDEnter(Sender: TObject);
begin
   if not DMAF.cdsQry9.Active then dblcCia.SetFocus;
end;

end.
