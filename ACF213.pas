Unit ACF213;
//********************************************************
// MODIFICADO POR   : Abelardo Sulca Palomino
// Nº HPP           : HPP_201107_ACF
// FECHA DE MODIF.  : 13/05/2011
// DESCRIPCION      : Se adiciona el campo ACF201.CODIGOBARRA para que
//                    sea actualizado al momento de modificar la denominación
//                    del activo fijo
//********************************************************

// Actualizaciones
// HPC_201701_ACF 26/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, Mask, wwdbedit, Grids, Wwdbigrd, Wwdbgrid,
   ExtCtrls, wwdblook;

Type
   TFDenominacion = Class(TForm)
      pnlBusqueda: TPanel;
      lblBusca: TLabel;
      dbgBusca: TwwDBGrid;
      bbtnOkBusca: TBitBtn;
      bbtnCancBusca: TBitBtn;
      dbeBusca: TwwDBEdit;
      pnlDenominacion: TPanel;
      Label1: TLabel;
      dbeDenominaci: TwwDBEdit;
      bbtnDenominaci: TBitBtn;
      Label2: TLabel;
      dbeACFDESL: TwwDBEdit;
      Label3: TLabel;
      Label4: TLabel;
      dbeDimensione: TwwDBEdit;
      Z2bbtnGraba: TBitBtn;
      Label5: TLabel;
      dblcMaterial: TwwDBLookupCombo;
      dblcEstado: TwwDBLookupCombo;
      edtEstado: TEdit;
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure bbtnDenominaciClick(Sender: TObject);
      Procedure bbtnCancBuscaClick(Sender: TObject);
      Procedure bbtnOkBuscaClick(Sender: TObject);
      Procedure dbeBuscaExit(Sender: TObject);
      Procedure Z2bbtnGrabaClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure dblcEstadoExit(Sender: TObject);
   Private
    { Private declarations }
      xSQL: String;
   Public
    { Public declarations }
      Procedure AccesaCXP301;
   End;

Var
   FDenominacion: TFDenominacion;
   xBuscaDenominaci: boolean; // flag q indica búsqueda de Denominacion
   wLocal, wPiso, wArea, wAmbiente, wTacf, wTacfMax, wCuentaId, wVidaUtil, wCiaId: String;
   wPorTacf: double;

Implementation

Uses ACFDM, ACF780;

{$R *.dfm}

Procedure TFDenominacion.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
// DMALM.ActualizaFiltro(mtx3000,DMALM.cdsNIA,DMALM.wModo);
   MantCompras.RefreshFilter;
   Screen.Cursor := crDefault;
 //INICIO HPP_201107_ACF
   DMAF.cdsQry.Close;
 //FIN HPP_201107_ACF
   Action := caFree;
End;

Procedure TFDenominacion.bbtnDenominaciClick(Sender: TObject);
Begin
   xBuscaDenominaci := True;
//   xBuscaUsuBienTras:=False;
//   xBuscaUsuAutoTras:=False;
//   xBuscaUsuOrigTras:=False;
   pnlDenominacion.Enabled := False;
   pnlBusqueda.BringToFront;
   pnlBusqueda.Left := 180;
   pnlBusqueda.Top := 129;
   pnlBusqueda.Visible := True;
   dbeBusca.Clear;
   dbeBusca.SetFocus;
End;

Procedure TFDenominacion.bbtnCancBuscaClick(Sender: TObject);
Begin
   pnlDenominacion.Enabled := True;

   // flag q indica búsqueda de Usuario del Bien
   pnlBusqueda.Visible := False;
//      dblcdResponsab.SetFocus;
End;

Procedure TFDenominacion.bbtnOkBuscaClick(Sender: TObject);
Begin
   If bbtnCancBusca.Focused Then exit;
   dbeDenominaci.Text := DMAF.cdsBusca.FieldByName('DENOMINACI').AsString;
   pnlBusqueda.Visible := False;
   pnlDenominacion.Enabled := True;
   dbeDenominaci.Enabled := False;
   dbeACFDESL.SetFocus;
End;

Procedure TFDenominacion.dbeBuscaExit(Sender: TObject);
Var
   xSQL, xVarBusca: String;
