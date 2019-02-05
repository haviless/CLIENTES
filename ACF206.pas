Unit ACF206;
//********************************************************
// MODIFICADO POR   : Abelardo Sulca Palomino
// Nº HPP           : HPP_201105_ACF
// FECHA DE MODIF.  : 06/04/2011
// DESCRIPCION      : Permitir modificar el campo "Denominación" y "Serie"
//                    a los usuarios marcados con el indicador "Modif Denominación"
//                    en el mantenimiento de Usuarios Responsables
//********************************************************
//********************************************************
// MODIFICADO POR   : Abelardo Sulca Palomino
// Nº HPP           : HPP_201106_ACF
// FECHA DE MODIF.  : 11/04/2011
// DESCRIPCION      : Se quita la validación de la Orden de Compra debido a que
//                    los activos se crean desde el módulo de inventarios con
//                    una nota de salida
//********************************************************
//********************************************************
// MODIFICADO POR   : Abelardo Sulca Palomino
// Nº HPP           : HPP_201107_ACF
// FECHA DE MODIF.  : 13/05/2011
// DESCRIPCION      : Se pone invisible el control dbeCodBarrasIng y se adiciona
//                    el control dbeCodigoBarra el cual mostrará el contenido del
//                    campo ACF201.CODIGOBARRA
//********************************************************

// Actualizaciones
// HPC_201701_ACF 26/10/2017 Entrega a Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, wwdbdatetimepicker,
   StdCtrls, Buttons, wwdblook, Mask, wwdbedit, Wwdbdlg;

Type
   TFAFControlOpe = Class(TForm)
      Label6: TLabel;
      dbeCodBarrasIng: TwwDBEdit;
      Label1: TLabel;
      dblcLocalIng: TwwDBLookupCombo;
      edtlocalIng: TEdit;
      Label2: TLabel;
      dblcPisoIng: TwwDBLookupCombo;
      edtPisoIng: TEdit;
      Label3: TLabel;
      dblcAreaIng: TwwDBLookupCombo;
      edtAreaIng: TEdit;
      Label4: TLabel;
      dblcAmbIng: TwwDBLookupCombo;
      edtAmbIng: TEdit;
      Label5: TLabel;
      dbeRespIng: TwwDBEdit;
      bbtnRespIng: TBitBtn;
      edtRespIng: TEdit;
      lblFecha: TLabel;
      Bevel3: TBevel;
      Label7: TLabel;
      dblcEstadoIng: TwwDBLookupCombo;
      edtEstadoIng: TEdit;
      Label8: TLabel;
      dbeDenominaciIng: TwwDBEdit;
      Label9: TLabel;
      dbeACFDESLIng: TwwDBEdit;
      Label10: TLabel;
      Label11: TLabel;
      dbeMarcaIng: TwwDBEdit;
      Label12: TLabel;
      dbeModeloIng: TwwDBEdit;
      Label13: TLabel;
      dbeSerieIng: TwwDBEdit;
      Label14: TLabel;
      dbeDimensioIng: TwwDBEdit;
      lblMotivoIng: TLabel;
      dblcMotivoIng: TwwDBLookupCombo;
      lblOCompra: TLabel;
      dbeOCompra: TwwDBEdit;
      lblFecIng: TLabel;
      dbdtpFecIng: TwwDBDateTimePicker;
      lblDocRefIng: TLabel;
      lblNumDocIng: TLabel;
      lblValorIng: TLabel;
      dblcMonedaIng: TwwDBLookupCombo;
      dbeValorIng: TwwDBEdit;
      bbtnGrabaIng: TBitBtn;
      bbtnNuevoIng: TBitBtn;
      pnlBusqueda: TPanel;
      lblBusca: TLabel;
      dbgBusca: TwwDBGrid;
      bbtnOkBusca: TBitBtn;
      bbtnCancBusca: TBitBtn;
      dbeBusca: TwwDBEdit;
      bbtnDenominaci: TBitBtn;
      dblcMaterialIng: TwwDBLookupCombo;
      dblcDocRefIng: TwwDBLookupCombo;
      dblcdProveedor: TwwDBLookupComboDlg;
      Label15: TLabel;
      edtProveedorDes: TEdit;
      Label16: TLabel;
      dbeSerieDoc: TwwDBEdit;
      dbeNoDoc: TwwDBEdit;
      edRepetir: TEdit;
      Label17: TLabel;
      Label18: TLabel;
      Label19: TLabel;
      dbeVeri: TwwDBEdit;
      lblArticulo: TLabel;
      dbeArticulo: TwwDBEdit;
    //INICIO HPP_201107_ACF
      dbeCodigoBarra: TwwDBEdit;
    //FIN HPP_201107_ACF
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure FormShow(Sender: TObject);
      Procedure dbeCodBarrasIngExit(Sender: TObject);
      Procedure dblcLocalIngExit(Sender: TObject);
      Procedure dblcPisoIngExit(Sender: TObject);
      Procedure dblcAreaIngExit(Sender: TObject);
      Procedure dblcAmbIngExit(Sender: TObject);
      Procedure dbeRespIngExit(Sender: TObject);
      Procedure bbtnRespIngClick(Sender: TObject);
      Procedure dblcEstadoIngExit(Sender: TObject);
      Procedure dbdtpFecIngExit(Sender: TObject);
      Procedure bbtnGrabaIngClick(Sender: TObject);
      Procedure bbtnNuevoIngClick(Sender: TObject);
      Procedure dbeBuscaExit(Sender: TObject);
      Procedure bbtnOkBuscaClick(Sender: TObject);
      Procedure bbtnCancBuscaClick(Sender: TObject);
      Function StrZero(wNumero: String; wLargo: Integer): String;
      Procedure bbtnDenominaciClick(Sender: TObject);
      Procedure dblcdProveedorExit(Sender: TObject);
      Procedure AdicionaActivos;
      Procedure ModificaActivos;
    //INICIO HPP_201105_ACF
      Procedure ActDenominacionSerie;
    //FIN HPP_201105_ACF
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FAFControlOpe: TFAFControlOpe;
   xBuscaDenominaci: boolean; // flag q indica búsqueda de Denominacion
   wCCOSID, xFecha, wCiaId, wTacf, wTacfMax, wPorTacf, wCuentaId, wVidaUtil: String;
   wNumCodBar: integer;

Implementation

Uses ACFDM, oaAF2000;

{$R *.dfm}

Procedure TFAFControlOpe.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   Action := caFree;
End;

Procedure TFAFControlOpe.FormShow(Sender: TObject);
Var
   xSQL: String;
