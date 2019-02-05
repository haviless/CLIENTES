Unit ACF782;
//*********************************************************
// MODIFICADO POR   : Abelardo Sulca Palomino
// Nº HPP           : HPP_201103_ACF
// FECHA DE MODIF.  : 15/03/2011
// DESCRIPCION      : Se agrega el botón "Rpt Traslados" que invocará a la
//                    ventana de filtros para el reporte de traslados
//*********************************************************
//********************************************************
// MODIFICADO POR   : Abelardo Sulca Palomino
// Nº HPP           : HPP_201107_ACF
// FECHA DE MODIF.  : 13/05/2011
// DESCRIPCION      : Se adiciona el campo ACF201.CODIGOBARRA en las consultas
//                    para que se muestre el código de barra cambiado por el usuario
//********************************************************

// Actualizaciones
// HPC_201701_ACF 26/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, ExtCtrls, ComCtrls;

Type
   TFToolsParaTraslados = Class(TForm)
      pnlTraslados: TPanel;
      pcTraslados: TPageControl;
      ts1: TTabSheet;
      ts2: TTabSheet;
      Button1: TButton;
      Button2: TButton;
      Button3: TButton;
      Button4: TButton;
      btnTraslados: TBitBtn;
      Procedure pcTrasladosChange(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure Button1Click(Sender: TObject);
      Procedure Button2Click(Sender: TObject);
      Procedure Button3Click(Sender: TObject);
      Procedure Button4Click(Sender: TObject);
      Procedure btnTrasladosClick(Sender: TObject);
   Private
    { Private declarations }
      xSQL: String;
   Public
    { Public declarations }
   End;

Var
   FToolsParaTraslados: TFToolsParaTraslados;

Implementation

Uses ACFDM, ACF780, ACF785;

{$R *.DFM}

Procedure TFToolsParaTraslados.pcTrasladosChange(Sender: TObject);
Begin
   ts1.highlighted := False;
   ts2.highlighted := False;

   If pcTraslados.ActivePage = ts1 Then // x Orden de Traslado
   Begin
      DMAF.wJK := '1';
      ts1.highlighted := True;
      xSQL := 'Select * from ACF320 ';
      ACF780.MantTraslados.UsuarioSQL.Clear;
      ACF780.MantTraslados.FMant.wTabla := 'ACF320';
      ACF780.MantTraslados.UsuarioSQL.Add(XSQL);
      ACF780.MantTraslados.NewQuery;
   End;

   If pcTraslados.ActivePage = ts2 Then // x Activos Trasladados
   Begin
      DMAF.wJK := '0';
      ts2.highlighted := True;
      xSQL := 'Select ACF201.CODIGOBARRA CODIGOBARRA, ACF321.* '
         + '     from ACF321, ACF201 '
         + '    where ACF321.ARTCODBAR = ACF201.ARTCODBAR ';
      ACF780.MantTraslados.UsuarioSQL.Clear;
      ACF780.MantTraslados.FMant.wTabla := 'ACF321';
      ACF780.MantTraslados.UsuarioSQL.Add(XSQL);
      ACF780.MantTraslados.NewQuery;
   End;
End;

Procedure TFToolsParaTraslados.FormCreate(Sender: TObject);
Begin
   pcTraslados.ActivePage := ts1;
End;

Procedure TFToolsParaTraslados.Button1Click(Sender: TObject);
Var
   wxCiaid: String;
Begin
//////////////////////////////////////////////////////////////
// Proceso temporal, actualiza el ACF201 desde el ACF321,
// para actualizar el bien(ACF201) con el destino del ultimo traslado
// realizado.

   xSQL := ' Select * '
      + '      from ACF321 '
      + '     where FECTRAS>''31/12/2005'' '
      + '     order by ARTCODBAR, FECTRAS';
   DMAF.cdsInvTras.Close;
   DMAF.cdsInvTras.IndexFieldNames := '';
   DMAF.cdsInvTras.Filter := '';
   DMAF.cdsInvTras.Filtered := False;
   DMAF.cdsInvTras.DataRequest(xSQL);
   DMAF.cdsInvTras.Open;

   DMAF.cdsInvTras.First;
   While Not DMAF.cdsInvTras.EOF Do
   Begin
   // actualiza el archivo de Inventarios
      xSQL := 'Update ACF201 '
         + '      set UBICID=' + quotedstr(DMAF.cdsInvTras.FieldByName('TRANCIAID').AsString) + ','
         + '          LOCID=' + quotedstr(DMAF.cdsInvTras.FieldByName('TRANLOCID').AsString) + ','
         + '          PISO=' + quotedstr(DMAF.cdsInvTras.FieldByName('TRANPISO').AsString) + ','
         + '          AREA=' + quotedstr(DMAF.cdsInvTras.FieldByName('TRANAREA').AsString) + ','
         + '          AMBCOD=' + quotedstr(DMAF.cdsInvTras.FieldByName('TRANAMBCOD').AsString) + ','
         + '          RECIBEID=' + quotedstr(DMAF.cdsInvTras.FieldByName('RECIBEID').AsString) + ','
         + '          RECIBENOM=' + quotedstr(DMAF.cdsInvTras.FieldByName('RECIBENOM').AsString) + ','
         + '          TRAFECHA=' + quotedstr(DMAF.cdsInvTras.FieldByName('FECTRAS').AsString) + ','
         + '          OTRTDOC=' + quotedstr(DMAF.cdsInvTras.FieldByName('DOCREF').AsString) + ','
         + '          OTRNDOC=' + quotedstr(DMAF.cdsInvTras.FieldByName('NUMDOC').AsString) + ','
         + '          ACFUSER=' + quotedstr(DMAF.cdsInvTras.FieldByName('USUARIO').AsString) + ' '
         + '    where ARTCODBAR=' + quotedstr(DMAF.cdsInvTras.FieldByName('ARTCODBAR').AsString);
      Try
         DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Activo No se ha podido Actualizar');
         exit;
      End;
      DMAF.cdsInvTras.Next;
   End;
End;

Procedure TFToolsParaTraslados.Button2Click(Sender: TObject);
Var
   wxCiaid, Xsql: String;
Begin
//////////////////////////////////////////////////////////////
// Proceso temporal, chequea registros del ACF201 sin coincidencia
// de ambiente en el ACF123
//////////////////////////////////////////////////////////////
   xSQL := ' Select * from ACF123 ';
   DMAF.cdsAmbiente.Close;
   DMAF.cdsAmbiente.IndexFieldNames := '';
   DMAF.cdsAmbiente.Filter := '';
   DMAF.cdsAmbiente.Filtered := False;
   DMAF.cdsAmbiente.DataRequest(xSQL);
   DMAF.cdsAmbiente.Open;

   xSQL := ' Select LOCID, PISO, AREA, AMBCOD '
      + '      from ACF201 '
      + '     group by LOCID, PISO, AREA, AMBCOD ';
   DMAF.cdsInvTras.Close;
   DMAF.cdsInvTras.IndexFieldNames := '';
   DMAF.cdsInvTras.Filter := '';
   DMAF.cdsInvTras.Filtered := False;
   DMAF.cdsInvTras.DataRequest(xSQL);
   DMAF.cdsInvTras.Open;

   DMAF.cdsInvTras.First;
   While Not DMAF.cdsInvTras.EOF Do
   Begin
   // obtiene CIAID desde el ACF123 - ambientes
      wxCiaId := DMAF.FindCiaId(DMAF.cdsInvTras.FieldByName('LOCID').AsString,
         DMAF.cdsInvTras.FieldByName('PISO').AsString,
         DMAF.cdsInvTras.FieldByName('AREA').AsString,
         DMAF.cdsInvTras.FieldByName('AMBCOD').AsString);
      If (wxCiaId = 'EE') Or (wxCiaId = '') Then
      Begin
         xSQL := 'INSERT INTO ACF201ERROR(LOCID, PISO, AREA, AMBCOD) '
            + '   VALUES(' + quotedstr(DMAF.cdsInvTras.FieldByName('LOCID').AsString) + ','
            + quotedstr(DMAF.cdsInvTras.FieldByName('PISO').AsString) + ','
            + quotedstr(DMAF.cdsInvTras.FieldByName('AREA').AsString) + ','
            + quotedstr(DMAF.cdsInvTras.FieldByName('AMBCOD').AsString) + ')';
         DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
      End;
      DMAF.cdsInvTras.Next;
   End;
End;

Procedure TFToolsParaTraslados.Button3Click(Sender: TObject);
Var
   xSQL, wTACFID: String;
   wNumBAr: integer;
Begin
//////////////////////////////////////////////////////////////
// Proceso temporal, actualiza CUADERNO1 para ingrearlo al ACF201
/// ACTUALIZA CORRELATIVO DE ACFID
//////////////////////////////////////////////////////////////

   xSQL := ' Select * '
      + '      from ACF201 '
      + '     Order by TACFID';
   DMAF.cdsInvTras.Close;
   DMAF.cdsInvTras.IndexFieldNames := '';
   DMAF.cdsInvTras.Filter := '';
   DMAF.cdsInvTras.Filtered := False;
   DMAF.cdsInvTras.DataRequest(xSQL);
   DMAF.cdsInvTras.Open;

   DMAF.cdsInvTras.First;
   While Not DMAF.cdsInvTras.EOF Do
   Begin
      wNumBar := 0;
      wTACFID := DMAF.cdsInvTras.FieldByName('TACFID').AsString;
      While Not (DMAF.cdsInvTras.EOF) And (wTACFID = DMAF.cdsInvTras.FieldByName('TACFID').AsString) Do
      Begin
         wNumBar := wNumBar + 1;
         DMAF.cdsInvTras.Edit;
         DMAF.cdsInvTras.FieldByName('ACFID').AsString := '0' + IntToStr(wNumbar);
         DMAF.AplicaDatos(DMAF.cdsInvTras, '');
         DMAF.cdsInvTras.Next;
      End;
   End;
End;

Procedure TFToolsParaTraslados.Button4Click(Sender: TObject);
Var
   wxCiaid: String;
Begin
//////////////////////////////////////////////////////////////
// Proceso temporal, actualiza el ACF321 desde el ACF320,
// por Numero de Transferencia
//////////////////////////////////////////////////////////////

   xSQL := ' SELECT * FROM ACF320 ORDER BY NUMDOC ';
   DMAF.cdsAmbiente.Close;
   DMAF.cdsAmbiente.IndexFieldNames := '';
   DMAF.cdsAmbiente.Filter := '';
   DMAF.cdsAmbiente.Filtered := False;
   DMAF.cdsAmbiente.DataRequest(xSQL);
   DMAF.cdsAmbiente.Open;

   xSQL := ' SELECT * FROM ACF321 ORDER BY ARTCODBAR, NUMDOC ';
   DMAF.cdsInvTras.Close;
   DMAF.cdsInvTras.IndexFieldNames := 'ARTCODBAR;NUMDOC';
   DMAF.cdsInvTras.Filter := '';
   DMAF.cdsInvTras.Filtered := False;
   DMAF.cdsInvTras.DataRequest(xSQL);
   DMAF.cdsInvTras.Open;

   DMAF.cdsInvTras.First;
   While Not DMAF.cdsInvTras.EOF Do
   Begin
      xsQL := 'SELECT * FROM ACF320 where NUMDOC=' + quotedstr(DMAF.cdsInvTras.FieldByName('NUMDOC').AsString);
      DMAF.cdsAmbiente.Close;
      DMAF.cdsAmbiente.DataRequest(xSQL);
      DMAF.cdsAmbiente.Open;
      If DMAF.cdsAmbiente.RecordCount > 0 Then
      Begin
         If
            (DMAF.cdsInvTras.FieldByName('TRANLOCID').AsString <> DMAF.cdsAmbiente.FieldByName('LOCAL_D').AsString) Or
            (DMAF.cdsInvTras.FieldByName('TRANPISO').AsString <> DMAF.cdsAmbiente.FieldByName('PISO_D').AsString) Or
            (DMAF.cdsInvTras.FieldByName('TRANAREA').AsString <> DMAF.cdsAmbiente.FieldByName('AREA_D').AsString) Or
            (DMAF.cdsInvTras.FieldByName('TRANAMBCOD').AsString <> DMAF.cdsAmbiente.FieldByName('AMB_D').AsString) Then
         Begin
            DMAF.cdsInvTras.Edit;
            DMAF.cdsInvTras.FieldByName('TRANLOCID').AsString := DMAF.cdsAmbiente.FieldByName('LOCAL_D').AsString;
            DMAF.cdsInvTras.FieldByName('TRANPISO').AsString := DMAF.cdsAmbiente.FieldByName('PISO_D').AsString;
            DMAF.cdsInvTras.FieldByName('TRANAREA').AsString := DMAF.cdsAmbiente.FieldByName('AREA_D').AsString;
            DMAF.cdsInvTras.FieldByName('TRANAMBCOD').AsString := DMAF.cdsAmbiente.FieldByName('AMB_D').AsString;
            DMAF.AplicaDatos(DMAF.cdsInvTras, '');
         End;
      End;
      DMAF.cdsInvTras.Next;
   End;
End;

Procedure TFToolsParaTraslados.btnTrasladosClick(Sender: TObject);
Begin
   Try
      FRptTraslados := TFRptTraslados.Create(Application); // ACF785
      FRptTraslados.ShowModal;
   Finally
      FRptTraslados.Free;
   End;
End;

End.