Begin
   If bbtnCancBusca.Focused Then exit;
   If length(dbeBusca.Text) > 0 Then
   Begin
      xVarBusca := '%' + trim(dbeBusca.Text) + '%';
      If xBuscaDenominaci = True Then
         xSQL := 'Select DENOMINACI, TACF from ACF124 where DENOMINACI like(' + quotedstr(xVarBusca) + ')';
      DMAF.cdsBusca.DisableControls;
      DMAF.cdsBusca.Close;
      DMAF.cdsBusca.IndexFieldNames := '';
      DMAF.cdsBusca.Filter := '';
      DMAF.cdsBusca.DataRequest(xSQL);
      DMAF.cdsBusca.Open;
      dbgBusca.Selected.Clear;
      dbgBusca.DataSource := DMAF.dsBusca;
      dbgBusca.Selected.Add('DENOMINACI'#9'50'#9'Denominacion');
      wTacf := DMAF.cdsBusca.FieldByName('TACF').AsString; // Tipo de Activo

      // obtiene Porcentaje de Depreciacion, Tiempo de Vida Util y Cuenta Contable
      xSQL := 'Select * from ACF101 where TACFID=' + quotedstr(wTacf);
      DMAF.cdsQry.Close;
      DMAF.cdsQry.IndexFieldNames := '';
      DMAF.cdsQry.Filter := '';
      DMAF.cdsQry.DataRequest(xSQL);
      DMAF.cdsQry.Open;
      wPorTacf := DMAF.cdsQry.FieldByName('TACFDEPREC').AsInteger;
      wVidaUtil := DMAF.cdsQry.FieldByname('TACFVIDA').AsString;
      wCuentaId := DMAF.cdsQry.FieldByname('CUENTAID').AsString;
      //

      DMAF.cdsBusca.EnableControls;
      dbgBusca.SetFocus;
   End
   Else
      Showmessage('Ingrese una condición para la Búsqueda');
End;

Procedure TFDenominacion.Z2bbtnGrabaClick(Sender: TObject);
Var
   Xsql, wRecibeId, wRecibeNom: String;
Begin
   If length(trim(dbeDenominaci.Text)) = 0 Then
   Begin
      ShowMessage('Falta Denominación');
      bbtnDenominaci.SetFocus;
      exit;
   End;
   // Obtiene el Usuario Responsable del Almacen
   xSQL := 'Select * from ACF115 '
      + 'WHERE FLAG=' + quotedstr('S');
   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;
   wRecibeId := DMAF.cdsQry.FieldByName('TRABID').AsString;
   wRecibeNom := DMAF.cdsQry.FieldByName('NOMBRE').AsString;

   // Calcula en Max Codigo de Activo
   xSQL := 'Select MAX( ACFID ) ACFID from ACF201 '
      + 'WHERE CIAID=' + quotedstr(wCiaId) + ' and TACFID=' + quotedstr(wTacf); //+quotedstr(MantCompras.FMant.cds2.FieldByName('CIAID').AsString)+' and TACFID='+quotedstr(wTacf);
   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;
   If DMAF.cdsQry.FieldByName('ACFID').AsString = '' Then
      wTacfMax := DMAF.StrZero(1, DMAF.cdsQry.FieldByName('ACFID').Size)
   Else
   Begin
      wTacfMax := DMAF.StrZero(DMAF.cdsQry.FieldByName('ACFID').AsInteger + 1, Length(DMAF.cdsQry.FieldByName('ACFID').AsString));
   End;

   xSQL := 'Select * from ACF201 '
      + 'WHERE 1<>1 ';
   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;

   MantCompras.FMant.cds2.First;
   While (Not MantCompras.FMant.cds2.Eof) Do
   Begin
      If (MantCompras.FMant.cds2.FieldByName('ESTADOID').AsString) = 'S' Then
      Begin
         Screen.Cursor := crHourGlass;
         DMAF.cdsQry.Append; // Adiciona Maestro
         DMAF.cdsQry.FieldByName('CiaId').AsString := wCiaId; //MantCompras.FMant.cds2.FieldByName('CIAID').AsString;
         DMAF.cdsQry.FieldByName('TacFid').AsString := wTacf;
         DMAF.cdsQry.FieldByName('ACFID').AsString := wTacfMax;
         wTacfMax := DMAF.StrZero(DMAF.cdsQry.FieldByName('ACFID').AsInteger + 1, Length(DMAF.cdsQry.FieldByName('ACFID').AsString));
         DMAF.cdsQry.FieldByName('ACFREFOR').AsString := '00';
         DMAF.cdsQry.FieldByName('ACFFLACOMP').AsString := 'N';
         DMAF.cdsQry.FieldByName('ARTCODBAR').AsString := MantCompras.FMant.cds2.FieldByName('CODBAR').AsString;
         //INICIO HPP_201107_ACF
         DMAF.cdsQry.FieldByName('CODIGOBARRA').AsString := MantCompras.FMant.cds2.FieldByName('CODBAR').AsString;
         //FINS HPP_201107_ACF
         DMAF.cdsQry.FieldByName('ARTID').AsString := MantCompras.FMant.cds2.FieldByName('ARTID').AsString;

         DMAF.cdsQry.FieldByName('AcFidComp').AsString := '';
         DMAF.cdsQry.FieldByName('LocId').AsString := wLocal;
         DMAF.cdsQry.FieldByName('PISO').AsString := wPiso;
         DMAF.cdsQry.FieldByName('AREA').AsString := wArea;
         DMAF.cdsQry.FieldByName('AMBCOD').AsString := wAmbiente;

         DMAF.cdsQry.FieldByName('AcfDes').AsString := dbeDenominaci.Text;
         DMAF.cdsQry.FieldByname('ACFDESL').AsString := dbeACFDESL.Text;
         DMAF.cdsQry.FieldByName('MaterialId').AsString := DMAF.cdsMaterial.FieldByName('MATERIALID').AsString;
         DMAF.cdsQry.FieldByName('AcfTipAdqu').AsString := 'T';
         DMAF.cdsQry.FieldByName('AcFMarca').AsString := MantCompras.FMant.cds2.FieldByName('MARCA').AsString;
         DMAF.cdsQry.FieldByName('AcFModelo').AsString := MantCompras.FMant.cds2.FieldByName('MODELO').AsString;
         DMAF.cdsQry.FieldByName('ACFSERIE').AsString := MantCompras.FMant.cds2.FieldByName('ACFSERIE').AsString;
         DMAF.cdsQry.FieldByName('ACFCOLOR').AsString := MantCompras.FMant.cds2.FieldByName('COLOR').AsString;
         DMAF.cdsQry.FieldByName('ACFMEDIDA').AsString := dbeDimensione.Text;
         DMAF.cdsQry.FieldByName('ESTADOID').AsString := DMAF.cdsEstado.FieldByName('ESTADOID').AsString;

         DMAF.cdsQry.FieldByName('PROV').AsString := MantCompras.FMant.cds2.FieldByName('PROV').AsString;
         DMAF.cdsQry.FieldByName('DOCID').AsString := MantCompras.FMant.cds2.FieldByName('FACTDOC').AsString;
         DMAF.cdsQry.FieldByName('AcFSerieDo').AsString := MantCompras.FMant.cds2.FieldByName('FACNSERIE').AsString;
         DMAF.cdsQry.FieldByName('AcFNoDoc').AsString := MantCompras.FMant.cds2.FieldByName('FACNDOC').AsString;
         DMAF.cdsQry.FieldByName('ODCID').AsString := MantCompras.FMant.cds2.FieldByName('OCNDOC').AsString;
         DMAF.cdsQry.FieldByName('OCNDOC').AsString := MantCompras.FMant.cds2.FieldByName('OCNDOC').AsString;
         DMAF.cdsQry.FieldByName('OCFECHA').AsString := MantCompras.FMant.cds2.FieldByName('OCFECHA').AsString;
         DMAF.cdsQry.FieldByName('ACFFECADQ').AsString := MantCompras.FMant.cds2.FieldByName('OCFECHA').AsString;

         DMAF.cdsQry.FieldByName('UBICID').AsString := wCiaId;
         DMAF.cdsQry.FieldByName('RECIBEID').AsString := wRecibeId;
         DMAF.cdsQry.FieldByName('RECIBENOM').AsString := wRecibeNom;

         DMAF.cdsQry.FieldByName('CCosId').AsString := '';
         DMAF.cdsQry.FieldByName('CuentaId').AsString := wCuentaId;
         DMAF.cdsQry.FieldByName('TacfVida').AsString := wVidaUtil;

//         DMAF.cdsQry.FieldByName('GARANTIA').value  :=wGarantia;

         ///////////////////////////////////////////////////////////////////////
         // desde CXP301 , facturas x pagar
         // aqui obtiene el Tipo de Cambio y actauliza ACFCAMBIO
//         if length(MantCompras.FMant.cds2.FieldByName('ODCID').AsString)>0 then
//            AccesaCXP301;

         /// POR COMPRAS, NO SE USÓ - OBC, el TCAMB ya viene en el LOG332
{         if DMAF.cdsQry.FieldByName('ACFCAMBIO').AsInteger=0 then
         begin
            xSQL:='Select * from LOG304 '
                 +'Where CIAID='''+MantCompras.FMant.cds2.FieldByName('CIAID').AsString +''' AND '
                 +      'PROV='''+MantCompras.FMant.cds2.FieldByname('PROV').AsString+''' AND '
                 +      'ODCID='''+MantCompras.FMant.cds2.FieldByname('ODCID').AsString+'''';
            DMAF.cdsBusca.Close;
            DMAF.cdsBusca.IndexFieldNames:='';
            DMAF.cdsBusca.Filtered:=False; DMAF.cdsBusca.Filter:='';
            DMAF.cdsBusca.DataRequest( xSQL );
            DMAF.cdsBusca.Open;
            DMAF.cdsQry.FieldByName('ACFCAMBIO').Value:=DMAF.cdsBusca.FieldByname('ODCTCAMB').AsFloat;
         end;
}
         ///
         DMAF.cdsQry.FieldByName('ACFCAMBIO').Value := MantCompras.FMant.cds2.FieldByName('TCAMB').AsFloat;
         DMAF.cdsQry.FieldByName('TMonid').AsString := MantCompras.FMant.cds2.FieldByName('TMONID').AsString;
         // el ARTPCG siempre esta en SOLES
         If DMAF.wTMonLoc = DMAF.cdsQry.FieldByName('TMONID').AsString Then // por ser SOLES
         Begin
            DMAF.cdsQry.FieldByName('ACFVALOMO').Value := MantCompras.FMant.cds2.FieldByName('ARTPCG').AsFloat;
            DMAF.cdsQry.FieldByName('ACFVALOMN').Value := MantCompras.FMant.cds2.FieldByName('ARTPCG').AsFloat;
            DMAF.cdsQry.FieldByName('ACFVALOME').Value := FRound(DMAF.cdsQry.FieldByName('ACFVALOMO').AsFloat /
               DMAF.cdsQry.FieldByName('ACFCAMBIO').Value, 15, 2);
         End
         Else
         Begin // por ser DOLARES
            DMAF.cdsQry.FieldByName('ACFVALOMO').Value := FRound(MantCompras.FMant.cds2.FieldByName('ARTPCG').AsFloat /
               DMAF.cdsQry.FieldByName('ACFCAMBIO').Value, 15, 2);
            DMAF.cdsQry.FieldByName('ACFVALOME').Value := DMAF.cdsQry.FieldByName('ACFVALOMO').AsFloat;
            DMAF.cdsQry.FieldByName('ACFVALOMN').Value := MantCompras.FMant.cds2.FieldByName('ARTPCG').AsFloat;
         End;

         DMAF.cdsQry.FieldByName('NINDOC').AsString := MantCompras.FMant.cds2.FieldByName('NINDOC').AsString;
         DMAF.cdsQry.FieldByName('AcFFecRece').Value := MantCompras.FMant.cds2.FieldByName('NIFECHA').Value;
//         DMAF.cdsQry.FieldByName('AcFFecIns').Value :=wFecIns;
//         DMAF.cdsQry.FieldByName('AcFFiniDep').Value:=wFiniDep;
         DMAF.cdsQry.FieldByName('AcFHReg').Value := Time;
         DMAF.cdsQry.FieldByName('AcFFReg').Value := Date;
         DMAF.cdsQry.FieldByName('AcFUser').Value := DMAF.wUsuario;
         DMAF.cdsQry.FieldByName('AcFFlagAct').AsString := 'P'; // P(por Activar), A(Activo), I(Inactivo)
         DMAF.cdsQry.FieldByName('ACFDESACMO').AsString := '.';
         DMAF.cdsQry.FieldByName('VERI').AsString := 'S';

         DMAF.cdsQry.Post;
         // actualiza el registro del LOG332 para considerarlo como ya adicionado en el ACF201
         MantCompras.FMant.cds2.Edit;
         MantCompras.FMant.cds2.FieldByName('ESTADOID').AsString := 'X';
         MantCompras.FMant.cds2.Post;
      End;
      MantCompras.FMant.cds2.Next;
   End;
   DMAF.AplicaDatos(DMAF.cdsQry, '');
   DMAF.AplicaDatos(MantCompras.FMant.cds2, '');
   Close;
End;

Procedure TFDenominacion.FormCreate(Sender: TObject);
Var
   xSQL: String;
Begin
  // Busca ambiente
   xSQL := 'Select * from ACF123 where FLG=' + quotedstr('S');
   DMAF.cdsQry.Filter := '';
   DMAF.cdsQry.Filtered := False;
   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;
   wLocal := DMAF.cdsQry.FieldByName('LOCID').AsString;
   wPiso := DMAF.cdsQry.FieldByName('PISO').AsString;
   wArea := DMAF.cdsQry.FieldByName('AREA').AsString;
   wAmbiente := DMAF.cdsQry.FieldByName('AMBCOD').AsString;
   wCiaId := DMAF.cdsQry.FieldByName('CIAID').AsString;
   dbeACFDESL.Text := DMAF.wDescripcion;
End;

Procedure TFDenominacion.AccesaCXP301;
Begin
   xSQL := 'Select * from CXP301 '
      + 'Where CIAID=''' + MantCompras.FMant.cds2.FieldByName('CIAID').AsString + ''' AND '
      + 'PROV=''' + MantCompras.FMant.cds2.FieldByname('PROV').AsString + ''' AND '
      + 'CPOCOMP=''' + MantCompras.FMant.cds2.FieldByname('ODCID').AsString + '''';
   DMAF.cdsBusca.Close;
   DMAF.cdsBusca.DataRequest(xSQL);
   DMAF.cdsBusca.Open;

   If DMAF.cdsBusca.RecordCount = 1 Then
   Begin
        // DMAF.cdsQry.FieldByName('PROV').AsString       :=DMAF.cdsBusca.FieldByName('PROV').AsString;
      DMAF.cdsQry.FieldByName('DOCID').AsString := DMAF.cdsBusca.FieldByName('DOCID').AsString;
      DMAF.cdsQry.FieldByName('ACFSERIEDO').AsString := DMAF.cdsBusca.FieldByName('CPSERIE').AsString;
      DMAF.cdsQry.FieldByName('ACFNODOC').AsString := DMAF.cdsBusca.FieldByName('CPNODOC').AsString;
        // DMAF.cdsQry.FieldByName('ACFFECADQ').AsDateTime:=DMAF.cdsBusca.FieldByName('CPFEMIS').AsDateTime;
        // DMAF.cdsQry.FieldByName('TMONID').AsDateTime   :=DMAF.cdsBusca.FieldByName('TMONID').AsDateTime;
        // DMAF.cdsQry.FieldByName('ACFCAMBIO').Value     :=DMAF.cdsBusca.FieldByName('CPTACMPR').AsFloat;
   End;
End;

Procedure TFDenominacion.dblcEstadoExit(Sender: TObject);
Begin
   If DMAF.cdsEstado.IndexFieldNames <> 'ESTADOID' Then
      DMAF.cdsEstado.IndexFieldNames := 'ESTADOID';
   DMAF.cdsEstado.SetKey;
   DMAF.cdsEstado.FieldByName('ESTADOID').AsString := dblcEstado.Text;
   If Not DMAF.cdsEstado.GotoKey Then
   Begin
      ShowMessage('ESTADO NO EXISTE EN LA RELACION, REINTENTE!');
      dblcEstado.SetFocus;
      exit;
   End;
   edtEstado.Text := DMAF.cdsEstado.FieldByName('ESTADODES').AsString;
   Z2bbtnGraba.SetFocus;
End;

End.