Begin
   dbeArticulo.Enabled := True;
   dbeArticulo.Text := MantControlOpe.FMant.cds2.FieldbyName('ARTID').AsString;
   dbeArticulo.Enabled := False;
   xSQL := 'select * from ACF120';
   DMAF.cdsLocal.Close;
   DMAF.cdsLocal.DataRequest(xSQL);
   DMAF.cdsLocal.Open;
   DMAF.cdsLocal.IndexFieldNames := 'LOCID';
   DMAF.cdsLocal.Filter := '';
   DMAF.cdsLocal.Filtered := False;

   xSQL := 'select * from ACF121';
   DMAF.cdsPiso.Close;
   DMAF.cdsPiso.DataRequest(xSQL);
   DMAF.cdsPiso.Open;
   DMAF.cdsPiso.IndexFieldNames := 'LOCID;PISO';
   DMAF.cdsPiso.Filter := '';
   DMAF.cdsPiso.Filtered := False;

   xSQL := 'select * from ACF122';
   DMAF.cdsArea.Close;
   DMAF.cdsArea.DataRequest(xSQL);
   DMAF.cdsArea.Open;
   DMAF.cdsArea.IndexFieldNames := 'LOCID;PISO;AREA';
   DMAF.cdsArea.Filter := '';
   DMAF.cdsArea.Filtered := False;

   xSQL := 'select * from ACF123';
   DMAF.cdsAmbiente.Close;
   DMAF.cdsAmbiente.DataRequest(xSQL);
   DMAF.cdsAmbiente.IndexFieldNames := 'LOCID;PISO;AREA;AMBCOD';
   DMAF.cdsAmbiente.Open;
   DMAF.cdsAmbiente.Filter := '';
   DMAF.cdsAmbiente.Filtered := False;

   xSQL := 'select * from TGE178';
   DMAF.cdsMaterial.Close;
   DMAF.cdsMaterial.DataRequest(xSQL);
   DMAF.cdsMaterial.IndexFieldNames := 'MATERIALID';
   DMAF.cdsMaterial.Open;
   DMAF.cdsMaterial.Filter := '';
   DMAF.cdsMaterial.Filtered := False;
   dblcMaterialIng.Selected.Clear;
   dblcMaterialIng.Selected.Add('MATERIALID'#9'8'#9'Material');

   xSQL := 'select * from ACF126 ';
   DMAF.cdsResponsab.Close;
   DMAF.cdsResponsab.DataRequest(xSQL);
   DMAF.cdsResponsab.Open;
   DMAF.cdsResponsab.IndexFieldNames := 'RECIBEID';
   DMAF.cdsResponsab.Filter := '';
   DMAF.cdsResponsab.Filtered := False;

   xSQL := 'select * from ACF108';
   DMAF.cdsMotivos.Close;
   DMAF.cdsMotivos.DataRequest(xSQL);
   DMAF.cdsMotivos.Open;
   DMAF.cdsMotivos.IndexFieldNames := 'MOTDES';
   DMAF.cdsMotivos.Filter := '';
   DMAF.cdsMotivos.Filtered := False;
   dblcMotivoIng.Selected.Clear;
   dblcMotivoIng.Selected.Add('MOTDES'#9'15'#9'Motivo');

   xSQL := 'select * from TGE110 WHERE DOCAF=' + quotedstr('S');
   DMAF.cdsDocs.Close;
   DMAF.cdsDocs.DataRequest(xSQL);
   DMAF.cdsDocs.Open;
   DMAF.cdsDocs.IndexFieldNames := 'DOCABR';
   DMAF.cdsDocs.Filter := '';
   DMAF.cdsDocs.Filtered := False;

   xSQL := 'select * from ACF115';
   DMAF.cdsUsuario.Close;
   DMAF.cdsUsuario.DataRequest(xSQL);
   DMAF.cdsUsuario.Open;
   DMAF.cdsUsuario.IndexFieldNames := 'USUARIO';
   DMAF.cdsUsuario.Filter := '';
   DMAF.cdsUsuario.Filtered := False;

//   xSQL := 'select ''S/.'' MONEDA from ACF120 where 1<>1';
   xSQL := 'select * from TGE103';
   DMAF.cdsMoneda.Close;
   DMAF.cdsMoneda.DataRequest(xSQL);
   DMAF.cdsMoneda.Open;
   dblcMonedaIng.Selected.Clear;
   dblcMonedaIng.Selected.Add('TMONABR'#9'15'#9'Moneda');

// Estado
   xSQL := 'select * from ACF109';
   DMAF.cdsEstado.Close;
   DMAF.cdsEstado.DataRequest(xSQL);
   DMAF.cdsEstado.Open;
   dblcEstadoIng.Selected.Clear;
   dblcEstadoIng.Selected.Add('ESTADOID'#9'3'#9'Estado');
   dblcEstadoIng.Selected.Add('ESTADODES'#9'10'#9'Descripción');

// Proveedor
   xSQL := 'select * from TGE201';
   DMAF.cdsProvee.Close;
   DMAF.cdsProvee.DataRequest(xSQL);
   DMAF.cdsProvee.IndexFieldNames := 'PROV';
   DMAF.cdsProvee.Open;
   DMAF.cdsProvee.Filter := '';
   DMAF.cdsProvee.Filtered := False;
   dblcdProveedor.Selected.Clear;
   dblcdProveedor.Selected.Add('PROV'#9'12'#9'PROV'#9'F');
   dblcdProveedor.Selected.Add('PROVDES'#9'30'#9'Razón Social'#9'F');
   dblcdProveedor.Selected.Add('PROVRUC'#9'12'#9'RUC'#9'F');

   If DMAF.wModo = 'A' Then // por ADICION
   Begin
      label17.Visible := True;
      label18.Visible := True;
      edRepetir.Visible := True;
      dbeCodBarrasIng.SetFocus;
   End;
   If DMAF.wModo = 'M' Then // por MODIFICACION
   Begin
      label17.Visible := False;
      label18.Visible := False;
      edRepetir.Visible := False;
      dbeCodBarrasIng.Text := DMAF.cdsActFij.FieldByName('ARTCODBAR').AsString;
      //INICIO HPP_201107_ACF
      dbeCodigoBarra.Text := DMAF.cdsActFij.FieldByName('CODIGOBARRA').AsString;
      //FIN HPP_201107_ACF
      dbeCodBarrasIngExit(Self);

   End;

//   if DMAF.wModo='A' then    // nueva Orden de Traslado
//      bbtnIniciaTrasladoClick(self);
//   if DMAF.wModo='M' then    // modificacion de Orden de Traslado
//      bbtnTrasladoAntClick(self);

End;

Procedure TFAFControlOpe.dbeCodBarrasIngExit(Sender: TObject);
Var
   xSQL, xCodBarras, xTextoDif: String;
Begin
   If DMAF.wModo = 'A' Then // por ADICION
   Begin
      dbeCodBarrasIng.Text := strzero(dbeCodBarrasIng.Text, 6);
      If strtoint(dbeCodBarrasIng.Text) = 0 Then exit;
      xSQL := 'Select * from ACF201 '
         + 'where ARTCODBAR=' + quotedstr(dbeCodBarrasIng.Text);
      DMAF.cdsInventario.Close;
      DMAF.cdsInventario.IndexFieldNames := '';
      DMAF.cdsInventario.Filter := '';
      DMAF.cdsInventario.Filtered := False;
      DMAF.cdsInventario.DataRequest(xSQL);
      DMAF.cdsInventario.Open;
      If DMAF.cdsInventario.recordcount > 0 Then
      Begin
         ShowMessage('Código de Barras ya fue Registrado');
         dbeCodBarrasIng.Clear;
         dbeCodBarrasIng.SetFocus;
         exit;
      End;

      dblcLocalIng.Clear;
      edtlocalIng.Clear;
      dblcPisoIng.Clear;
      edtPisoIng.Clear;
      dblcAreaIng.Clear;
      edtAreaIng.Clear;
      dblcAmbIng.Clear;
      edtAmbIng.Clear;
      dbeRespIng.Clear;
      edtRespIng.Clear;
      dblcEstadoIng.Clear;
      edtEstadoIng.Clear;
      dbeDenominaciIng.Clear;
      dbeACFDESLIng.Clear;
      dblcMaterialIng.Clear;
      dbeMarcaIng.Clear;
      dbeModeloIng.Clear;
      dbeSerieIng.Clear;
      dbeDimensioIng.Clear;
      dblcMotivoIng.Clear;
      dbeOCompra.Clear;
      dbdtpFecIng.Clear;
      dblcDocRefIng.Clear;
      dbeNoDoc.Clear;
      dbeSerieDoc.Clear;
      dblcdProveedor.Clear;
      dblcMonedaIng.Clear;
      dbeValorIng.Clear;
      dbeVeri.Text := 'S';
      bbtnGrabaIng.Enabled := True;
   End;
   If DMAF.wModo = 'M' Then // por MODIFICACION
   Begin
      dbeCodBarrasIng.Enabled := True;
      dblcLocalIng.Enabled := True;
      edtlocalIng.Enabled := True;
      dblcPisoIng.Enabled := True;
      edtPisoIng.Enabled := True;
      dblcAreaIng.Enabled := True;
      edtAreaIng.Enabled := True;
      dblcAmbIng.Enabled := True;
      edtAmbIng.Enabled := True;
      dbeRespIng.Enabled := True;
      edtRespIng.Enabled := True;
      bbtnRespIng.Enabled := True;
      dblcEstadoIng.Enabled := True;
      edtEstadoIng.Enabled := True;
      dbeDenominaciIng.Enabled := True;
      bbtnDenominaci.Enabled := True;

      dbeCodBarrasIng.Text := DMAF.cdsActFij.FieldByName('ARTCODBAR').AsString;
      dblcLocalIng.Text := DMAF.cdsActFij.FieldByName('LOCID').AsString;
      dblcLocalIngExit(Self);
      dblcPisoIng.Text := DMAF.cdsActFij.FieldByName('PISO').AsString;
      dblcPisoIngExit(Self);
      dblcAreaIng.Text := DMAF.cdsActFij.FieldByName('AREA').AsString;
      dblcAreaIngExit(Self);
      dblcAmbIng.Text := DMAF.cdsActFij.FieldByName('AMBCOD').AsString;
      dblcAmbIngExit(Self);

      dbeRespIng.Text := DMAF.cdsActFij.FieldByName('RECIBEID').AsString;
      edtRespIng.Text := DMAF.cdsActFij.FieldByName('RECIBENOM').AsString;
      dblcEstadoIng.Text := DMAF.cdsActFij.FieldByName('ESTADOID').AsString;
      dbeDenominaciIng.Text := DMAF.cdsActFij.FieldByName('ACFDES').AsString;
      dbeACFDESLIng.Text := DMAF.cdsActFij.FieldByName('ACFDESL').AsString;
      dblcMaterialIng.Text := DMAF.cdsActFij.FieldByName('MATERIALID').AsString;
      dbeMarcaIng.Text := DMAF.cdsActFij.FieldByName('ACFMARCA').AsString;
      dbeModeloIng.Text := DMAF.cdsActFij.FieldByName('ACFMODELO').AsString;
      dbeSerieIng.Text := DMAF.cdsActFij.FieldByName('ACFSERIE').AsString;
      dbeDimensioIng.Text := DMAF.cdsActFij.FieldByName('ACFMEDIDA').AsString;
      If length(DMAF.cdsActFij.FieldByName('OCNDOC').AsString) = 0 Then
         dbeOCompra.Text := DMAF.cdsActFij.FieldByName('ODCID').AsString
      Else
         dbeOCompra.Text := DMAF.cdsActFij.FieldByName('OCNDOC').AsString;

      If length(DMAF.cdsActFij.FieldByName('ACFFECADQ').AsString) > 0 Then
         dbdtpFecIng.Date := DMAF.cdsActFij.FieldByName('ACFFECADQ').Value
      Else
         dbdtpFecIng.Text := DMAF.cdsActFij.FieldByName('ACFFECADQ').AsString;
      dblcDocRefIng.Text := DMAF.cdsActFij.FieldByName('DOCID').AsString;
      dbeSerieDoc.Text := DMAF.cdsActFij.FieldByName('ACFSERIEDO').AsString;
      dbeNoDoc.Text := DMAF.cdsActFij.FieldByName('ACFNODOC').AsString;
      dblcdProveedor.Text := DMAF.cdsActFij.FieldByName('PROV').AsString;
      dblcdProveedorExit(Self);
      dblcMonedaIng.Text := DMAF.cdsActFij.FieldByName('TMONID').AsString;
      dbeValorIng.Text := DMAF.cdsActFij.FieldByName('ACFVALOMO').AsString;
      dbeVeri.Text := DMAF.cdsActFij.FieldByName('VERI').AsString;
                             // 'S' ubicados en la verificacion del Inventario de Junio del 2004
                             // 'N' NO Ubicados en la verificacion del Inventario de Junio del 2004

      dbeCodBarrasIng.Enabled := False;
      dblcLocalIng.Enabled := False;
      edtlocalIng.Enabled := False;
      dblcPisoIng.Enabled := False;
      edtPisoIng.Enabled := False;
      dblcAreaIng.Enabled := False;
      edtAreaIng.Enabled := False;
      dblcAmbIng.Enabled := False;
      edtAmbIng.Enabled := False;
      dbeRespIng.Enabled := False;
      edtRespIng.Enabled := False;
      bbtnRespIng.Enabled := False;
      dblcEstadoIng.Enabled := False;
      edtEstadoIng.Enabled := False;
      dbeDenominaciIng.Enabled := False;
      bbtnDenominaci.Enabled := False;
      dblcdProveedor.Enabled := False;
      dbeOCompra.Enabled := False;
      dbdtpFecIng.Enabled := False;
      dblcDocRefIng.Enabled := False;
      dbeSerieDoc.Enabled := False;
      dbeNoDoc.Enabled := False;
      dblcMonedaIng.Enabled := False;
      dbeValorIng.Enabled := False;
      If dbeVeri.Text = 'S' Then dbeVeri.Enabled := False;
      dbeACFDESLIng.SetFocus;
      bbtnGrabaIng.Enabled := True;

      //INICIO HPP_201105_ACF
      //Habilitando y deshabilitando los campos de Denominación y Serie
      DMAF.cdsUsuario.locate('USUARIO', VarArrayOf([DMAF.wUsuario]), []);
      If DMAF.cdsUsuario.FieldByName('FLGMODDEN').AsString = 'S' Then
      Begin
         dbeDenominaciIng.Enabled := True;
         bbtnDenominaci.Enabled := True;
         dbeSerieIng.Enabled := True;
      End
      Else
      Begin
         dbeDenominaciIng.Enabled := False;
         bbtnDenominaci.Enabled := False;
         dbeSerieIng.Enabled := False;
      End;
      //FIN HPP_201105_ACF

   End;
End;

Procedure TFAFControlOpe.dblcLocalIngExit(Sender: TObject);
Var
   xSQL: String;
Begin
   If dbeCodBarrasIng.Focused Then exit;
   If DMAF.cdsLocal.IndexFieldNames <> 'LOCID' Then
      DMAF.cdsLocal.IndexFieldNames := 'LOCID';
   DMAF.cdsLocal.SetKey;
   DMAF.cdsLocal.FieldByName('LOCID').AsString := dblcLocalIng.Text;
   If Not DMAF.cdsLocal.GotoKey Then
   Begin
      ShowMessage('LOCAL NO EXISTE EN LA RELACION, REINTENTE!');
      dblcLocalIng.SetFocus;
      exit;
   End;
   edtlocalIng.Text := DMAF.cdsLocal.FieldByName('LOCDES').AsString;
   dblcPisoIng.Clear;
   edtPisoIng.Clear;
   dblcAreaIng.Clear;
   edtAreaIng.Clear;
   dblcAmbIng.Clear;
   edtAmbIng.Clear;
   dbeRespIng.Clear;
   edtRespIng.Clear;
   DMAF.cdsPiso.Filter := 'LOCID=' + quotedstr(DMAF.cdsLocal.FieldByName('LOCID').AsString);
   DMAF.cdsPiso.Filtered := True;
End;

Procedure TFAFControlOpe.dblcPisoIngExit(Sender: TObject);
Begin
   If dbeCodBarrasIng.Focused Then exit;
   If dblcLocalIng.Focused Then exit;

   If DMAF.cdsPiso.IndexFieldNames <> 'PISO' Then
      DMAF.cdsPiso.IndexFieldNames := 'PISO';
   DMAF.cdsPiso.SetKey;
   DMAF.cdsPiso.FieldByName('PISO').AsString := dblcPisoIng.Text;
   If Not DMAF.cdsPiso.GotoKey Then
   Begin
      ShowMessage('PISO NO EXISTE EN LA RELACION, REINTENTE!');
      dblcPisoIng.SetFocus;
      exit;
   End;
   edtPisoIng.Text := DMAF.cdsPiso.FieldByName('PISODES').AsString;

   dblcAreaIng.Clear;
   edtAreaIng.Clear;
   dblcAmbIng.Clear;
   edtAmbIng.Clear;
   dbeRespIng.Clear;
   edtRespIng.Clear;
   DMAF.cdsArea.Filter := 'LOCID=' + quotedstr(DMAF.cdsLocal.FieldByName('LOCID').AsString)
      + ' and PISO=' + quotedstr(DMAF.cdsPiso.FieldByName('PISO').AsString);
   DMAF.cdsArea.Filtered := True;
End;

Procedure TFAFControlOpe.dblcAreaIngExit(Sender: TObject);
Begin
   If dbeCodBarrasIng.Focused Then exit;
   If dblcLocalIng.Focused Then exit;
   If dblcPisoIng.Focused Then exit;
   If DMAF.cdsArea.IndexFieldNames <> 'AREA' Then
      DMAF.cdsArea.IndexFieldNames := 'AREA';
   DMAF.cdsArea.SetKey;
   DMAF.cdsArea.FieldByName('AREA').AsString := dblcAreaIng.Text;
   If Not DMAF.cdsArea.GotoKey Then
   Begin
      ShowMessage('AREA NO EXISTE EN LA RELACION, REINTENTE!');
      dblcAreaIng.SetFocus;
      exit;
   End;
   edtAreaIng.Text := DMAF.cdsArea.FieldByName('AREADES').AsString;

   dblcAmbIng.Clear;
   edtAmbIng.Clear;
   dbeRespIng.Clear;
   edtRespIng.Clear;
   DMAF.cdsAmbiente.Filter := 'LOCID=' + quotedstr(DMAF.cdsLocal.FieldByName('LOCID').AsString)
      + ' and PISO=' + quotedstr(DMAF.cdsPiso.FieldByName('PISO').AsString)
      + ' and AREA=' + quotedstr(DMAF.cdsArea.FieldByName('AREA').AsString);
   DMAF.cdsAmbiente.Filtered := True;
End;

Procedure TFAFControlOpe.dblcAmbIngExit(Sender: TObject);
Begin
   If dbeCodBarrasIng.Focused Then exit;
   If dblcLocalIng.Focused Then exit;
   If dblcPisoIng.Focused Then exit;
   If dblcAreaIng.Focused Then exit;
   If DMAF.cdsAmbiente.IndexFieldNames <> 'AMBCOD' Then
      DMAF.cdsAmbiente.IndexFieldNames := 'AMBCOD';
   DMAF.cdsAmbiente.SetKey;
   DMAF.cdsAmbiente.FieldByName('AMBCOD').AsString := dblcAmbIng.Text;
   If Not DMAF.cdsAmbiente.GotoKey Then
   Begin
      ShowMessage('AMBIENTE NO EXISTE EN LA RELACION, REINTENTE!');
      dblcAmbIng.SetFocus;
      exit;
   End;
   edtAmbIng.Text := DMAF.cdsAmbiente.FieldByName('AMBDES').AsString;
   wCiaId := DMAF.cdsAmbiente.FieldByName('CIAID').AsString;

   dbeRespIng.Clear;
   edtRespIng.Clear;
   dbeRespIng.SetFocus;
End;

Procedure TFAFControlOpe.dbeRespIngExit(Sender: TObject);
Begin
   If bbtnRespIng.Focused Then exit;
   If dblcAmbIng.Focused Then exit;
   If dblcAreaIng.Focused Then exit;
   If dblcPisoIng.Focused Then exit;
   If dblcLocalIng.Focused Then exit;
   If dbeRespIng.Text <> '99999' Then
   Begin
      If DMAF.cdsResponsab.IndexFieldNames <> 'RECIBEID' Then
         DMAF.cdsResponsab.IndexFieldNames := 'RECIBEID';
      DMAF.cdsResponsab.SetKey;
      DMAF.cdsResponsab.FieldByName('RECIBEID').AsString := dbeRespIng.Text;
      If Not DMAF.cdsResponsab.GotoKey Then
      Begin
         ShowMessage('USUARIO DEL BIEN NO EXISTE EN LA RELACION, REINTENTE!');
         dbeRespIng.SetFocus;
         exit;
      End;
      edtRespIng.Text := DMAF.cdsResponsab.FieldByName('RECIBENOM').AsString;
   End
   Else
   Begin
      edtRespIng.enabled := True;
      edtRespIng.Text := '';
   End;
End;

Procedure TFAFControlOpe.bbtnRespIngClick(Sender: TObject);
Begin
   pnlBusqueda.BringToFront;
   pnlBusqueda.Left := 210;
   pnlBusqueda.Top := 129;
   pnlBusqueda.Visible := True;
   dbeBusca.Clear;
   dbeBusca.SetFocus;
End;

Procedure TFAFControlOpe.dblcEstadoIngExit(Sender: TObject);
Begin
   If DMAF.cdsEstado.IndexFieldNames <> 'ESTADOID' Then
      DMAF.cdsEstado.IndexFieldNames := 'ESTADOID';
   DMAF.cdsEstado.SetKey;
   DMAF.cdsEstado.FieldByName('ESTADOID').AsString := dblcEstadoIng.Text;
   If Not DMAF.cdsEstado.GotoKey Then
   Begin
      ShowMessage('ESTADO NO EXISTE EN LA RELACION, REINTENTE!');
      dblcEstadoIng.SetFocus;
      exit;
   End;
   edtEstadoIng.Text := DMAF.cdsEstado.FieldByName('ESTADODES').AsString;
   bbtnDenominaci.SetFocus;
End;

Procedure TFAFControlOpe.dbdtpFecIngExit(Sender: TObject);
Var
   xDia, xMes, xAno: word;
   sDia, sMes, sAno: String;
Begin
   decodedate(dbdtpFecIng.Date, xAno, xMes, xDia);

   If xDia < 10 Then
      sDia := '0' + inttostr(xDia)
   Else
      sDia := inttostr(xDia);

   If xMes < 10 Then
      sMes := '0' + inttostr(xMes)
   Else
      sMes := inttostr(xMes);

   sAno := copy(inttostr(xAno), 3, 2);

   lblFecha.Caption := sDia + sMes + sAno;
End;

Procedure TFAFControlOpe.bbtnGrabaIngClick(Sender: TObject);
Var
   xFechaFormato: String;
   wAno, wMes, wDia: word;
   i: integer;
Begin
   If strtoint(dbeCodBarrasIng.Text) = 0 Then
   Begin
      ShowMessage('Falta Código de Barras');
      dbeCodBarrasIng.SetFocus;
      exit;
   End;

   If length(trim(edtLocalIng.Text)) = 0 Then
   Begin
      ShowMessage('Falta registrar Local');
      dblcLocalIng.SetFocus;
      exit;
   End;

   If length(trim(edtPisoIng.Text)) = 0 Then
   Begin
      ShowMessage('Falta registrar Piso');
      dblcPisoIng.SetFocus;
      exit;
   End;

   If length(trim(edtAreaIng.Text)) = 0 Then
   Begin
      ShowMessage('Falta registrar Área');
      dblcAreaIng.SetFocus;
      exit;
   End;

   If length(trim(edtAmbIng.Text)) = 0 Then
   Begin
      ShowMessage('Falta registrar Ambiente');
      dblcAmbIng.SetFocus;
      exit;
   End;

   If length(trim(edtRespIng.Text)) = 0 Then
   Begin
      ShowMessage('Falta registrar Usuario del Bien');
      dbeRespIng.SetFocus;
      exit;
   End;

   If length(trim(dbeDenominaciIng.Text)) = 0 Then
   Begin
      ShowMessage('Falta Denominación');
      bbtnDenominaci.SetFocus;
      exit;
   End;

   If strtoint(dbeCodBarrasIng.Text) = 0 Then
   Begin
      ShowMessage('Falta Código de Barras');
      dbeCodBarrasIng.SetFocus;
      exit;
   End;

//obc 10032005   if length(trim(dblcMotivoIng.Text))=0 then
//   begin
//      ShowMessage('Debe Indicar el Motivo de Activación del Activo');
//      dblcMotivoIng.SetFocus;
//      exit;
//   end;
   //INICIO HPP_201106_ACF
   //se quita esta validación porque todos los activos deben con nota de ingreso
   (*if length(trim(dbeOCompra.Text))=0 then
   begin
      ShowMessage('Debe Indicar el Nro. de Orden de Compra del Activo');
      dbeOCompra.SetFocus;
      exit;
   end;

   if dbdtpFecIng.Date=0 then
   begin
      ShowMessage('Debe Indicar la Fecha de Ingreso del Activo');
      dbdtpFecIng.SetFocus;
      exit;
   end;*)
   //FIN HPP_201106_ACF
{   if length(trim(dblcDocRefIng.Text))=0 then
   begin
      ShowMessage('Debe Indicar el Documento de Referencia para el Ingreso');
      dblcDocRefIng.SetFocus;
      exit;
   end;

   if length(trim(dbeNumDocIng.Text))=0 then
   begin
      ShowMessage('Debe Indicar el Número de Documento de Referencia para el Ingreso');
      dbeNumDocIng.SetFocus;
      exit;
   end;
}

// JCC 05/Nov
   decodedate(dbdtpFecIng.Date, wAno, wMes, wDia);
   xFecha := StrZero(trim(inttostr(wDia)), 2) + '/'
      + strzero(trim(inttostr(wMes)), 2) + '/'
      + copy(inttostr(wAno), 3, 2);
   wNumCodBAr := 0;
   If DMAF.wModo = 'A' Then AdicionaActivos;
   If DMAF.wModo = 'M' Then ModificaActivos;
   Try
      DMAF.AplicaDatos(DMAF.cdsActFij, '');
      DMAF.AplicaDatos(DMAF.cdsQry, '');
      //INICIO HPP_201105_ACF
      ActDenominacionSerie;
      //Refrescamos la ventanana de mantenimiento
      xSQL := 'SELECT * FROM ACF201 WHERE ARTCODBAR=' + quotedstr(DMAF.cdsActFij.FieldByName('ARTCODBAR').AsString);
      DMAF.cdsActFij.Close;
      DMAF.cdsActFij.DataRequest(xSQL);
      DMAF.cdsActFij.Open;
      //FIN HPP_201105_ACF
      ShowMessage('Activo Fijo Registrado Correctamente');
      DMAF.ActualizaFiltro(MantControlOpe, DMAF.cdsActFij, DMAF.wModo);

   Except
      ShowMessage('No se pudo actualizar');
      dbeCodBarrasIng.SetFocus;
      exit;
   End;
   // si se desea repetir mas activos basados en el primero
   If (strtoint(edRepetir.Text) > 0) And (DMAF.wModo = 'A') Then
   Begin
      Screen.Cursor := crHourGlass;
      wNumCodBar := strtoint(dbeCodBarrasIng.Text);
      For i := 1 To strtoint(edRepetir.Text) Do
      Begin
         wNumCodBar := wNumCodBar + 1;
         AdicionaActivos;
         Try
            DMAF.AplicaDatos(DMAF.cdsActFij, '');
            DMAF.AplicaDatos(DMAF.cdsQry, '');
         Except
            ShowMessage('No se pudo actualizar');
            dbeCodBarrasIng.SetFocus;
            exit;
         End;
      End;
      ShowMessage('Repeticiones Registradas Correctamente');
      Screen.Cursor := CrDefault;
      DMAF.ActualizaFiltro(MantControlOpe, DMAF.cdsActFij, DMAF.wModo);
   End;
  //   bbtnGrabaIng.Enabled := False;
   If DMAF.wModo = 'A' Then
      bbtnNuevoIngClick(Self);
   If DMAF.wModo = 'M' Then
      dbeCodBarrasIngExit(Self);
End;

Procedure TFAFControlOpe.bbtnNuevoIngClick(Sender: TObject);
Var
   wxSql: String;
Begin
   dblcLocalIng.Clear;
   edtlocalIng.Clear;
   dblcPisoIng.Clear;
   edtPisoIng.Clear;
   dblcAreaIng.Clear;
   edtAreaIng.Clear;
   dblcAmbIng.Clear;
   edtAmbIng.Clear;
   dbeRespIng.Clear;
   edtRespIng.Clear;
   dblcEstadoIng.Clear;
   edtEstadoIng.Clear;
   dbeDenominaciIng.Clear;
   dbeACFDESLIng.Clear;
   dblcMaterialIng.Clear;
   dbeMarcaIng.Clear;
   dbeModeloIng.Clear;
   dbeSerieIng.Clear;
   dbeDimensioIng.Clear;
   dblcMotivoIng.Clear;
   dbeOCompra.Clear;
   dbdtpFecIng.Clear;
   dblcDocRefIng.Clear;
   dbeNoDoc.Clear;
   dbeSerieDoc.Clear;
   dblcdProveedor.Clear;
   dblcMonedaIng.Clear;
   dbeValorIng.Clear;

   wxSql := 'SELECT * FROM ACF201 WHERE 1<>1';
   DMAF.cdsActFij.Close;
   DMAF.cdsActFij.DataRequest(wxSql);
   DMAF.cdsActFij.Open;

   dbeCodBarrasIng.Text := trimleft(inttostr(strtoint(dbeCodBarrasIng.Text) + strtoint('1')));
   dbeCodBarrasIng.Text := copy('000000' + trim(dbeCodBarrasIng.Text),
      length(trim('000000' + dbeCodBarrasIng.Text)) - 6 + 1, 6);
   dbeCodBarrasIng.SetFocus;
End;

Procedure TFAFControlOpe.dbeBuscaExit(Sender: TObject);
Var
   xSQL, xVarBusca: String;
Begin
   If bbtnCancBusca.Focused Then exit;
   If length(dbeBusca.Text) > 0 Then
   Begin
      dbgBusca.DataSource := Nil;
      xVarBusca := '%' + trim(dbeBusca.Text) + '%';
      If xBuscaDenominaci = True Then
         xSQL := 'Select DENOMINACI,TACF from ACF124 where DENOMINACI like(' + quotedstr(xVarBusca) + ')'
      Else
         xSQL := 'Select RECIBEID,RECIBENOM,CCOSID from ACF126 where RECIBENOM like(' + quotedstr(xVarBusca) + ')'
            + ' GROUP BY RECIBEID,RECIBENOM,CCOSID';
      DMAF.cdsBusca.DisableControls;
      DMAF.cdsBusca.Close;
      DMAF.cdsBusca.IndexFieldNames := '';
      If xBuscaDenominaci = False Then
         DMAF.cdsBusca.IndexFieldNames := 'RECIBENOM';
      DMAF.cdsBusca.Filter := '';
      DMAF.cdsBusca.DataRequest(xSQL);
      DMAF.cdsBusca.Open;
      dbgBusca.Selected.Clear;
      dbgBusca.DataSource := DMAF.dsBusca;
      If xBuscaDenominaci = False Then
      Begin
         dbgBusca.Selected.Add('RECIBENOM'#9'40'#9'Usuario del Bien');
         dbgBusca.Selected.Add('RECIBEID'#9'6'#9'Id');
      End
      Else
      Begin
         dbgBusca.Selected.Add('DENOMINACI'#9'50'#9'Denominacion');
//         dbgBusca.Selected.Add('ACFDESL'#9'50'#9'Descripcion');
      End;
      DMAF.cdsBusca.EnableControls;
      dbgBusca.SetFocus;
   End
   Else
      Showmessage('Ingrese una condición para la Búsqueda');
End;

Procedure TFAFControlOpe.bbtnOkBuscaClick(Sender: TObject);
Begin
   If bbtnCancBusca.Focused Then exit;
// Ingresos
   If xBuscaDenominaci = False Then
   Begin
      dbeRespIng.Text := DMAF.cdsBusca.FieldByName('RECIBEID').AsString;
      edtRespIng.Text := DMAF.cdsBusca.FieldByName('RECIBENOM').AsString;
      wCCOSID := DMAF.cdsBusca.FieldByName('CCOSID').AsString;
      pnlBusqueda.Visible := False;
      dbeRespIng.SetFocus;
   End
   Else
   Begin
      dbeDenominaciIng.Text := DMAF.cdsBusca.FieldByName('DENOMINACI').AsString;
      wTacf := DMAF.cdsBusca.FieldByName('TACF').AsString;
//         dbeAcfdeslIng.Text       := DMAF1.cdsBusca.FieldByName('ACFDESL').AsString;
      pnlBusqueda.Visible := False;
      xBuscaDenominaci := False;
      dbeACFDESLIng.SetFocus;
   End;
   dbgBusca.DataSource := Nil;
End;

Procedure TFAFControlOpe.bbtnCancBuscaClick(Sender: TObject);
Begin
// Ingresos
   pnlBusqueda.Visible := False;
   dbeRespIng.SetFocus;

End;

Function TFAFControlOpe.StrZero(wNumero: String; wLargo: Integer): String;
Var
   i: integer;
   s: String;
Begin
   s := '';
   For i := 1 To wLargo Do
   Begin
      s := s + '0';
   End;
   s := s + trim(wNumero);
   result := copy(s, length(s) - (wLargo - 1), wLargo);
End;

Procedure TFAFControlOpe.bbtnDenominaciClick(Sender: TObject);
Begin
   xBuscaDenominaci := True;
   pnlBusqueda.BringToFront;
   pnlBusqueda.Left := 210;
   pnlBusqueda.Top := 129;
   pnlBusqueda.Visible := True;
   dbeBusca.Clear;
   dbeBusca.SetFocus;
End;

Procedure TFAFControlOpe.dblcdProveedorExit(Sender: TObject);
//var xSql : string;
Begin
//   if xCrea then exit;

// Consistencia Codigo de Proveedor y toma descripción
//   xSql:= 'Prov='+''''+dblcdProveedor.Text+'''';
//   edtProveedorDes.Text:=DMAF.DisplayDescrip('dspTGE','TGE201','*',xCondicion,'ProvAbr');
   If DMAF.cdsProvee.IndexFieldNames <> 'PROV' Then
      DMAF.cdsProvee.IndexFieldNames := 'PROV';
   DMAF.cdsProvee.SetKey;
   DMAF.cdsProvee.FieldByName('PROV').AsString := dblcdProveedor.Text;
   edtProveedorDes.Enabled := True;
   If Not DMAF.cdsProvee.GotoKey Then
   Begin
      edtProveedorDes.Text := '';
   End
   Else
   Begin
      edtProveedorDes.Text := DMAF.cdsProvee.FieldByName('PROVDES').AsString;
   End;
   edtProveedorDes.Enabled := False;
   If DMAF.wModo = 'A' Then
      dbeOCompra.SetFocus;
End;

Procedure TFAFControlOpe.AdicionaActivos;
Begin
    /////////////////////////////////////////////////////////////
   // Calcula en Max Codigo de Activo
   xSQL := 'Select MAX( ACFID ) ACFID from ACF201 '
      + 'WHERE CIAID=' + quotedstr(wCiaId) + ' and TACFID=' + quotedstr(wTacf);
   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;
   If DMAF.cdsQry.FieldByName('ACFID').AsString = '' Then
      wTacfMax := DMAF.StrZero(1, DMAF.cdsQry.FieldByName('ACFID').Size)
   Else
   Begin
      wTacfMax := DMAF.StrZero(DMAF.cdsQry.FieldByName('ACFID').AsInteger + 1, Length(DMAF.cdsQry.FieldByName('ACFID').AsString));
   End;
   /////////////////////////////////////////////////////////////////
   // obtiene Porcentaje de Depreciacion, Tiempo de Vida Util y Cuenta Contable
   xSQL := 'Select * from ACF101 where TACFID=' + quotedstr(wTacf);
   DMAF.cdsQry.Close;
   DMAF.cdsQry.IndexFieldNames := '';
   DMAF.cdsQry.Filter := '';
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;
   wVidaUtil := DMAF.cdsQry.FieldByname('TACFVIDA').AsString;
   wCuentaId := DMAF.cdsQry.FieldByname('CUENTAID').AsString;
   /////////////////////////////////////////////////////////////////

   DMAF.cdsActFij.Append;
   DMAF.cdsActFij.FieldByName('CIAID').AsString := wCiaId;
   DMAF.cdsActFij.FieldByName('UBICID').AsString := wCiaId;
   DMAF.cdsActFij.FieldByName('TACFID').AsString := wTacf;
   DMAF.cdsActFij.FieldByName('ACFID').AsString := wTacfMax;
   DMAF.cdsActFij.FieldByName('ACFREFOR').AsString := '00';
   DMAF.cdsActFij.FieldByName('ACFFLACOMP').AsString := 'N';
   DMAF.cdsActFij.FieldByName('AcFidComp').AsString := '';

   If wNumCodBar = 0 Then // para controlar las repeticiones en la grabacion
      DMAF.cdsActFij.FieldByName('ARTCODBAR').AsString := dbeCodBarrasIng.Text
   Else
      DMAF.cdsActFij.FieldByName('ARTCODBAR').AsString := strzero(intTostr(wNumCodBar), 6);

   DMAF.cdsActFij.FieldByName('LOCID').AsString := dblcLocalIng.Text;
   DMAF.cdsActFij.FieldByName('PISO').AsString := dblcPisoIng.Text;
   DMAF.cdsActFij.FieldByName('AREA').AsString := dblcAreaIng.Text;
   DMAF.cdsActFij.FieldByName('AMBCOD').AsString := dblcAmbIng.Text;
   DMAF.cdsActFij.FieldByName('RECIBEID').AsString := dbeRespIng.Text;
   DMAF.cdsActFij.FieldByName('RECIBENOM').AsString := edtRespIng.Text;
   DMAF.cdsActFij.FieldByName('CCOSID').AsString := wCCOSID;
   DMAF.cdsActFij.FieldByName('ACFDES').AsString := dbeDenominaciIng.Text;
   DMAF.cdsActFij.FieldByName('ESTADOID').AsString := dblcEstadoIng.Text;
   DMAF.cdsActFij.FieldByName('ACFDESL').AsString := dbeACFDESLIng.Text;
   DMAF.cdsActFij.FieldByName('MATERIALID').AsString := dblcMaterialIng.Text;
   DMAF.cdsActFij.FieldByName('AcfTipAdqu').AsString := 'T';
   DMAF.cdsActFij.FieldByName('ACFMARCA').AsString := dbeMarcaIng.Text;
   DMAF.cdsActFij.FieldByName('ACFMODELO').AsString := dbeModeloIng.Text;
   DMAF.cdsActFij.FieldByName('ACFSERIE').AsString := dbeSerieIng.Text;
   DMAF.cdsActFij.FieldByName('ACFMEDIDA').AsString := dbeDimensioIng.Text;

   DMAF.cdsActFij.FieldByName('CCosId').AsString := wCCOSID;
   DMAF.cdsActFij.FieldByName('CuentaId').AsString := wCuentaId;
   DMAF.cdsActFij.FieldByName('TacfVida').AsString := wVidaUtil;

//   DMAF.cdsActFijo.FieldByName('TIPMOT').AsString    := 'INGRESO';
//   DMAF.cdsActFijo.FieldByName('MOTIVO').AsString    := dblcMotivoIng.Text;
   DMAF.cdsActFij.FieldByName('ODCID').AsString := dbeOCompra.Text;
   DMAF.cdsActFij.FieldByName('OCNDOC').AsString := dbeOCompra.Text;
// JCC 05/Nov
   DMAF.cdsActFij.FieldByName('PROV').AsString := DMAF.cdsProvee.FieldByName('PROV').AsString;
   DMAF.cdsActFij.FieldByName('ACFFECADQ').AsDateTime := dbdtpFecIng.Date;
   DMAF.cdsActFij.FieldByName('OCFECHA').AsDateTime := dbdtpFecIng.Date;
//chequear obc que campo debe ser   DMAF.cdsActFij.FieldByName('DOCREF').AsString    := dblcDocRefIng.Text;
   DMAF.cdsActFij.FieldByName('DOCID').AsString := DMAF.cdsDocs.FieldByName('DOCID').AsString;
   DMAF.cdsActFij.FieldByName('ACFSERIEDO').AsString := dbeSerieDoc.Text;
   DMAF.cdsActFij.FieldByName('ACFNODOC').AsString := dbeNoDoc.Text;
//chequear obc que campo debe ser   DMAF.cdsActFij.FieldByName('NUMDOC').AsString    := dbeNoDoc.Text;
   DMAF.cdsActFij.FieldByName('VERI').AsString := 'S';

   ///////////////////////////////////////////////////////////////////////
   /// VALOR DEL CAMBIO DE MONEDA POR COMPRAS
{   xSQL:='Select * from LOG304 '
        +'Where CIAID='''+DMAF.cdsActFij.FieldByname('CiaID').AsString+''' AND '
        +      'PROV='''+DMAF.cdsActFij.FieldByname('PROV').AsString+''' AND '
        +      'ODCID='''+DMAF.cdsActFij.FieldByname('ODCID').AsString+'''';
   DMAF.cdsBusca.Close;
   DMAF.cdsBusca.IndexFieldNames:='';
   DMAF.cdsBusca.Filtered:=False; DMAF.cdsBusca.Filter:='';
   DMAF.cdsBusca.DataRequest( xSQL );
   DMAF.cdsBusca.Open;
   DMAF.cdsActFij.FieldByName('ACFCAMBIO').Value:=DMAF.cdsBusca.FieldByname('ODCTCAMB').AsFloat;
}
   ///////////////////////////////////////////////////////////////////////
   /// Cambio del Dia
//   if DMAF.cdsBusca.RecordCount=0 then
//   begin
   xSQL := 'SELECT * FROM TGE107 ' +
      'WHERE FECHA=(SELECT MAX(FECHA)' +
      'FROM TGE107 ' +
      'WHERE FECHA<=' + DMAF.wRepFuncDate + '''' + xFecha + ''')) ' +
      ' and TMONID=''' + DMAF.wTmonExt + '''';
   DMAF.cdsBusca.Close;
   DMAF.cdsBusca.IndexFieldNames := '';
   DMAF.cdsBusca.Filtered := False;
   DMAF.cdsBusca.Filter := '';
   DMAF.cdsBusca.DataRequest(xSQL);
   DMAF.cdsBusca.Open;
   DMAF.cdsActFij.FieldByName('ACFCAMBIO').Value := DMAF.cdsBusca.FieldByname('TCAMVXV').AsFloat;
//   end;

   DMAF.cdsActFij.FieldByName('TMONID').AsString := DMAF.cdsMoneda.FieldByname('TMONID').AsString;
   DMAF.cdsActFij.FieldByName('ACFVALOMO').AsFloat := 0;
   DMAF.cdsActFij.FieldByName('ACFVALOMN').AsFloat := 0;
   DMAF.cdsActFij.FieldByName('ACFVALOME').AsFloat := 0;

   If length(trim(dbeValorIng.Text)) = 0 Then
      DMAF.cdsActFij.FieldByName('ACFVALOMO').AsFloat := 0
   Else
      DMAF.cdsActFij.FieldByName('ACFVALOMO').AsFloat := strtofloat(dbeValorIng.Text);

   If DMAF.cdsActFij.FieldByName('ACFCAMBIO').Value > 0 Then
   Begin
      If DMAF.wTMonLoc = DMAF.cdsActFij.FieldByName('TMONID').AsString Then
      Begin
         DMAF.cdsActFij.FieldByName('ACFVALOMN').Value := DMAF.cdsActFij.FieldByName('ACFVALOMO').AsFloat;
         DMAF.cdsActFij.FieldByName('ACFVALOME').Value := FRound(DMAF.cdsActFij.FieldByName('ACFVALOMO').AsFloat /
            DMAF.cdsActFij.FieldByName('ACFCAMBIO').Value, 15, 2);
      End
      Else
      Begin
         DMAF.cdsActFij.FieldByName('ACFVALOME').Value := DMAF.cdsActFij.FieldByName('ACFVALOMO').AsFloat;
         DMAF.cdsActFij.FieldByName('ACFVALOMN').Value := FRound(DMAF.cdsActFij.FieldByName('ACFVALOMO').AsFloat *
            DMAF.cdsActFij.FieldByName('ACFCAMBIO').Value, 15, 2);
      End;
   End;
   DMAF.cdsActFij.FieldByName('AcFHReg').Value := Time;
   DMAF.cdsActFij.FieldByName('AcFFReg').Value := Date;
   DMAF.cdsActFij.FieldByName('AcFUser').Value := DMAF.wUsuario;
   DMAF.cdsActFij.FieldByName('AcFFlagAct').Value := 'A'; // P(por Activar), A(Activo), I(Inactivo)
   DMAF.cdsActFij.FieldByName('ACFDESACMO').Value := '.';

   /////////////////////////////////////////////////////////////////////////////////////////////////
   // ADICIONA AL LOG332, PARA PODER EFECTUAR EL TRASLADO, ESTO SOLO ES POR ACTIVOS QUE NO SE
   // INGRESARON DIRECTAMENTE POR EL ALMACEN- ACTIVOS EN REGULARIZACION
   // ESTA RUTINA NO SE LLEGO A USAR, YA QUE SE ENCONTRO LA SOLUCION A TRAVES DE ALMACEN
{   xSQL :='SELECT * FROM TEG205 WHERE ARTACTIVO='+quotedstr('S');
   DMAF.cdsBusca.Close;
   DMAF.cdsBusca.IndexFieldNames:='';
   DMAF.cdsBusca.Filtered:=False; DMAF.cdsBusca.Filter:='';
   DMAF.cdsBusca.DataRequest( xSQL );
   DMAF.cdsBusca.Open;

   xSQL :='SELECT * FROM LOG332 WHERE 1<>1';
   DMAF.cdsQry.Close;
   DMAF.cdsQry.IndexFieldNames:='';
   DMAF.cdsQry.Filtered:=False; DMAF.cdsQry.Filter:='';
   DMAF.cdsQry.DataRequest( xSQL );
   DMAF.cdsQry.Open;

   DMALM.cdsQry.Append;
   DMAF.cdsQry.FieldByName('CODBAR').AsString    := dbeCodBarrasIng.Text;
   DMAF.cdsQry.FieldByName('CIAID').AsString     := wCiaId.text;
   DMAF.cdsQry.FieldByName('LOCID').AsString     := dblcLocalIng.Text;
   DMAF.cdsQry.FieldByName('TINID').AsString     := DMAF.cdsBusca.FielbyName('TINID').AsString;
   DMAF.cdsQry.FieldByName('TDAID').AsString     := '';
   DMAF.cdsQry.FieldByName('NITDOC').AsString    := '';
   DMAF.cdsQry.FieldByName('NISAID').AsString    := dbeCodBarrasIng.Text+DMAF.wUsuario;
   DMAF.cdsQry.FieldByName('NINDOC').AsString    := dbeCodBarrasIng.Text+DMAF.wUsuario;
   DMAF.cdsQry.FieldByName('NISATIP').AsString   := 'INGRESO';
   DMAF.cdsQry.FieldByName('KDXID').AsString     := '001';
   DMAF.cdsQry.FieldByName('ARTID').AsString     := DMAF.cdsBusca.FielbyName('ARTID').AsString;
   DMAF.cdsQry.FieldByName('ARTDES').AsString    := DMAF.cdsBusca.FielbyName('ARTDES').AsString;
   DMAF.cdsQry.FieldByName('GRARID').AsString    := DMAF.cdsBusca.FielbyName('GRARID').AsString;
   DMAF.cdsQry.FieldByName('FAMID').AsString     := DMAF.cdsBusca.FieldByName('FAMID').AsString;
   DMAF.cdsQry.FieldByName('SFAMID').AsString    := DMAF.cdsBusca.FieldByName('SFAMID').AsString;
   DMAF.cdsQry.FieldByName('MARCA').AsString     := dbeMarcaIng.Text;
   DMAF.cdsQry.FieldByName('MODELO').AsString    := dbeModeloIng.Text;
   DMAF.cdsQry.FieldByName('SERIE').AsString     := dbeSerieIng.Text;
   DMAF.cdsQry.FieldByName('COLOR').AsString     := '';
   DMAF.cdsQry.FieldByName('PROV').AsString      := DMAF.cdsProvee.FieldByName('PROV').AsString;
   DMAF.cdsQry.FieldByName('NISANDOC').AsString  := '';
   DMAF.cdsQry.FieldByName('NISAFDOC').AsString  := dbdtpFecIng.Date;
   DMAF.cdsQry.FieldByName('NIFECHA').AsDateTime := dbdtpFecIng.Date;
   DMAF.cdsQry.FieldByName('ARTPCG').AsFloat     := strtofloat(dbeValorIng.Text);
   DMAF.cdsQry.FieldByName('ODCID').AsString     := dbeOCompra.Text;
   DMAF.cdsQry.FieldByName('TMONID').AsString    := DMAF.cdsMoneda.FieldByname('TMONID').AsString;
   DMAF.cdsQry.FieldByName('FACTDOC').AsString   := DMAF.cdsDocs.FieldByName('DOCID').AsString;
   DMAF.cdsQry.FieldByName('FACNSERIE').AsString := dbeSerieDoc.Text;
   DMAF.cdsQry.FieldByName('FACNDOC').AsString   := dbeNoDoc.Text;
   DMAF.cdsQry.FieldByName('NISSIT').AsString    := 'INICIAL'; // 'ACEPTADO'
   DMAF.cdsQry.FieldByName('NISIT').AsString     := 'INICIAL'; // 'ACEPTADO'
   DMAF.cdsQry.FieldByName('ENTREGADO').AsString := 'N';
   DMAF.cdsQry.FieldByName('ESTADOID').AsString  := 'N'; //=Pendiente DE SER ACTIVADO , AC=ACTIVADO
   DMAF.cdsQry.FieldByName('ITEM').AsInteger     :=1;

   xSQL :='SELECT * FROM TEG151 WHERE ALMACTIVOF='+quotedstr('S');
   DMAF.cdsBusca.Close;
   DMAF.cdsBusca.IndexFieldNames:='';
   DMAF.cdsBusca.Filtered:=False; DMAF.cdsBusca.Filter:='';
   DMAF.cdsBusca.DataRequest( xSQL );
   DMAF.cdsBusca.Open;
   DMAF.cdsQry.FieldByName('ALMID').AsString     := DMAF.cdsBusca.FielbyName('ALMID').AsString;
}
   //////////////////////////////////////////////////////////////////////////////////////////////
End;

Procedure TFAFControlOpe.ModificaActivos;
Begin
   xSQL := 'SELECT * FROM ACF201 WHERE ARTCODBAR=' + quotedstr(DMAF.cdsActFij.FieldByName('ARTCODBAR').AsString);
   DMAF.cdsActFij.Close;
   DMAF.cdsActFij.DataRequest(xSQL);
   DMAF.cdsActFij.Open;
   DMAF.cdsActFij.Edit;
   DMAF.cdsActFij.FieldByName('ACFDESL').AsString := dbeACFDESLIng.Text;
   DMAF.cdsActFij.FieldByName('MATERIALID').AsString := dblcMaterialIng.Text;
   DMAF.cdsActFij.FieldByName('ACFMARCA').AsString := dbeMarcaIng.Text;
   DMAF.cdsActFij.FieldByName('ACFMODELO').AsString := dbeModeloIng.Text;
   DMAF.cdsActFij.FieldByName('ACFSERIE').AsString := dbeSerieIng.Text;
   DMAF.cdsActFij.FieldByName('ACFMEDIDA').AsString := dbeDimensioIng.Text;
   If dbeVeri.Text = 'S' Then
      DMAF.cdsActFij.FieldByName('VERI').AsString := dbeVeri.Text;
{
   DMAF.cdsActFij.FieldByName('ODCID').AsString   := dbeOCompra.Text;
   DMAF.cdsActFij.FieldByName('OCNDOC').AsString   := dbeOCompra.Text;
   DMAF.cdsActFij.FieldByName('PROV').AsString  := DMAF.cdsProvee.FieldByName('PROV').AsString;
   DMAF.cdsActFij.FieldByName('ACFFECADQ').AsDateTime  := dbdtpFecIng.Date;
   DMAF.cdsActFij.FieldByName('OCFECHA').AsDateTime  := dbdtpFecIng.Date;
// chequear que campo debe ser   DMAF.cdsActFij.FieldByName('DOCREF').AsString    := dblcDocRefIng.Text;
   DMAF.cdsActFij.FieldByName('DOCID').AsString    := DMAF.cdsDocs.FieldByName('DOCID').AsString;
   DMAF.cdsActFij.FieldByName('ACFSERIEDO').AsString    := dbeSerieDoc.Text;
   DMAF.cdsActFij.FieldByName('ACFNODOC').AsString    := dbeNoDoc.Text;
}
// chequear obc que campo debe ser   DMAF.cdsActFij.FieldByName('NUMDOC').AsString    := dbeNoDoc.Text;
   ///////////////////////////////////////////////////////////////////////
   /// VALOR DEL CAMBIO DE MONEDA POR COMPRAS
{   xSQL:='Select * from LOG304 '
        +'Where CIAID='''+DMAF.cdsActFij.FieldByname('CiaID').AsString+''' AND '
        +      'PROV='''+DMAF.cdsActFij.FieldByname('PROV').AsString+''' AND '
        +      'ODCID='''+DMAF.cdsActFij.FieldByname('ODCID').AsString+'''';
   DMAF.cdsBusca.Close;
   DMAF.cdsBusca.IndexFieldNames:='';
   DMAF.cdsBusca.Filtered:=False; DMAF.cdsBusca.Filter:='';
   DMAF.cdsBusca.DataRequest( xSQL );
   DMAF.cdsBusca.Open;
   DMAF.cdsActFij.FieldByName('ACFCAMBIO').Value:=DMAF.cdsBusca.FieldByname('ODCTCAMB').AsFloat;

   ///////////////////////////////////////////////////////////////////////
   /// Cambio del Dia
   if DMAF.cdsBusca.RecordCount=0 then
   begin
      xSQL :='SELECT * FROM TGE107 '                                            +
             'WHERE FECHA=(SELECT MAX(FECHA)'                                  +
                         'FROM TGE107 '                                       +
                         'WHERE FECHA<='+DMAF.wRepFuncDate+''''+xFecha+''')) '+
             ' and TMONID='''+ DMAF.wTmonExt + ''''             ;
      DMAF.cdsBusca.Close;
      DMAF.cdsBusca.IndexFieldNames:='';
      DMAF.cdsBusca.Filtered:=False; DMAF.cdsBusca.Filter:='';
      DMAF.cdsBusca.DataRequest( xSQL );
     DMAF.cdsBusca.Open;
     DMAF.cdsActFij.FieldByName('ACFCAMBIO').Value:=DMAF.cdsBusca.FieldByname('TCAMVXV').AsFloat;
   end;

   DMAF.cdsActFij.FieldByName('TMONID').AsString    := DMAF.cdsMoneda.FieldByname('TMONID').AsString;
   if length(trim(dbeValorIng.Text))=0 then
      DMAF.cdsActFij.FieldByName('ACFVALOMO').AsFloat:= 0
   else
      DMAF.cdsActFij.FieldByName('ACFVALOMO').AsFloat   := strtofloat(dbeValorIng.Text);

   if DMAF.cdsActFij.FieldByName('ACFCAMBIO').Value>0 then
   begin
      if DMAF.wTMonLoc=DMAF.cdsActFij.FieldByName('TMONID').AsString then
      begin
         DMAF.cdsActFij.FieldByName('ACFVALOMN').Value:=DMAF.cdsActFij.FieldByName('ACFVALOMO').AsFloat;
         DMAF.cdsActFij.FieldByName('ACFVALOME').Value:=FRound(DMAF.cdsActFij.FieldByName('ACFVALOMO').AsFloat/
                                                       DMAF.cdsActFij.FieldByName('ACFCAMBIO').Value,15,2);
      end
      else
      begin
         DMAF.cdsActFij.FieldByName('ACFVALOME').Value:=DMAF.cdsActFij.FieldByName('ACFVALOMO').AsFloat;
         DMAF.cdsActFij.FieldByName('ACFVALOMN').Value:=FRound(DMAF.cdsActFij.FieldByName('ACFVALOMO').AsFloat*
                                                        DMAF.cdsActFij.FieldByName('ACFCAMBIO').Value,15,2);
      end;
   end;
}
   DMAF.cdsActFij.FieldByName('AcFHReg').Value := Time;
   DMAF.cdsActFij.FieldByName('AcFFReg').Value := Date;
   DMAF.cdsActFij.FieldByName('AcFUser').Value := DMAF.wUsuario;

End;
//INICIO HPP_201105_ACF

Procedure TFAFControlOpe.ActDenominacionSerie;
Begin
   //actualizando todas las tablas relacionadas a la denominacion y Nº serie

   //Maestro de Activos
   xSQL := ' UPDATE ACF201 SET ACF201.ACFSERIE = ' + QuotedStr(dbeSerieIng.Text) + ' ,' +
      ' ACF201.ACFDES = ' + QuotedStr(dbeDenominaciIng.Text) +
      ' WHERE ACF201.ARTCODBAR = ' + QuotedStr(dbeCodBarrasIng.Text);
   DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
   //Inventarios
   xSQL := ' UPDATE ACF302 SET ACF302.ACFSERIE = ' + QuotedStr(dbeSerieIng.Text) + ' ,' +
      ' ACF302.ACFDES =  ' + QuotedStr(dbeDenominaciIng.Text) +
      ' WHERE ACF302.ARTCODBAR = ' + QuotedStr(dbeCodBarrasIng.Text);
   DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
   //Detalle de traslados
   xSQL := ' UPDATE ACF321 SET ACF321.ACFSERIE = ' + QuotedStr(dbeSerieIng.Text) + ' ,' +
      ' ACF321.ACFDES = ' + QuotedStr(dbeDenominaciIng.Text) +
      ' WHERE ACF321.ARTCODBAR = ' + QuotedStr(dbeCodBarrasIng.Text);
   DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
   xSQL := ' UPDATE ACF322 SET ACF322.ACFSERIE = ' + QuotedStr(dbeSerieIng.Text) + ' ,' +
      ' ACF322.ACFDES = ' + QuotedStr(dbeDenominaciIng.Text) +
      ' WHERE ACF322.ARTCODBAR = ' + QuotedStr(dbeCodBarrasIng.Text);
   DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
   //vinculo entre activos fijos y almacen
   xSQL := ' UPDATE LOG332 SET LOG332.ACFSERIE = ' + QuotedStr(dbeSerieIng.Text) +
      ' WHERE LOG332.CODBAR = ' + QuotedStr(dbeCodBarrasIng.Text);
   DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
   //Depreciacion
   xSQL := ' UPDATE ACF204 SET ACF204.ACFDES = ' + QuotedStr(dbeDenominaciIng.Text) +
      ' WHERE ACF204.ARTCODBAR = ' + QuotedStr(dbeCodBarrasIng.Text);
   DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);

End;
//FIN HPP_201105_ACF
End.

