Unit ACF210;
//********************************************************
// MODIFICADO POR   : Abelardo Sulca Palomino
// Nº HPP           : HPP_201104_ACF
// FECHA DE MODIF.  : 01/04/2011
// DESCRIPCION      : Se modifica la funcionalidad de desactivación
//                    para que genere automáticamente una solicitud de
//                    desactivación en estado ACEPTADO
//********************************************************
//********************************************************
// MODIFICADO POR   : Abelardo Sulca Palomino
// Nº HPP           : HPP_201107_ACF
// FECHA DE MODIF.  : 13/05/2011
// DESCRIPCION      : Se pone invisible el control que muestra el valor del campo
//                    ACF201.ARTCODBAR y se crea un control nuevo que mostrará el contenido del
//                    campo ACF201.CODIGOBARRA
//********************************************************

// Actualizaciones
// HPC_201701_ACF 26/10/2017 Entrega a Control de Calidad
// HPC_201801_ACF 02/08/2018 Se cambia el Provider debido a que no devuelve el valor correctamente

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Grids, Wwdbigrd, Wwdbgrid, DBCtrls, ExtCtrls, Buttons, Mask,
   wwdbedit, wwdblook, db, wwdbdatetimepicker, Wwdbdlg, wwkeycb, ppVar,
   ppPrnabl, ppClass, ppCtrls, ppDB, ppBands, ppProd, ppReport, ppComm,
   ppRelatv, ppCache, ppDBPipe, ppModule, daDatMod, ppStrtch, ppMemo,
   ComCtrls, Tabnotbk, GridControl, DBClient, wwClient, DBGrids, myChkBox, variants;

Type
   TFMaestro = Class(TForm)
      pcMaestro: TPageControl;
      TabSheet1: TTabSheet;
      TabSheet2: TTabSheet;
      TabSheet3: TTabSheet;
      TabSheet4: TTabSheet;
      pnlCabReforma: TPanel;
      Label16: TLabel;
      TabSheet5: TTabSheet;
      pnlCabTraslado: TPanel;
      Label75: TLabel;
      Label26: TLabel;
      Label29: TLabel;
      edtUbi5: TEdit;
      edtUbiD5: TEdit;
      edtLoc5: TEdit;
      edtLocD5: TEdit;
      pnlActTraslado: TPanel;
      bbtnOk4: TBitBtn;
      bbtnCancela4: TBitBtn;
      PnlActReg: TPanel;
      Label34: TLabel;
      Label35: TLabel;
      Label36: TLabel;
      Label37: TLabel;
      Label38: TLabel;
      Label40: TLabel;
      Label42: TLabel;
      Label43: TLabel;
      Label46: TLabel;
      Label47: TLabel;
      Label48: TLabel;
      Label49: TLabel;
      Label50: TLabel;
      Label51: TLabel;
      Label52: TLabel;
      Label53: TLabel;
      Label55: TLabel;
      Label56: TLabel;
      Label62: TLabel;
      Label63: TLabel;
      Label64: TLabel;
      Label6: TLabel;
      Label7: TLabel;
      Label8: TLabel;
      Label4: TLabel;
      Label9: TLabel;
      Label10: TLabel;
      Label11: TLabel;
      dbmDesAmp: TDBMemo;
      dblcCia: TwwDBLookupCombo;
      bbtnOk1: TBitBtn;
      bbtnCancela1: TBitBtn;
      dbdtpFecAdqui: TwwDBDateTimePicker;
      dbeFlagComp: TwwDBEdit;
      dblcdCCosId: TwwDBLookupComboDlg;
      dbeMarca: TwwDBEdit;
      dbeModelo: TwwDBEdit;
      dbeSerie: TwwDBEdit;
      dblcdProveedor: TwwDBLookupComboDlg;
      dblcTipAdqui: TwwDBLookupCombo;
      dblcTipDoc: TwwDBLookupCombo;
      dbeSerieDoc: TwwDBEdit;
      dbeNoDoc: TwwDBEdit;
      dblcMoneda: TwwDBLookupCombo;
      dbeCambio: TwwDBEdit;
      dbdtpFecIns: TwwDBDateTimePicker;
      dbdtpFecRecep: TwwDBDateTimePicker;
      dbeValOMO: TwwDBEdit;
      dbeValOMN: TwwDBEdit;
      dbeValOME: TwwDBEdit;
      edtCiaDes: TEdit;
      edtLocalidadDes: TEdit;
      edtMaterialDes: TEdit;
      edtAdquisicionDes: TEdit;
      edtCuentaDes: TEdit;
      dblcLocalidad: TwwDBLookupCombo;
      dblcMaterial: TwwDBLookupCombo;
      edtTipDocDes: TEdit;
      edtProveedorDes: TEdit;
      edtCCostoDes: TEdit;
      edtMonedaDes: TEdit;
      dblcdCuenta: TwwDBLookupComboDlg;
      dbeVida: TwwDBEdit;
      dbgTraslado: TwwDBGrid;
      btnActTraslado: TwwIButton;
      pnlCabComp: TPanel;
      Label77: TLabel;
      dblcdCodigo: TwwDBLookupComboDlg;
      dbdtpFiniDep: TwwDBDateTimePicker;
      Label72: TLabel;
      pnlCabDepre: TPanel;
      Label80: TLabel;
      Label81: TLabel;
      Label83: TLabel;
      Label84: TLabel;
      edtCia1: TEdit;
      edtAct1: TEdit;
      edtTip1: TEdit;
      edtTipD1: TEdit;
      edtActD1: TEdit;
      edtCiaD1: TEdit;
      TabSheet8: TTabSheet;
      Panel3: TPanel;
      Label108: TLabel;
      Label111: TLabel;
      Label112: TLabel;
      pnlCCosto: TPanel;
      dblcCCosto: TwwDBLookupCombo;
      dbePDepr: TwwDBEdit;
      Label115: TLabel;
      dbgCCosto: TwwDBGrid;
      bbtnOk6: TBitBtn;
      Label113: TLabel;
      Label97: TLabel;
      lb99: TLabel;
      Label99: TLabel;
      dbeRefor: TwwDBEdit;
      Label100: TLabel;
      Label101: TLabel;
      dbgCompuesto: TwwDBGrid;
      bbtnGraba: TBitBtn;
      bbtnCancela: TBitBtn;
      Label18: TLabel;
      Label19: TLabel;
      Label20: TLabel;
      Label22: TLabel;
      Label23: TLabel;
      Label25: TLabel;
      Label31: TLabel;
      btnActComp: TwwIButton;
      dbeVeces: TwwDBEdit;
      Label41: TLabel;
      Label44: TLabel;
      edtCia2: TEdit;
      edtCiaD2: TEdit;
      Label45: TLabel;
      edtAct2: TEdit;
      edtActD2: TEdit;
      edtTip2: TEdit;
      Label57: TLabel;
      edtTipD2: TEdit;
      Label2: TLabel;
      edtCia3: TEdit;
      edtCiaD3: TEdit;
      Label15: TLabel;
      edtAct3: TEdit;
      edtActD3: TEdit;
      edtTip3: TEdit;
      Label32: TLabel;
      edtTipD3: TEdit;
      Label1: TLabel;
      Label5: TLabel;
      Label58: TLabel;
      edtCia4: TEdit;
      edtCiaD4: TEdit;
      edtAct4: TEdit;
      edtTip4: TEdit;
      edtTipD4: TEdit;
      edtActD4: TEdit;
      Label21: TLabel;
      Label67: TLabel;
      Label68: TLabel;
      edtCia5: TEdit;
      edtCiaD5: TEdit;
      edtAct5: TEdit;
      edtTip5: TEdit;
      edtTipD5: TEdit;
      edtActD5: TEdit;
      Bevel2: TBevel;
      Bevel3: TBevel;
      edtCCos5: TEdit;
      edtcCosD5: TEdit;
      Label12: TLabel;
      DBGrid1: TwwDBGrid;
      dbeAcFId: TwwDBEdit;
      dbeBarra: TwwDBEdit;
      Label61: TLabel;
      dbeGarantia: TwwDBEdit;
      Label69: TLabel;
      B: TBevel;
      dbeMedidas: TwwDBEdit;
      Label70: TLabel;
      Bevel4: TBevel;
      Bevel5: TBevel;
      Bevel6: TBevel;
      pprTraslados: TppReport;
      Z2bbtnImprime: TBitBtn;
      Z2bbtnGraba: TBitBtn;
      Z2bbtnImprimeCab: TBitBtn;
      lblCodigo: TLabel;
      pnlTra3: TPanel;
      Label13: TLabel;
      dbeAutoriza: TwwDBEdit;
      Label73: TLabel;
      dbeMotivoDes: TwwDBEdit;
      dbeRecibe: TwwDBLookupComboDlg;
      Label14: TLabel;
      dbeRecibeDes: TwwDBEdit;
      pnlTra2: TPanel;
      Label24: TLabel;
      dblcdCCostoN: TwwDBLookupComboDlg;
      edtCCosDes: TEdit;
      Label33: TLabel;
      edtUbicacionDesN: TEdit;
      dblcLocalidadN: TwwDBLookupCombo;
      Label39: TLabel;
      edtLocalidadDesN: TEdit;
      pnlTra1: TPanel;
      Label65: TLabel;
      dbedocmtoT: TwwDBEdit;
      dbdtpTraslado: TwwDBDateTimePicker;
      Label28: TLabel;
      Label3: TLabel;
      dbeMotivo: TwwDBLookupComboDlg;
      edtMot: TEdit;
      Label71: TLabel;
      dbcbExt: TDBCheckBox;
      dblcUbicacionN: TwwDBLookupComboDlg;
      Panel5: TPanel;
      Panel2: TPanel;
      Label27: TLabel;
      Label30: TLabel;
      Label54: TLabel;
      wwDBDateTimePicker1: TwwDBDateTimePicker;
      wwDBDateTimePicker2: TwwDBDateTimePicker;
      wwDBEdit1: TwwDBEdit;
      dbgDepre: TwwDBGrid;
      dbeTipo: TwwDBEdit;
      Label74: TLabel;
      dblcTipoD: TwwDBLookupCombo;
      dbeColor: TwwDBEdit;
      Label78: TLabel;
      Bevel7: TBevel;
      dblcResponsable: TwwDBLookupComboDlg;
      dblcEstado: TwwDBLookupCombo;
      Label79: TLabel;
      edtEstado: TEdit;
      Label82: TLabel;
      ppHeaderBand1: TppHeaderBand;
      ppDetailBand1: TppDetailBand;
      ppLabel1: TppLabel;
      ppLabel7: TppLabel;
      pplMovimiento: TppLabel;
      ppLabel26: TppLabel;
      pplFecha: TppLabel;
      ppLabel12: TppLabel;
      ppchkInterno: TmyCheckBox;
      ppLabel34: TppLabel;
      ppChkExterno: TmyCheckBox;
      ppLabel35: TppLabel;
      ppLabel3: TppLabel;
      pplCodigo: TppLabel;
      ppLabel4: TppLabel;
      pplCodigoBarras: TppLabel;
      ppLabel10: TppLabel;
      pplMarca: TppLabel;
      ppLabel20: TppLabel;
      pplModelo: TppLabel;
      ppLabel30: TppLabel;
      pplSerie: TppLabel;
      ppLabel17: TppLabel;
      ppLabel9: TppLabel;
      ppLabel5: TppLabel;
      ppLabel33: TppLabel;
      ppLabel6: TppLabel;
      pplCCostoOrigen: TppLabel;
      ppLabel14: TppLabel;
      pplCCostoDestino: TppLabel;
      pplCCostoDesAnt: TppLabel;
      pplCCostoDes: TppLabel;
      ppLabel36: TppLabel;
      ppLabel8: TppLabel;
      pplUbicacionOrigen: TppLabel;
      ppLabel15: TppLabel;
      pplUbicacionDestino: TppLabel;
      pplUbicaDesAnt: TppLabel;
      pplUbicaDes: TppLabel;
      ppLabel37: TppLabel;
      ppLabel11: TppLabel;
      pplEmpleadoOrigen: TppLabel;
      ppLabel16: TppLabel;
      pplEmpleadoDestino: TppLabel;
      pplEmpOri: TppLabel;
      pplEmpDes: TppLabel;
      pplCargoOri: TppLabel;
      pplCargoDes: TppLabel;
      ppLabel24: TppLabel;
      ppLabel13: TppLabel;
      pplMotivo: TppLabel;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppLabel27: TppLabel;
      ppLabel31: TppLabel;
      ppLabel32: TppLabel;
      ppLabel21: TppLabel;
      ppLabel25: TppLabel;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppLabel2: TppLabel;
      ppLabel18: TppLabel;
      ppLabel19: TppLabel;
      dblcPiso: TwwDBLookupCombo;
      dblcArea: TwwDBLookupComboDlg;
      edtPisoDes: TEdit;
      edtAreaDes: TEdit;
      dblcAmbiente: TwwDBLookupComboDlg;
      edtAmbienteDes: TEdit;
      Label85: TLabel;
      Label86: TLabel;
      dblcPisoN: TwwDBLookupCombo;
      edtPisoDesN: TEdit;
      dblcAreaN: TwwDBLookupComboDlg;
      edtAreaDesN: TEdit;
      dblcAmbienteN: TwwDBLookupComboDlg;
      edtAmbienteDesN: TEdit;
      Label87: TLabel;
      Label88: TLabel;
      Label89: TLabel;
      edtPiso5: TEdit;
      edtArea5: TEdit;
      edtAmbiente5: TEdit;
      edtPisoD5: TEdit;
      edtAreaD5: TEdit;
      edtAmbienteD5: TEdit;
      Label90: TLabel;
      Label92: TLabel;
      Label93: TLabel;
      Label98: TLabel;
      dblcCiaN: TwwDBLookupCombo;
      edtCiaDesN: TEdit;
      edtResponsableId: TwwDBEdit;
      edtResponsable5: TEdit;
      edtResponsableD5: TEdit;
      Label102: TLabel;
      edtLoc1: TEdit;
      Label103: TLabel;
      edtCCos1: TEdit;
      edtCCosD1: TEdit;
      edtLocD1: TEdit;
      Label104: TLabel;
      edtPiso1: TEdit;
      edtResponsable1: TEdit;
      Label105: TLabel;
      edtArea1: TEdit;
      edtPisoD1: TEdit;
      edtResponsableD1: TEdit;
      edtAreaD1: TEdit;
      edtAmbiente1: TEdit;
      Label106: TLabel;
      edtAmbienteD1: TEdit;
      Label107: TLabel;
      Edit13: TEdit;
      Edit14: TEdit;
      Label109: TLabel;
      edtLoc2: TEdit;
      Label110: TLabel;
      edtCCos2: TEdit;
      edtCCosD2: TEdit;
      edtLocD2: TEdit;
      Label114: TLabel;
      edtPiso2: TEdit;
      edtResponsable2: TEdit;
      Label116: TLabel;
      edtArea2: TEdit;
      edtPisoD2: TEdit;
      edtResponsableD2: TEdit;
      edtAreaD2: TEdit;
      edtAmbiente2: TEdit;
      Label117: TLabel;
      edtAmbienteD2: TEdit;
      Label118: TLabel;
      Edit27: TEdit;
      Edit28: TEdit;
      Label119: TLabel;
      edtLoc3: TEdit;
      Label120: TLabel;
      edtCCos3: TEdit;
      edtCCosD3: TEdit;
      edtLocD3: TEdit;
      Label121: TLabel;
      edtPiso3: TEdit;
      edtResponsable3: TEdit;
      Label122: TLabel;
      edtArea3: TEdit;
      edtPisoD3: TEdit;
      edtResponsableD3: TEdit;
      edtAreaD3: TEdit;
      edtAmbiente3: TEdit;
      Label123: TLabel;
      edtAmbienteD3: TEdit;
      Label124: TLabel;
      Edit41: TEdit;
      Edit42: TEdit;
      Label125: TLabel;
      edtLoc4: TEdit;
      Label126: TLabel;
      edtCCos4: TEdit;
      edtCCosD4: TEdit;
      EdtLocD4: TEdit;
      Label127: TLabel;
      edtPiso4: TEdit;
      edtResponsable4: TEdit;
      Label128: TLabel;
      edtArea4: TEdit;
      edtPisoD4: TEdit;
      edtResponsableD4: TEdit;
      edtAreaD4: TEdit;
      edtAmbiente4: TEdit;
      Label129: TLabel;
      edtAmbienteD4: TEdit;
      Label130: TLabel;
      Edit55: TEdit;
      Edit56: TEdit;
      Label138: TLabel;
      Label139: TLabel;
      Label140: TLabel;
      Label141: TLabel;
      Label142: TLabel;
      Label143: TLabel;
      dbeNIngreso: TwwDBEdit;
      dbeOCompra: TwwDBEdit;
      Label144: TLabel;
      Label145: TLabel;
      dbeTipAct: TwwDBEdit;
      edtTipoActDes: TEdit;
      dblcDes: TwwDBLookupCombo;
      dbeSum: TEdit;
      TabSheet6: TTabSheet;
      Panel1: TPanel;
      Label17: TLabel;
      Label59: TLabel;
      Label60: TLabel;
      Label66: TLabel;
      Label76: TLabel;
      Label91: TLabel;
      Label94: TLabel;
      Label95: TLabel;
      Label96: TLabel;
      Label131: TLabel;
      Label132: TLabel;
      Label133: TLabel;
      Label134: TLabel;
      Edit1: TEdit;
      Edit2: TEdit;
      edtLoc6: TEdit;
      edtLocD6: TEdit;
      edtCia6: TEdit;
      edtCiaD6: TEdit;
      edtAct6: TEdit;
      edtTip6: TEdit;
      edtTipD6: TEdit;
      edtActD6: TEdit;
      edtCCos6: TEdit;
      edtCCosD6: TEdit;
      edtPiso6: TEdit;
      edtArea6: TEdit;
      edtAmbiente6: TEdit;
      edtPisoD6: TEdit;
      edtAreaD6: TEdit;
      edtAmbienteD6: TEdit;
      edtResponsable6: TEdit;
      edtResponsableD6: TEdit;
      Panel4: TPanel;
      Label135: TLabel;
      Label136: TLabel;
      Label137: TLabel;
      Label146: TLabel;
      dbdtpFecInac: TwwDBDateTimePicker;
      dblcMotivo: TwwDBLookupCombo;
      edtMotivo: TEdit;
      dbeDesacmo: TwwDBEdit;
      bbtnOk3: TBitBtn;
      bbtnCancela3: TBitBtn;
      dbeDesAutori: TwwDBLookupComboDlg;
      dbeDesAutori_des: TwwDBEdit;
    //INICIO HPP_201107_ACF
      dbeCodigoBarra: TwwDBEdit;
      edtCodigoBarras_1: TEdit;
      edtCodigoBarras_3: TEdit;
      edtCodigoBarras_4: TEdit;
      edtCodigoBarras_5: TEdit;
      edtCodigoBarras_6: TEdit;
    //FIN HPP_201107_ACF
      Procedure IniciaDatos;
      Procedure procesoRefor;
      Procedure MuestraPorcen;
      Procedure llenacabeceras;
      Procedure IniciaTraslado;
      Procedure RepiteVeces;
      Procedure DatosFecha;
      Procedure bbtnCancela1Click(Sender: TObject);
      Procedure bbtnOk1Click(Sender: TObject);
      Procedure GeneraDepre;
      Procedure GeneraAcfRefor;
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure ConsistenciaDatos;
      Procedure ConsistenciaDatos2;
      Procedure ConsistenciaTraslado;
      Procedure bbtnOk4Click(Sender: TObject);
      Procedure btnActTrasladoClick(Sender: TObject);
      Procedure bbtnCancela4Click(Sender: TObject);
      Procedure dbgTrasladoKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure dbgCompuestoKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure dblcdCodigoDblClick(Sender: TObject);
      Procedure dblcdCodigoEnter(Sender: TObject);
      Procedure FiltraOrdena;
      Procedure dbgDepreEnter(Sender: TObject);
      Procedure ModificaActivos;
      Procedure HabilitaActivo;
      Procedure pcMaestroChanging(Sender: TObject; Var AllowChange: Boolean);
      Procedure bbtnOk3Click(Sender: TObject);
      Procedure bbtnCancela3Click(Sender: TObject);
      Procedure bbtnOk6Click(Sender: TObject);
      Procedure bbtnCancela6Click(Sender: TObject);
      Procedure TabSheet8Enter(Sender: TObject);
      Procedure bbtngrabaClick(Sender: TObject);
      Procedure dbgCCostoKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure TabSheet4Enter(Sender: TObject);
      Procedure TabSheet2Enter(Sender: TObject);
      Procedure bbtnCancelaClick(Sender: TObject);
      Procedure TabSheet5Enter(Sender: TObject);
      Procedure btnActCompClick(Sender: TObject);
      Procedure btnActRegClick(Sender: TObject);
      Procedure dbeAcFidExit(Sender: TObject);
      Procedure dblcdCCostoNExit(Sender: TObject);
      Procedure dblcUbicacionNExit(Sender: TObject);
      Procedure dblcLocalidadNExit(Sender: TObject);
      Procedure TabSheet3Show(Sender: TObject);
      Procedure TabSheet2Show(Sender: TObject);
      Procedure dbeReforExit(Sender: TObject);
      Procedure dbeMotivoEnter(Sender: TObject);
      Procedure dbeMotivoExit(Sender: TObject);
      Procedure dbeRecibeEnter(Sender: TObject);
      Procedure dbeRecibeExit(Sender: TObject);
      Procedure dbeMotivoChange(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure FormDestroy(Sender: TObject);
      Procedure Z2bbtnImprimeClick(Sender: TObject);
      Procedure dbgTrasladoDblClick(Sender: TObject);
      Procedure pprTrasladosPrintingComplete(Sender: TObject);
      Procedure Z2bbtnGrabaClick(Sender: TObject);
      Procedure Z2bbtnImprimeCabClick(Sender: TObject);
      Procedure dbdtpTrasladoExit(Sender: TObject);
      Procedure dbeBarraExit(Sender: TObject);
      Procedure dbdtpFiniDepExit(Sender: TObject);
      Procedure dbdtpFecInsExit(Sender: TObject);
      Procedure dbdtpFecRecepExit(Sender: TObject);
      Procedure dbeValOMOExit(Sender: TObject);
      Procedure dbeCambioExit(Sender: TObject);
      Procedure dblcLocalidadExit(Sender: TObject);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure dblcUbicaxExit(Sender: TObject);
      Procedure dblcMaterialExit(Sender: TObject);
      Procedure dblcTipAdquiExit(Sender: TObject);
      Procedure dbeSerieExit(Sender: TObject);
      Procedure dblcTipDocExit(Sender: TObject);
      Procedure dblcMonedaExit(Sender: TObject);
      Procedure dblcMotivoExit(Sender: TObject);
      Procedure dblcdCuentaExit(Sender: TObject);
      Procedure dblcdProveedorExit(Sender: TObject);
      Procedure dblcTipoExit(Sender: TObject);
      Procedure dblcTipoDExit(Sender: TObject);
      Procedure TabSheet2Exit(Sender: TObject);
      Procedure dblcResponsableExit(Sender: TObject);
      Procedure dblcEstadoExit(Sender: TObject);
      Procedure dbdtpFecAdquiExit(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure dblcPisoExit(Sender: TObject);
      Procedure dblcAreaExit(Sender: TObject);
      Procedure dblcAmbienteExit(Sender: TObject);
      Procedure dblcPisoNExit(Sender: TObject);
      Procedure dblcAreaNExit(Sender: TObject);
      Procedure dblcAmbienteNExit(Sender: TObject);
      Procedure dblcCiaNExit(Sender: TObject);
      Procedure dblcDesExit(Sender: TObject);
      Procedure dbeTipActExit(Sender: TObject);
      Procedure dbeFlagCompExit(Sender: TObject);
      Procedure dbdtpFecInacExit(Sender: TObject);
      Procedure dbeDesAutoriExit(Sender: TObject);
   Private
    { Private declarations }
      strTmp, Tmp: String;
      xFechaTmp: TDate;
      xCrea: Boolean;
      xPorcentaje: Double;
      xSalir: Boolean;
      periodoc: String;
      xTab5: Boolean;
      Procedure QuitaFlagTraslado;
      Procedure ActualizacabTraslados;
      Procedure HabilitaEdicion(xHabilita: Boolean);
   Public
    { Public declarations }
      xxt: String;
   End;

Var
   FMaestro: TFMaestro;
   xcondicion, wretorno, xcds, xsql, xFiltro, xOrden, wxx, wSQL, xxflag: String;
   wCiaConsol, wGuardaValor, wCodBarra: String;
   xNumero, xNumeroCodBar, xTipoDep, xveces: integer;
   xvalorDep, xvalorsum, flagerr: double;
   xFlMod: Boolean;
Implementation

//USES ACFDM, ACF001;
Uses ACFDM, oaAF2000;
{$R *.DFM}
//{$I OPER.PAS}

Procedure TFMaestro.IniciaDatos;
Var
   xprov, xWhere: String;
   xCia, xTAcfid, xAcfid: String;
Begin
// solo para Adición
//   lbrefor.caption:=' ';
   label19.caption := ' ';
   dblcCia.Enabled := True;
//   dbeTipAct.Enabled   :=True;
   dblcLocalidad.Enabled := True;
   dblcPiso.Enabled := True;
   dblcArea.Enabled := True;
   dblcAmbiente.Enabled := True;
//obc   dblcUbica.Enabled    :=True;
   dbeRefor.Enabled := True; // y Reforma  porque son llave
//   dbeTipAct.Enabled   :=True;
//   dbeAcFId.Enabled     :=True;
   dbdtpFecAdqui.Enabled := True;
   dbeGarantia.Enabled := true;
   dbeCambio.Enabled := true;
   //
   edtCiaDes.Text := '';
   dbeTipAct.text := '';
   edtTipoActDes.Text := '';
   edtEstado.text := '';
   dbdtpFecRecep.Enabled := True;
   dbdtpFecIns.Enabled := True;
   dblcMoneda.Enabled := True;
//   dbdtpFIniDep.Enabled :=True;
   dbeValoMO.Enabled := True;
//   dbeValoMN.Enabled    :=True;
//   dbeValoME.Enabled    :=True;
   dblcdProveedor.enabled := true;
   dblcTipDoc.enabled := true;
   dbeSerieDoc.enabled := true;
   dbeNoDoc.enabled := true;
//   dbeAcFId.Text:='';
   edtLocalidadDes.Text := '';
   edtPisoDes.Text := '';
   edtAreaDes.Text := '';
   edtAmbienteDes.Text := '';
// obc   edtUbicacionDes.Text:='';
   edtMaterialDes.Text := '';
   edtAdquisicionDes.Text := '';
   edtTipDocDes.Text := '';
   edtCCostoDes.Text := '';
   edtProveedorDes.Text := '';
   edtCuentaDes.Text := '';
   edtMonedaDes.Text := '';

   xCia := DMAF.cdsActFij.FieldByName('CIAID').AsString;
   xTAcfid := DMAF.cdsActFij.FieldByName('TACFID').AsString;
   xAcfid := DMAF.cdsActFij.FieldByName('ACFID').AsString;

   DMAF.cdsActFij.Insert; // Se dispone para Adición
   dbeFlagComp.Text := 'N';
   DMAF.cdsActfij.FieldByName('ACFFlaComp').Value := 'N';
//   dbeVida.enabled :=False;

   If DMAF.wModo = 'R' Then
   Begin
      dbeACFID.Text := xAcfid;
      DMAF.cdsActFij.FieldByName('CIAID').AsString := xCia;
      DMAF.cdsActFij.FieldByName('TACFID').AsString := xTAcfid;
      DMAF.cdsActFij.FieldByName('ACFID').AsString := xAcfid;
      DMAF.cdsActFij.FieldByName('ACFFLAGREF').AsString := 'R';
      ProcesoRefor;
      dblcCia.Enabled := False; // desabilita variable de Compañía
//OBC      dbeTipAct.Enabled:=False;       // codigo de Activo
//      dbeTipAct.Enabled:=TRUE;       // codigo de Activo
//      dbeAcFId.Enabled  :=False;       // codigo de Activo
      dbeRefor.Enabled := False; // y Reforma  porque son llave
      dbeveces.enabled := False;
      dbeveces.visible := True;
      dbeBarra.SetFocus;
      Exit;
   End;
   //
   dbeveces.Text := '0';
   dbeveces.enabled := true;
   dbeveces.visible := True;

   If DMAF.wModo = 'X' Then
   Begin
      // POR COMPRAS
      xSQL := 'Select * from LOG304 '
         + 'Where CIAID=''' + DMAF.cdsCompras.FieldByname('CiaID').AsString + ''' AND '
         + 'ODCID=''' + DMAF.cdsCompras.FieldByname('ODCID').AsString + '''';
      DMAF.cdsQry.Close;
      DMAF.cdsQry.ProviderName := 'dspTGE';
      DMAF.cdsQry.DataRequest(xSQL);
      DMAF.cdsQry.Open;

      xprov := DMAF.cdsQry.Fieldbyname('PROV').asstring;
      DMAF.cdsActFij.FieldByName('ACFCAMBIO').Value := DMAF.cdsQry.FieldByName('ODCTCAMB').Value;
      DMAF.cdsActFij.FieldByName('TMONID').AsString := DMAF.cdsQry.FieldByName('TMONID').AsString;
      DMAF.cdsActFij.fieldbyname('PROV').asstring := xprov;

      DMAF.cdsActFij.FieldByName('CIAID').AsString := DMAF.cdsCompras.FieldByName('CIAID').AsString;
      DMAF.cdsActFij.FieldByName('ACFDES').AsString := DMAF.cdsCompras.FieldByName('DODCOBS').AsString;
      DMAF.cdsActFij.FieldByName('ACFDESL').AsString := DMAF.cdsCompras.FieldByName('DODCOBS').AsString;

      DMAF.cdsActFij.FieldByName('ACFTIPADQU').Value := DMAF.cdsCompras.FieldByName('TipoAdq').AsString;
      DMAF.cdsActFij.FieldByName('ACFVALOMO').Value := DMAF.cdsCompras.FieldByName('DODCPUN').Value *
         (1 + (DMAF.cdsCompras.FieldByName('DODCIMPU').AsFloat / 100));
      If DMAF.wTMonLoc = DMAF.cdsActFij.FieldByName('TMONID').AsString Then
      Begin
         DMAF.cdsActFij.FieldByName('ACFVALOMN').Value := DMAF.cdsActFij.FieldByName('ACFVALOMO').Value;
         DMAF.cdsActFij.FieldByName('ACFVALOME').Value := FRound(DMAF.cdsActFij.FieldByName('ACFVALOMO').Value /
            DMAF.cdsActFij.FieldByName('ACFCAMBIO').Value, 15, 2);
      End
      Else
      Begin
         DMAF.cdsActFij.FieldByName('ACFVALOME').Value := DMAF.cdsActFij.FieldByName('ACFVALOMO').Value;
         DMAF.cdsActFij.FieldByName('ACFVALOMN').Value := FRound(DMAF.cdsActFij.FieldByName('ACFVALOMO').Value *
            DMAF.cdsActFij.FieldByName('ACFCAMBIO').Value, 15, 2);
      End;
      dbeVeces.Text := FloatToStr(DMAF.cdsCompras.FieldByName('DODCCNT').Value - 1);

      xSQL := 'Select * from CXP301 '
         + 'Where CIAID=''' + DMAF.cdsCompras.FieldByname('CIAID').AsString + ''' AND '
         + 'CPOCOMP=''' + DMAF.cdsCompras.FieldByname('ODCID').AsString + '''';
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest(xSQL);
      DMAF.cdsQry.Open;

      If DMAF.cdsQry.RecordCount = 1 Then
      Begin
         DMAF.cdsActFij.FieldByName('PROV').AsString := DMAF.cdsQry.FieldByName('PROV').AsString;
         DMAF.cdsActFij.FieldByName('DOCID').AsString := DMAF.cdsQry.FieldByName('DOCID').AsString;
         DMAF.cdsActFij.FieldByName('ACFSERIEDO').AsString := DMAF.cdsQry.FieldByName('CPSERIE').AsString;
         DMAF.cdsActFij.FieldByName('ACFNODOC').AsString := DMAF.cdsQry.FieldByName('CPNODOC').AsString;
         DMAF.cdsActFij.FieldByName('ACFFECADQ').AsDateTime := DMAF.cdsQry.FieldByName('CPFEMIS').AsDateTime;
      End;

      xCondicion := 'CIAID=''' + dblcCia.Text + ''' and TAcFId=''' + dbeTipAct.Text + '''';
      edtTipoActDes.Text := DMAF.DisplayDescrip('dspTGE', 'ACF101', '*', xCondicion, 'TAcFDes');
      xCondicion := 'DocId=' + '''' + dblcTipDoc.Text + '''';
      edtTipDocDes.Text := BuscaDescripcion(DMAF.cdsTipDoc, xCondicion, 'DocAbr');

      xCrea := False;
      dblcCiaExit(Self);
      dblcLocalidadExit(Self);
      dblcPisoExit(Self);
      dblcAreaExit(Self);
      dblcAmbienteExit(Self);
      dblcMaterialExit(Self);
// obc      dblcUbicaExit(Self);
      dblcTipAdquiExit(Self);
      dblcdCuentaExit(Self);
      dblcMonedaExit(Self);
      dblcResponsableExit(Self);
      dblcdProveedorExit(Self);
      xCrea := True;

      dbeveces.enabled := False;
   End;

   If DMAF.wModo = 'Z' Then
   Begin

      // POR ALMACEN
      xSQL := 'Select * from LOG332 '
         + 'Where CIAID=''' + DMAF.cdsCompras.FieldByname('CIAID').AsString + ''' '
         + 'and LOCID=''' + DMAF.cdsCompras.FieldByname('LOCID').AsString + ''' '
         + 'and TINID=''' + DMAF.cdsCompras.FieldByname('TINID').AsString + ''' '
         + 'and ALMID=''' + DMAF.cdsCompras.FieldByname('ALMID').AsString + ''' '
         + 'and TDAID2=''' + DMAF.cdsCompras.FieldByname('TDAID').AsString + ''' '
         + 'and NFAC=''' + DMAF.cdsCompras.FieldByname('NISAID').AsString + '''';
      DMAF.cdsQry3.Close;
      DMAF.cdsQry3.DataRequest(xSQL);
      DMAF.cdsQry3.Open;

      xSQL := 'Select * from LOG314 '
         + 'Where CIAID=''' + DMAF.cdsCompras.FieldByname('CIAID').AsString + ''' AND '
         + 'NISAID=''' + DMAF.cdsCompras.FieldByname('NISAID').AsString + '''';

      DMAF.cdsQry.Close;
      DMAF.cdsQry.ProviderName := 'dspTGE';
      DMAF.cdsQry.DataRequest(xSQL);
      DMAF.cdsQry.Open;

      xprov := DMAF.cdsQry.Fieldbyname('PROV').asstring;
      DMAF.cdsActFij.FieldByName('CCOSID').AsString := DMAF.cdsQry.FieldByName('CCOSID').AsString;
      DMAF.cdsActFij.FieldByName('ACFCAMBIO').Value := 1; //1DMAF.cdsQry.FieldByName('ODCTCAMB').Value;

      If DMAF.cdsCompras.FieldByName('TMONID').AsString = DMAF.wTMonExt Then
      Begin
         DMAF.cdsActFij.FieldByName('TMONID').AsString := DMAF.cdsCompras.FieldByName('TMONID').AsString;
         DMAF.cdsActFij.FieldByName('ACFCAMBIO').Value := DMAF.cdsCompras.FieldByName('TCAMB').AsFloat;
      End
      Else
      Begin
         DMAF.cdsActFij.FieldByName('TMonId').AsString := DMAF.wTMonLoc;
         xWhere := 'TMonId=' + '''' + DMAF.wTMonExt + '''' + ' and '
            + 'Fecha=' + DMAF.wRepFuncDate + '''' + FORMATDATETIME(DMAF.wFormatFecha, DMAF.cdsCompras.FieldByName('NISAFDOC').AsDateTime) + ''')';
         DMAF.DisplayDescrip('dspTGE', 'TGE107', '*', xWhere, 'TMONID');
         DMAF.cdsActFij.FieldByName('ACFCAMBIO').Value := DMAF.cdsQry.fieldbyname('TCam' + DMAF.wVRN_TipoCambio).AsFloat;
         If DMAF.cdsActFij.FieldByName('ACFCAMBIO').AsFloat = 0 Then
            DMAF.cdsActFij.FieldByName('ACFCAMBIO').Value := 1;
      End;

      DMAF.cdsActFij.fieldbyname('PROV').asstring := xprov;
      DMAF.cdsActFij.FieldByName('CIAID').AsString := DMAF.cdsCompras.FieldByName('CIAID').AsString;
      DMAF.cdsActFij.FieldByName('ACFDES').AsString := DMAF.cdsCompras.FieldByName('ARTDES').AsString;
      DMAF.cdsActFij.FieldByName('ACFDESL').AsString := DMAF.cdsCompras.FieldByName('ARTDES').AsString;
      DMAF.cdsActFij.FieldByName('ARTID').AsString := DMAF.cdsCompras.FieldByName('ARTID').AsString;
      DMAF.cdsActFij.FieldByName('ACFFECADQ').AsDateTime := DMAF.cdsCompras.FieldByName('NISAFREG').AsDateTime;

      //
      DMAF.cdsActFij.FieldByName('ACFMARCA').AsString := DMAF.cdsQry3.FieldByName('MARCA').AsString;
      DMAF.cdsActFij.FieldByName('ACFMODELO').AsString := DMAF.cdsQry3.FieldByName('MODELO').AsString;
      DMAF.cdsActFij.FieldByName('ACFCOLOR').AsString := DMAF.cdsQry3.FieldByName('COLOR').AsString;
      DMAF.cdsActFij.FieldByName('ACFSERIE').AsString := DMAF.cdsQry3.FieldByName('ACFSERIE').AsString;

      If DMAF.cdsCompras.FieldByName('KDXCNTG').Value > 0 Then
         DMAF.cdsActFij.FieldByName('ACFVALOMO').Value := DMAF.cdsCompras.FieldByName('ARTPCG').AsFloat
      Else
         DMAF.cdsActFij.FieldByName('ACFVALOMO').Value := DMAF.cdsCompras.FieldByName('ARTPCU').AsFloat;

      If DMAF.wTMonLoc = DMAF.cdsActFij.FieldByName('TMonId').AsString Then
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
      If DMAF.cdsCompras.FieldByName('KDXCNTG').Value > 0 Then
         dbeVeces.Text := FloatToStr(DMAF.cdsCompras.FieldByName('KDXCNTG').AsFloat - 1)
      Else
         dbeVeces.Text := FloatToStr(DMAF.cdsCompras.FieldByName('KDXCNTU').AsFloat - 1);

      xCondicion := 'CIAID=''' + dblcCia.Text + ''' and TAcFId=''' + dbeTipAct.Text + '''';
      edtTipoActDes.Text := DMAF.DisplayDescrip('dspTGE', 'ACF101', '*', xCondicion, 'TAcFDes');
      xCondicion := 'DocId=' + '''' + dblcTipDoc.Text + '''';
      edtTipDocDes.Text := BuscaDescripcion(DMAF.cdsTipDoc, xCondicion, 'DocAbr');

      xCrea := False;
      dblcCiaExit(Self);
      dblcLocalidadExit(Self);
      dblcPisoExit(Self);
      dblcAreaExit(Self);
      dblcAmbienteExit(Self);
      dblcMaterialExit(Self);
// obc      dblcUbicaExit(Self);
      dblcTipAdquiExit(Self);
      dblcdCuentaExit(Self);
      dblcMonedaExit(Self);
      dblcResponsableExit(Self);
      dblcdProveedorExit(Self);
      xCrea := True;

      dbeveces.enabled := false;
   End;

   dblcCia.SetFocus;
End;

Procedure TFMaestro.bbtnCancela1Click(Sender: TObject);
Begin
   close;
End;

Procedure TFMaestro.btnActRegClick(Sender: TObject);
Begin
   pcMaestro.ActivePageIndex := 0; // Pasa a Datos Generales
   pcMaestro.Visible := True;
   IniciaDatos;
End;

Procedure TFMaestro.bbtnOk1Click(Sender: TObject);
Var
   i: Integer;
   sql, xsql: String;
Begin
   SQL := 'select MAX(FAPERIODO)PERIODO,MAX(FAFECDEPRE) FECHADEPREC FROM ACF102 WHERE FAPROC=''P''';
   DMAF.cdsQry.close;
   DMAF.cdsQry.DataRequest(SQL);
   DMAF.cdsQry.open;

   If DMAF.wModo = 'A' Then
      DMAF.cdsActFij.FieldByName('Veri').Value := 'S';

   ConsistenciaDatos;
   If flagerr = 1 Then exit;

   DMAF.cdsActFij.FieldByName('UBICID').AsString := DMAF.cdsAmbiente.FieldByName('CIAID').AsString;
   DMAF.cdsActFij.FieldByName('AcFHReg').Value := Time;
   DMAF.cdsActFij.FieldByName('AcFFReg').Value := Date;
   DMAF.cdsActFij.FieldByName('AcFUser').Value := DMAF.wUsuario;

// TOMA DATOS DE REGISTRO DE FECHA
   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      xSQL := 'SELECT * FROM TGE114 WHERE FECHA='
         + 'DATE(''' + FORMATDATETIME('YYYY-MM-DD', dbdtpFECADQUI.DATE) + ''')';
   End;
   If (SRV_D = 'ORACLE') Then
   Begin
      xSQL := 'SELECT * FROM TGE114 WHERE FECHA='
         + 'TO_DATE(''' + FORMATDATETIME(DMAF.wFormatFecha, dbdtpFECADQUI.DATE) + ''')';
   End;
   DMAF.cdsWork1.Close;
   DMAF.cdswork1.datarequest(xSQL);
   DMAF.cdsWork1.OPEN;

   If DMAF.cdsWork1.RecordCount > 0 Then
      Datosfecha;
//
   Screen.Cursor := CrHourGlass;

   If DMAF.wModo = 'M' Then //MODIFICA MAESTRO
   Begin
      DMAF.ControlTran;
      If DMAF.wTipoAdicion = 'xFiltro' Then
      Begin
//         DMAF.ActualizaFiltro(Mant2,DMAF.cdsActFij,DMAF.wModo);
         oaAF2000.Mant2.FMant.cds2.Data := DMAF.cdsActFij.Data;
      End;
      pcMaestro.Visible := False;
      Screen.Cursor := CrDefault;
      Close;
      Exit;
   End;

   DMAF.cdsActFij.FieldByName('AcFFlagAct').Value := 'A'; // ADICIONA MAESTRO
   GeneraAcfRefor;
//   GeneraDepre; // PROCESO ACTIVADO

   // Trasnferencias desde Compras
   If DMAF.wModo = 'X' Then
   Begin
      DMAF.cdsCompras.Edit;
      DMAF.cdsCompras.FieldByname('ACFReg').AsString := 'S';
      xveces := STRtoInt(dbeVeces.Text);
   End;

   // Trasferencias desde Almacen
   If DMAF.wModo = 'Z' Then
   Begin
      {
      DMAF.cdsCompras.Edit;
      DMAF.cdsCompras.FieldByname('ACFREG').AsString:='S';
      }
      xSQL := 'Update LOG315 set ACFREG=''S'' '
         + 'Where CIAID=''' + DMAF.cdsCompras.FieldByname('CIAID').AsString + ''' '
         + 'and LOCID=''' + DMAF.cdsCompras.FieldByname('LOCID').AsString + ''' '
         + 'and TINID=''' + DMAF.cdsCompras.FieldByname('TINID').AsString + ''' '
         + 'and ALMID=''' + DMAF.cdsCompras.FieldByname('ALMID').AsString + ''' '
         + 'and TDAID=''' + DMAF.cdsCompras.FieldByname('TDAID').AsString + ''' '
         + 'and NISAID=''' + DMAF.cdsCompras.FieldByname('NISAID').AsString + '''';
      DMAF.cdsQry.close;
      DMAF.cdsQry.DataRequest(xSQL);
      DMAF.cdsQry.Execute;

      xveces := STRtoInt(dbeVeces.Text);
   End;

//   DMAF.cdsActFij.DataRequest('Select * From ACF201 '
//                             +'WHERE CIAID='''+dblcCia.Text+''' and ACFID='''+dbeAcfid.Text+'''' );
//   cdsPost( DMAF.cdsActFij );

   DMAF.ControlTran; // graba regs.original/y duplicados si los hay
   If DMAF.wTipoAdicion = 'xFiltro' Then
   Begin
//      DMAF.ActualizaFiltro(Mant2,DMAF.cdsActFij,DMAF.wModo);
      oaAF2000.Mant2.FMant.cds2.Data := DMAF.cdsActFij.Data;
   End;

//   if DMAF.wModo='M' then             //MODIFICA MAESTRO
//   begin
   If xveces > 0 Then
      RepiteVeces;
//   end;

   If (DMAF.wModo = 'X') Or (DMAF.wModo = 'Z') Then
   Begin
      Screen.Cursor := CrDefault;
      Close;
   End;
   IniciaDatos;
   Screen.Cursor := CrDefault;
End;

Procedure TFMaestro.DatosFecha;
Begin
   DMAF.CDSACTFIJ.FieldByName('FECANOMES').VALUE := DMAF.cdsWork1.FieldByName('FECANO').Value +
      DMAF.cdsWork1.FieldByName('FECMES').Value;
   DMAF.CDSACTFIJ.FieldByName('FECANO').VALUE := DMAF.cdsWork1.FieldByName('FECANO').Value;
   DMAF.CDSACTFIJ.FieldByName('FECMES').VALUE := DMAF.cdsWork1.FieldByName('FECMES').Value;
   DMAF.CDSACTFIJ.FieldByName('FECDIA').VALUE := DMAF.cdsWork1.FieldByName('FECDIA').Value;
   DMAF.CDSACTFIJ.FieldByName('FECDIASS').VALUE := DMAF.cdsWork1.FieldByName('FECDIASS').Value;
   DMAF.CDSACTFIJ.FieldByName('FECTRIM').VALUE := DMAF.cdsWork1.FieldByName('FECTRIM').Value;
   DMAF.CDSACTFIJ.FieldByName('FECSEM').VALUE := DMAF.cdsWork1.FieldByName('FECSEM').Value;
   DMAF.CDSACTFIJ.FieldByName('FECSS').VALUE := DMAF.cdsWork1.FieldByName('FECSS').Value;
   DMAF.CDSACTFIJ.FieldByName('FECAATRI').VALUE := DMAF.cdsWork1.FieldByName('FECAATRI').Value;
   DMAF.CDSACTFIJ.FieldByName('FECAASEM').VALUE := DMAF.cdsWork1.FieldByName('FECAASEM').Value;
   DMAF.CDSACTFIJ.FieldByName('FECAASS').VALUE := DMAF.cdsWork1.FieldByName('FECAASS').Value;
   DMAF.CDSACTFIJ.FieldByName('FECMMSS').VALUE := DMAF.cdsWork1.FieldByName('FECMMSS').Value;
End;

Procedure TFMaestro.GeneraAcfRefor;
Begin
   If dbeRefor.Text <> 'R' Then
      DMAF.cdsActFij.FieldByName('Acfrefor').Value := '00';

   If dbeRefor.Text = 'R' Then
   Begin
   // busca # de secuencia ACFREFOR
      xSQL := 'SELECT ACFREFOR FROM ACF201 '
         + 'WHERE CIAID=''' + dblcCIA.Text + ''' and '
         + 'TACFID=''' + dbeTipAct.Text + ''' and '
         + 'ARTCODBAR=''' + dbeBarra.Text + ''' '
         + ' ORDER BY ACFREFOR';
      DMAF.cdsWORK2.CLOSE;
      DMAF.cdsWORK2.DataRequest(xSQL);
      DMAF.cdsWORK2.OPEN;

      While Not DMAF.cdsWORK2.Eof Do
      Begin
         WGuardavalor := DMAF.cdsWork2.FieldByName('ACFREFOR').Value;
         DMAF.cdsWork2.Next;
      End;

      xNumero := STRtoInt(WGuardaValor);
      XNumero := XNumero + 1;
      If XNumero < 10 Then
         DMAF.cdsActFij.FieldByName('Acfrefor').Value := '0' + INTTOSTR(XNumero)
      Else
         DMAF.cdsActFij.FieldByName('Acfrefor').Value := INTTOSTR(XNumero);
      DMAF.cdsWork2.Close;
   End;
End;

Procedure TFMaestro.GeneraDepre;
Var
   xSQL, xAAMM, xDD: String;
Begin

   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      xSQL := 'SELECT * FROM TGE114 WHERE FECHA ='
         + 'DATE(' + '''' + FORMATDATETIME('YYYY-MM-DD', dbdtpFIniDep.DATE) + '''' + ')';
   End;
   If (SRV_D = 'ORACLE') Then
   Begin
      xSQL := 'SELECT * FROM TGE114 WHERE FECHA ='
         + 'TO_DATE(' + '''' + FORMATDATETIME(DMAF.wFormatFecha, dbdtpFIniDep.DATE) + '''' + ')';
   End;
   DMAF.cdsWork1.Close;
   DMAF.cdsWork1.datarequest(xSQL);
   DMAF.cdsWork1.OPEN;

   If DMAF.cdsWork1.RecordCount > 0 Then
      xAAMM := DMAF.cdsWork1.FieldByName('FECANO').AsString + DMAF.cdsWork1.FieldByName('FECMES').AsString
   Else
   Begin
      xDD := DateToStr(dbdtpFIniDep.DATE);
      xAAMM := Copy(xDD, 7, 4) + Copy(xDD, 4, 2);
   End;
//
   wSQL := 'select * FROM ACF204 '
      + 'WHERE CIAID=''' + DMAF.cdsActFij.FieldByName('CIAID').AsString + ''' and '
      + 'TACFID=''' + DMAF.cdsActFij.FieldByName('TACFID').AsString + ''' and '
      + 'ARTCODBAR=''' + DMAF.cdsActFij.FieldByName('ARTCODBAR').AsString + ''' and '
      + 'DEPFLAGREF=''' + DMAF.cdsActFij.FieldByName('AcfFlagRef').AsString + ''' and '
      + 'ACFREFOR=''' + DMAF.cdsActFij.FieldByName('AcFRefor').AsString + ''' and '
      + 'DEPFLAGPRO=''P''';
   ;
   DMAF.cdsDepre.Close;
   DMAF.cdsDepre.DataRequest(wSQL);

   Try
      DMAF.cdsDepre.open;
   Except
   End;

//fin  agregacion por anax
   If DMAF.cdsDepre.recorDcount >= 1 Then
      exit;
   If DMAF.cdsActFij.FieldByName('AcfFlagRef').AsString = '' Then
   Begin
      wSQL := 'DELETE FROM ACF204 '
         + 'WHERE CIAID=''' + DMAF.cdsActFij.FieldByName('CIAID').AsString + ''' and '
         + 'TACFID=''' + DMAF.cdsActFij.FieldByName('TACFID').AsString + ''' and '
         + 'ARTCODBAR=''' + DMAF.cdsActFij.FieldByName('ARTCODBAR').AsString + ''' and '
         + 'ACFREFOR=''' + DMAF.cdsActFij.FieldByName('AcFRefor').AsString + '''';
   End
   Else
   Begin
      wSQL := 'DELETE FROM ACF204 '
         + 'WHERE CIAID=''' + DMAF.cdsActFij.FieldByName('CIAID').AsString + ''' and '
         + 'TACFID=''' + DMAF.cdsActFij.FieldByName('TACFID').AsString + ''' and '
         + 'ARTCODBAR=''' + DMAF.cdsActFij.FieldByName('ARTCODBAR').AsString + ''' and '
         + 'DEPFLAGREF=''' + DMAF.cdsActFij.FieldByName('AcfFlagRef').AsString + ''' and '
         + 'ACFREFOR=''' + DMAF.cdsActFij.FieldByName('AcFRefor').AsString + '''';
   End;
   DMAF.cdsDepre.Close;
   DMAF.cdsDepre.DataRequest(wSQL);

   Try
      DMAF.cdsDepre.Execute;
   Except
   End;

   DMAF.cdsDepre.DataRequest('select * from  ACF204 Where CIAID=''ZZ'' ');
   DMAF.cdsDepre.Open; // Adiciona Depreciación

   While Not DMAF.cdsUdep.Eof Do
   Begin
      DMAF.cdsDepre.Insert; // Adiciona Depreciación
      DMAF.cdsDepre.FieldByName('CiaId').Value := DMAF.cdsActFij.FieldByName('CiaId').AsString;
      DMAF.cdsDepre.FieldByName('AcFid').Value := DMAF.cdsActFij.FieldByName('AcFid').AsString;
      DMAF.cdsDepre.FieldByName('TacFid').Value := DMAF.cdsActFij.FieldByName('TacFid').AsString;
      DMAF.cdsDepre.FieldByName('CuentaId').Value := DMAF.cdsActFij.FieldByName('CuentaId').asstring;
      DMAF.cdsDepre.FieldByName('ARTCODBAR').Value := DMAF.cdsActFij.FieldByName('ARTCODBAR').AsString;
      DMAF.cdsDepre.FieldByName('DepValHist').Value := strtofloat(dbevalomn.text);
      DMAF.cdsDepre.FieldByName('DEPNETOAJU').Value := strtofloat(dbevalomn.text);
      DMAF.cdsDepre.FieldByName('AcfValOMN').Value := strtofloat(dbevalomn.text);
      DMAF.cdsDepre.FieldByName('DepValAjus').Value := strtofloat(dbevalomn.text);
      DMAF.cdsDepre.FieldByName('DepAcuHist').Value := 0;
      DMAF.cdsDepre.FieldByName('DepAcuAjus').Value := 0;
      DMAF.cdsDepre.FieldByName('AcfFecAdq').Value := dbdtpFecAdqui.date;
      DMAF.cdsDepre.FieldByName('AcfDes').Value := DMAF.cdsActFij.FieldByName('AcfDes').AsString;
      DMAF.cdsDepre.FieldByName('DepFlagPro').Value := 'X';
      DMAF.cdsDepre.FieldByName('DepFlagRef').Value := DMAF.cdsActFij.FieldByName('AcfFlagRef').asstring;
      DMAF.cdsDepre.FieldByName('CCosId').Value := DMAF.cdsActFij.FieldByName('CCosId').AsString;
      DMAF.cdsDepre.FieldByName('DepFecha').Value := DMAF.cdsActFij.FieldByName('AcfFiniDep').AsDateTime;
      DMAF.cdsDepre.FieldByName('DepNoMeses').Value := 1; // AMMT 08/07/2002
      DMAF.cdsDepre.FieldByName('LocId').Value := DMAF.cdsActFij.FieldByName('LocId').AsString;
      DMAF.cdsDepre.FieldByName('Piso').Value := DMAF.cdsActFij.FieldByName('Piso').AsString;
      DMAF.cdsDepre.FieldByName('Area').Value := DMAF.cdsActFij.FieldByName('Area').AsString;
      DMAF.cdsDepre.FieldByName('AMBCOD').Value := DMAF.cdsActFij.FieldByName('AMBCOD').AsString;
//obc      DMAF.cdsDepre.FieldByName('UbicId').Value    :=DMAF.cdsActFij.FieldByName('UbicId').AsString;
      DMAF.cdsDepre.FieldByName('AcfRefor').Value := DMAF.cdsActFij.FieldByName('AcfRefor').AsString;
      DMAF.cdsDepre.FieldByName('DepCod').Value := DMAF.cdsUdep.FieldByName('DepCod').AsString;
      DMAF.cdsDepre.FieldByname('FAPERIODO').Value := xAAMM;
      DMAF.cdsDepre.FieldByName('TACFDEPREC').Value := xPorcentaje;
      DMAF.cdsDepre.FieldByName('ACFREIACUM').Asfloat := DMAF.cdsActFij.FieldByName('ACFVALOMN').Asfloat;
      DMAF.cdsDepre.FieldByName('ACFFINIDEP').Asdatetime := DMAF.cdsActFij.FieldByName('ACFFINIDEP').Asdatetime;
      DMAF.cdsDepre.FieldByName('RECIBEID').AsString := DMAF.cdsResponsable.FieldByName('RECIBEID').AsString;
      DMAF.cdsDepre.FieldByName('RECIBENOM').AsString := DMAF.cdsResponsable.FieldByName('RECIBENOM').AsString;
      DMAF.cdsDepre.FieldByName('ACFREIPERI').Asfloat := 0;

      cdsPost(DMAF.cdsDepre);

      DMAF.cdsUdep.Next;
   End;
   DMAF.cdsUdep.first;
End;

Procedure TFMaestro.RepiteVeces;
Var
   nveces, xLen, xLen2, xLenCodBar: integer;
   wcia, wFlagComp, wAcfidComp, wUbica, wLocalidad, wPiso, wArea, wAmbiente, wMaterial, wTipAdqui,
      wTipAct, wMarca, wModelo, wSerie, wTipDoc, wSerieDoc, wNoDoc, wCCosId,
      wProveedor, wCuenta, wMoneda, wDes, wDesAmp, wMedidas, wColor: String;
   wVida, wCambio, wValomo, wValoMN, wValoME: double;
   wFecRecep, wFecIns, wFecAdqui, wFiniDep: TDate;
   wGarantia, i, n: Integer;
   xFNum: Boolean;
   xTemp, xSerie: String;
Begin
   nveces := 0;
   XNumero := STRtoInt(DMAF.cdsActfij.FieldByName('Acfid').AsString);
   xLen := Length(DMAF.cdsActfij.FieldByName('Acfid').AsString);
   XNumeroCodBar := STRtoInt(DMAF.cdsActfij.FieldByName('ARTCODBAR').AsString);
   xLenCodBar := Length(DMAF.cdsActfij.FieldByName('ARTCODBAR').AsString);

//Guarda data
   wCia := DMAF.cdsActFij.FieldByName('CiaId').AsString;
   wFlagComp := DMAF.cdsActFij.FieldByName('AcFFlaComp').AsString;
   wAcfidComp := DMAF.cdsActFij.FieldByName('AcFidComp').AsString;
   wUbica := DMAF.cdsActFij.FieldByName('Ubicid').AsString;
   wLocalidad := DMAF.cdsActFij.FieldByName('LocId').AsString;
   wPiso := DMAF.cdsActFij.FieldByName('PISO').AsString;
   wArea := DMAF.cdsActFij.FieldByName('AREA').AsString;
   wAmbiente := DMAF.cdsActFij.FieldByName('AMBCOD').AsString;
   wMaterial := DMAF.cdsActFij.FieldByName('MaterialId').AsString;
   wTipAdqui := DMAF.cdsActFij.FieldByName('AcfTipAdqu').AsString;
   wTipAct := DMAF.cdsActFij.FieldByName('TacFid').AsString;
   wMarca := DMAF.cdsActFij.FieldByName('AcFMarca').AsString;
   wModelo := DMAF.cdsActFij.FieldByName('AcFModelo').AsString;
   wSerie := DMAF.cdsActFij.FieldByName('AcfSerie').AsString;
   wColor := DMAF.cdsActFij.FieldByName('ACFCOLOR').AsString;
   wTipDoc := DMAF.cdsActFij.FieldByName('DocId').AsString;
   wSerieDoc := DMAF.cdsActFij.FieldByName('AcFSerieDo').AsString;
   wNoDoc := DMAF.cdsActFij.FieldByName('AcFNoDoc').AsString;
   wCCosId := DMAF.cdsActFij.FieldByName('CCosId').AsString;
   wProveedor := DMAF.cdsActFij.FieldByName('Prov').AsString;
   wCuenta := DMAF.cdsActFij.FieldByName('CuentaId').AsString;
   wMoneda := DMAF.cdsActFij.FieldByName('TMonid').AsString;
   wDes := DMAF.cdsActFij.FieldByName('AcfDes').AsString;
   wDesAmp := DMAF.cdsActFij.FieldByName('ACFDESL').AsString;
   wVida := DMAF.cdsActFij.FieldByName('TacfVida').AsInteger;
   wCambio := DMAF.cdsActFij.FieldByName('AcFCambio').AsFloat;
   wValomo := DMAF.cdsActFij.FieldByName('AcFValoMO').AsFloat;
   wValoMN := DMAF.cdsActFij.FieldByName('AcFValoMN').AsFloat;
   wValoME := DMAF.cdsActFij.FieldByName('AcFValoME').AsFloat;
   wFecRecep := DMAF.cdsActFij.FieldByName('AcFFecRece').AsDateTime;
   wFecIns := DMAF.cdsActFij.FieldByName('AcFFecIns').AsDateTime;
   wFecAdqui := DMAF.cdsActFij.FieldByName('AcFFecAdq').AsDateTime;
   wFiniDep := DMAF.cdsActFij.FieldByName('AcFFiniDep').AsDateTime;
   wMedidas := DMAF.cdsActFij.FieldByName('ACFMEDIDA').AsString;
   wGarantia := DMAF.cdsActFij.FieldByName('GARANTIA').AsInteger;

// repite  x-veces
   While xveces > nveces Do
   Begin
      DMAF.cdsActFij.Append; // Adiciona Maestro
      DMAF.cdsActFij.FieldByName('CiaId').value := wCia;
      DMAF.cdsActFij.FieldByName('AcFFlaComp').value := wFlagComp;
      DMAF.cdsActFij.FieldByName('AcFidComp').Value := wAcfidComp;
      DMAF.cdsActFij.FieldByName('Ubicid').value := wUbica;
      DMAF.cdsActFij.FieldByName('LocId').value := wLocalidad;
      DMAF.cdsActFij.FieldByName('PISO').value := wPiso;
      DMAF.cdsActFij.FieldByName('AREA').value := wArea;
      DMAF.cdsActFij.FieldByName('AMBCOD').value := wAmbiente;
      DMAF.cdsActFij.FieldByName('MaterialId').value := wMaterial;
      DMAF.cdsActFij.FieldByName('AcfTipAdqu').value := wTipAdqui;
      DMAF.cdsActFij.FieldByName('TacFid').Value := wTipAct;
      DMAF.cdsActFij.FieldByName('AcFMarca').Value := wMarca;
      DMAF.cdsActFij.FieldByName('AcFModelo').Value := wModelo;
      DMAF.cdsActFij.FieldByName('ACFCOLOR').Value := wColor;
      DMAF.cdsActFij.FieldByName('DocId').Value := wTipDoc;
      DMAF.cdsActFij.FieldByName('AcFSerieDo').value := wSerieDoc;
      DMAF.cdsActFij.FieldByName('AcFNoDoc').value := wNoDoc;
      DMAF.cdsActFij.FieldByName('CCosId').value := wCCosId;
      DMAF.cdsActFij.FieldByName('Prov').value := wProveedor;
      DMAF.cdsActFij.FieldByName('CuentaId').value := wCuenta;
      DMAF.cdsActFij.FieldByName('TMonid').value := wMoneda;
      DMAF.cdsActFij.FieldByName('AcfDes').value := wDes;
      DMAF.cdsActFij.FieldByname('ACFDESL').value := wDesAmp;
      DMAF.cdsActFij.FieldByName('TacfVida').value := wVida;
      DMAF.cdsActFij.FieldByName('AcFCambio').value := wCambio;
      DMAF.cdsActFij.FieldByName('AcFValoMO').value := wValomo;
      DMAF.cdsActFij.FieldByName('AcFValoMN').value := wValoMN;
      DMAF.cdsActFij.FieldByName('AcFValoME').value := wValoME;
      DMAF.cdsActFij.FieldByName('AcFFecRece').Value := wFecRecep;
      DMAF.cdsActFij.FieldByName('AcFFecIns').Value := wFecIns;
      DMAF.cdsActFij.FieldByName('AcFFecAdq').Value := wFecAdqui;
      DMAF.cdsActFij.FieldByName('AcFFiniDep').Value := wFiniDep;
      DMAF.cdsActFij.FieldByName('AcFRefor').Value := '00';
      DMAF.cdsActFij.FieldByName('AcFHReg').Value := Time;
      DMAF.cdsActFij.FieldByName('AcFFReg').Value := Date;
      DMAF.cdsActFij.FieldByName('AcFUser').Value := DMAF.wUsuario;
      DMAF.cdsActFij.FieldByName('AcFFlagAct').Value := 'A';
      DMAF.cdsActFij.FieldByName('ACFMEDIDA').Value := wMedidas;
      DMAF.cdsActFij.FieldByName('GARANTIA').Value := wGarantia;
      DMAF.cdsActFij.FieldByName('ACFDESACMO').Value := '.';

      If DMAF.wModo = 'Z' Then
         DMAF.cdsActFij.FieldByName('ARTID').Value := DMAF.cdsCompras.FieldByName('ARTID').AsString;

      If DMAF.cdsActFij.fieldbyname('ACFDESL').AsString = '' Then
         DMAF.cdsActFij.fieldbyname('ACFDESL').AsString := ' ';

      DatosFecha;

      xNumero := xNumero + 1;
      xNumeroCodBar := xNumeroCodBar + 1;
      xTemp := '';
      xSerie := '';
      For i := Length(wSerie) Downto 1 Do
      Begin

         xFNum := False;
         For n := 0 To 9 Do
         Begin
            If Pos(IntToStr(n), Copy(wSerie, i, 1)) > 0 Then
            Begin
               xFNum := True;
               break
            End;
         End;
         If Not xFNum Then
         Begin
            xTemp := Copy(wSerie, 1, i);
            xSerie := Copy(wSerie, i + 1, Length(wSerie) - i);
            Break;
         End
         Else
         Begin
            xTemp := '';
            xSerie := wSerie;
         End;

      End;

      xLen2 := Length(xSerie);

      DMAF.cdsActFij.FieldByName('Acfid').Value := DMAF.StrZero(xNumero, xLen);
      DMAF.cdsActFij.FieldByName('ArtCodBar').Value := DMAF.StrZero(xNumeroCodBar, xLenCodBar);

      If DMAF.wModo = 'Z' Then
      Begin
         DMAF.cdsQry3.Next;
         DMAF.cdsActFij.FieldByName('ACFSERIE').Value := DMAF.cdsQry3.FieldByName('ACFSERIE').AsString;
      End;

      If DMAF.cdsActFij.FieldByName('ACFSERIE').AsString = '' Then
      Begin

         If xSerie <> '' Then
            DMAF.cdsActFij.FieldByName('AcfSerie').Value := xTemp + DMAF.StrZero(StrToInt(xSerie) + 1, xLen2)
         Else
            DMAF.cdsActFij.FieldByName('AcfSerie').Value := wSerie;

      End;

      wSerie := DMAF.cdsActFij.FieldByName('AcfSerie').AsString;
     //GeneraDepre;

      cdsPost(DMAF.cdsActFij);
//     DMAF.cdsActFij.DataRequest('SElect * from ACF201'); // agregado por ana
      DMAF.ControlTran; // graba regs.original/y duplicados si los hay
      If DMAF.wTipoAdicion = 'xFiltro' Then
      Begin
         DMAF.ActualizaFiltro(Mant2, DMAF.cdsActFij, 'A');
      End;

      nveces := nveces + 1;
   End;
End;

Procedure TFMaestro.FiltraOrdena;
Begin
// filtra y ordena (recibe variables: xFiltro y xOrden)
   Screen.Cursor := CrHourGlass;
   xSQL := 'Select * from ACF201';

   If length(xFiltro) > 0 Then xSQL := xSQL + ' where ' + xFiltro;
   If length(xOrden) > 0 Then xSQL := xSQL + ' order by ' + xOrden;

   If xcds = '1' Then
   Begin
      DMAF.cdsActFij.Close;
      DMAF.cdsActFij.DataRequest(xSQL);
      DMAF.cdsActFij.Open;
   End
   Else
      If xcds = '2' Then
      Begin
         DMAF.cdsActFij2.Close;
         DMAF.cdsActFij2.DataRequest(xSQL);
         DMAF.cdsActFij2.Open;
      End
      Else
         If xcds = '3' Then
         Begin
            DMAF.cdsActFij3.Close;
            DMAF.cdsActFij3.DataRequest(xSQL);
            DMAF.cdsActFij3.Open;
         End;
   Screen.Cursor := CrDefault;

End;

Procedure TFMaestro.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   xCrea := true;

   xxflag := '1';
   DMAF.cdsActFij.CancelUpdates;
   xxflag := '0';
   If DMAF.cdsTraslado.Active = True Then DMAF.cdsTraslado.CancelUpdates;
   If DMAF.cdsRefor.Active = True Then DMAF.cdsRefor.CancelUpdates;
   If DMAF.cdsActFij3.Active = True Then DMAF.cdsActFij3.CancelUpdates;
   If DMAF.cdsAFCC.Active = True Then DMAF.cdsAFCC.CancelUpdates;
   DMAF.cdsDepre.Close;
//
   dbgTraslado.Enabled := True;
//   pnlActTraslado.Visible:=False;
   If DMAF.cdsTraslado.Active Then
      If DMAF.cdsTraslado.IndexName = 'XXX' Then
         DMAF.cdsTraslado.DeleteIndex('XXX');
//
   DMAF.cdsTraslado.Close;
   DMAF.cdsActFij3.Close;
   DMAF.cdsAFCC.Close;

   DMAF.cdsTrasPen.Filtered := False;
   DMAF.cdsTrasPen.Filter := '';
   DMAF.cdsTrasPen.Close;

  // FMaestro.ResetIme;
   FMaestro.Free;
End;

Procedure TFMaestro.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFMaestro.LlenaCabeceras;
Begin
//   Sólo x Modificación (No Adición) llena datos para cabeceras

   edtCia1.Text := dblcCia.Value; // Reformas
   edtCiaD1.Text := edtCiaDes.Text;
   edtAct1.Text := dbeBarra.Text;
   edtActD1.Text := dblcDes.Text;
   edtTip1.Text := dbeTipAct.text;
   edtTipD1.Text := edtTipoActDes.Text;

   edtLoc1.Text := dblcLocalidad.Text;
   edtLocD1.Text := edtLocalidadDes.Text;
   edtPiso1.Text := dblcPiso.Text;
   edtPisoD1.Text := edtPisoDes.Text;
   edtArea1.Text := dblcArea.Text;
   edtAreaD1.Text := edtAreaDes.Text;
   edtAmbiente1.Text := dblcAmbiente.Text;
   edtAmbienteD1.Text := edtAmbienteDes.Text;
   edtCCos1.Text := dblcdCCosId.Text;
   edtCCosD1.Text := edtCCostoDes.Text;
   edtResponsable1.Text := edtResponsableId.Text;
   edtResponsableD1.Text := dblcResponsable.Text;

   edtCia2.Text := dblcCia.Value; // Distribución de Depreciación
   edtCiaD2.Text := edtCiaDes.Text;
   edtAct2.Text := dbeBarra.Text;
     //INICIO HPP_201107_ACF
   edtCodigoBarras_1.Text := dbeCodigoBarra.Text;
     //FIN HPP_201107_ACF
   edtActD2.Text := dblcDes.Text;
   edtTip2.Text := dbeTipAct.text;
   edtTipD2.Text := edtTipoActDes.Text;

   edtLoc2.Text := dblcLocalidad.Text;
   edtLocD2.Text := edtLocalidadDes.Text;
   edtPiso2.Text := dblcPiso.Text;
   edtPisoD2.Text := edtPisoDes.Text;
   edtArea2.Text := dblcArea.Text;
   edtAreaD2.Text := edtAreaDes.Text;
   edtAmbiente2.Text := dblcAmbiente.Text;
   edtAmbienteD2.Text := edtAmbienteDes.Text;
   edtCCos2.Text := dblcdCCosId.Text;
   edtCCosD2.Text := edtCCostoDes.Text;
   edtResponsable2.Text := edtResponsableId.Text;
   edtResponsableD2.Text := dblcResponsable.Text;

   edtCia3.Text := dblcCia.Value; // Activos Compuestos
   edtCiaD3.Text := edtCiaDes.Text;
   edtAct3.Text := dbeBarra.Text;
     //INICIO HPP_201107_ACF
   edtCodigoBarras_3.Text := dbeCodigoBarra.Text;
     //FIN HPP_201107_ACF
   edtActD3.Text := dblcDes.Text;
   edtTip3.Text := dbeTipAct.text;
   edtTipD3.Text := edtTipoActDes.Text;

   edtLoc3.Text := dblcLocalidad.Text;
   edtLocD3.Text := edtLocalidadDes.Text;
   edtPiso3.Text := dblcPiso.Text;
   edtPisoD3.Text := edtPisoDes.Text;
   edtArea3.Text := dblcArea.Text;
   edtAreaD3.Text := edtAreaDes.Text;
   edtAmbiente3.Text := dblcAmbiente.Text;
   edtAmbienteD3.Text := edtAmbienteDes.Text;
   edtCCos3.Text := dblcdCCosId.Text;
   edtCCosD3.Text := edtCCostoDes.Text;
   edtResponsable3.Text := edtResponsableId.Text;
   edtResponsableD3.Text := dblcResponsable.Text;

   edtCia4.Text := dblcCia.Value; // Reformas
   edtCiaD4.Text := edtCiaDes.Text;
   edtAct4.Text := dbeBarra.Text;
     //INICIO HPP_201107_ACF
   edtCodigoBarras_4.Text := dbeCodigoBarra.Text;
     //FIN HPP_201107_ACF
   edtActD4.Text := dblcDes.Text;
   edtTip4.Text := dbeTipAct.text;
   edtTipD4.Text := edtTipoActDes.Text;

   edtLoc4.Text := dblcLocalidad.Text;
   edtLocD4.Text := edtLocalidadDes.Text;
   edtPiso4.Text := dblcPiso.Text;
   edtPisoD4.Text := edtPisoDes.Text;
   edtArea4.Text := dblcArea.Text;
   edtAreaD4.Text := edtAreaDes.Text;
   edtAmbiente4.Text := dblcAmbiente.Text;
   edtAmbienteD4.Text := edtAmbienteDes.Text;
   edtCCos4.Text := dblcdCCosId.Text;
   edtCCosD4.Text := edtCCostoDes.Text;
   edtResponsable4.Text := edtResponsableId.Text;
   edtResponsableD4.Text := dblcResponsable.Text;

   edtCia5.Text := dblcCia.Value; // Traslados
   edtCiaD5.Text := edtCiaDes.Text;
   edtAct5.Text := dbeBarra.Text;
     //INICIO HPP_201107_ACF
   edtCodigoBarras_5.Text := dbeCodigoBarra.Text;
     //FIN HPP_201107_ACF
   edtActD5.Text := dblcDes.Text;
   edtTip5.Text := dbeTipAct.text;
   edtTipD5.Text := edtTipoActDes.Text;
//     edtUbi5.Text :=dblcUbica.Text;
// obc     edtUbiD5.Text:=edtUbicacionDes.Text;
   edtLoc5.Text := dblcLocalidad.Text;
   edtLocD5.Text := edtLocalidadDes.Text;
   edtPiso5.Text := dblcPiso.Text;
   edtPisoD5.Text := edtPisoDes.Text;
   edtArea5.Text := dblcArea.Text;
   edtAreaD5.Text := edtAreaDes.Text;
   edtAmbiente5.Text := dblcAmbiente.Text;
   edtAmbienteD5.Text := edtAmbienteDes.Text;
   edtCCos5.Text := dblcdCCosId.Text;
   edtCCosD5.Text := edtCCostoDes.Text;
   edtResponsable5.Text := edtResponsableId.Text;
   edtResponsableD5.Text := dblcResponsable.Text;

   edtCia6.Text := dblcCia.Value; // Desactivación
   edtCiaD6.Text := edtCiaDes.Text;
   edtAct6.Text := dbeBarra.Text;
     //INICIO HPP_201107_ACF
   edtCodigoBarras_6.Text := dbeCodigoBarra.Text;
     //FIN HPP_201107_ACF
   edtActD6.Text := dblcDes.Text;
   edtTip6.Text := dbeTipAct.text;
   edtTipD6.Text := edtTipoActDes.Text;

   edtLoc6.Text := dblcLocalidad.Text;
   edtLocD6.Text := edtLocalidadDes.Text;
   edtPiso6.Text := dblcPiso.Text;
   edtPisoD6.Text := edtPisoDes.Text;
   edtArea6.Text := dblcArea.Text;
   edtAreaD6.Text := edtAreaDes.Text;
   edtAmbiente6.Text := dblcAmbiente.Text;
   edtAmbienteD6.Text := edtAmbienteDes.Text;
   edtCCos6.Text := dblcdCCosId.Text;
   edtCCosD6.Text := edtCCostoDes.Text;
   edtResponsable6.Text := edtResponsableId.Text;
   edtResponsableD6.Text := dblcResponsable.Text;

//     edtMotivo.enabled:=False;
   pnlCCosto.Visible := False;
   pnlCCosto.Enabled := False;
//     dbeVida.enabled:=false;
End;

Procedure TFMaestro.ConsistenciaDatos;
Begin
   Flagerr := 0;

   If DMAF.wmodo = 'A' Then
   Begin

// Compañía
      If Length(dblcCia.Text) = 0 Then
      Begin
         dblcCia.setfocus;
         showmessage('Ingrese codigo de compañía');
         Flagerr := 1;
         exit;
      End;

      If Length(edtCiaDes.Text) = 0 Then
      Begin
         dblcCia.setfocus;
         showmessage('Codigo de compañía no existe');
         Flagerr := 1;
         exit;
      End;

// Denominacion
      If length(dblcDes.Text) = 0 Then
      Begin
         dblcDes.setfocus;
         Showmessage('Denominacion invalida');
         Flagerr := 1;
         exit;
      End;

// Reforma
      dbeReforExit(Self);
      If Flagerr = 1 Then exit;

// flag Activo compuesto
      dbeFlagCompexit(self);

   End;

   dblcMaterialexit(self);
   If Flagerr = 1 Then exit;

   If DMAF.wmodo = 'A' Then
   Begin

// Codigo barras
      dbeBarraexit(self);
      If Flagerr = 1 Then exit;

// Clase de Activo
      dblcTipAdquiexit(self);
      If Flagerr = 1 Then exit;

// Estado
      dblcEstadoexit(self);
      If Flagerr = 1 Then exit;

// Localidad
      If length(dblcLocalidad.Text) = 0 Then
      Begin
         ShowMessage('Ingrese Localidad');
         dblcLocalidad.SetFocus;
         Flagerr := 1;
         exit;
      End;

      If length(edtLocalidadDes.Text) = 0 Then
      Begin
         ShowMessage('Localidad invalida');
         dblcLocalidad.SetFocus;
         Flagerr := 1;
         exit;
      End;

      Filtracds(DMAF.cdsPiso, 'SELECT * FROM ACF121 where LocId=' + '''' + dblcLocalidad.Text + '''');

// Piso
      If length(dblcPiso.Text) = 0 Then
      Begin
         ShowMessage('Ingrese Piso');
         dblcPiso.SetFocus;
         Flagerr := 1;
         exit;
      End;

      xCondicion := 'Piso=' + '''' + dblcPiso.Text + '''';
      edtPisoDes.Text := BuscaDescripcion(DMAF.cdsPiso, xCondicion, 'PISODES');
      edtPisoDesN.Text := edtPisoDes.Text;

      If length(edtPisoDes.Text) = 0 Then
      Begin
         ShowMessage('Piso invalido');
         dblcPiso.SetFocus;
         Flagerr := 1;
         exit;
      End;

      Filtracds(DMAF.cdsArea, 'SELECT * FROM ACF122 WHERE ' +
         ' LOCID=' + quotedstr(dblcLocalidad.Text) +
         ' AND PISO=' + quotedstr(dblcPiso.Text));

// Area
      If length(dblcArea.Text) = 0 Then
      Begin
         ShowMessage('Ingrese Area');
         dblcArea.SetFocus;
         Flagerr := 1;
         exit;
      End;

      xCondicion := 'Area=' + '''' + dblcArea.Text + '''';
      edtAreaDes.Text := BuscaDescripcion(DMAF.cdsArea, xCondicion, 'AREADES');
      edtAreaDesN.Text := edtAreaDes.Text;

      If length(edtAreaDes.Text) = 0 Then
      Begin
         ShowMessage('Area invalida');
         dblcArea.SetFocus;
         Flagerr := 1;
         exit;
      End;

      Filtracds(DMAF.cdsAmbiente, 'SELECT * FROM ACF123 WHERE ' +
         ' LOCID=' + quotedstr(dblcLocalidad.Text) +
         ' AND PISO=' + quotedstr(dblcPiso.Text) +
         ' AND AREA=' + quotedstr(dblcArea.Text));
      //   + ' AND CIAID='+quotedstr(dblcCia.Text));

// Ambiente

      If length(dblcAmbiente.Text) = 0 Then
      Begin
         ShowMessage('Ingrese Ambiente');
         dblcAmbiente.SetFocus;
         Flagerr := 1;
         exit;
      End;

      xCondicion := 'AMBCOD=' + '''' + dblcAmbiente.Text + '''';
      edtAmbienteDes.Text := BuscaDescripcion(DMAF.cdsAmbiente, xCondicion, 'AMBDES');

      If length(edtAmbienteDes.Text) = 0 Then
      Begin
         ShowMessage('Ambiente invalido');
         dblcAmbiente.SetFocus;
         Flagerr := 1;
         exit;
      End;

// Responsable
      dblcResponsableexit(self);
      If Flagerr = 1 Then exit;

   End;

// Proveedor
   dblcdProveedorexit(self);
   If Flagerr = 1 Then exit;

// Documento
   dblcTipDocExit(Self);
   If Flagerr = 1 Then exit;

// Moneda
   dblcMonedaexit(self);
   If Flagerr = 1 Then exit;

// Tipo de Cambio
   dbeCambioexit(self);
   If Flagerr = 1 Then exit;

// Valor Original Moneda Original
   dbeValOMOexit(self);
   If Flagerr = 1 Then exit;

// Fecha de Adquisicion
   dbdtpFecAdquiExit(Self);
   If Flagerr = 1 Then exit;

// Fecha de Recepción
   dbdtpFecRecepExit(Self);
   If Flagerr = 1 Then exit;

// Fecha de Instalación
   dbdtpFecInsExit(Self);
   If Flagerr = 1 Then exit;

// reforma y repeticiones no son compatibles
   If dbeVeces.Enabled Then
      xveces := StrtoInt(dbeVeces.Text);

   If dbeRefor.Text = 'R' Then
      If xveces > 0 Then
      Begin
         showmessage('Repetición no se ejecuta en Reformas');
      End;
End;

Procedure TFMaestro.ConsistenciaDatos2;
Begin
{// Descripción
   If Length(dblcDes.Text)=0 then
   begin
      dblcDes.setfocus;
      showmessage('Ingrese Denominacion');
      exit;
   end;
}
// Descripción Ampliada
{obc   If Length(dbmDesAmp.Text)=0 then
   begin
      dbmDesAmp.setfocus;
      showmessage('Falta Descripción Ampliada');
   end;}
End;

Procedure TFMaestro.dbeTipActExit(Sender: TObject);
Var
   xCondicion: String;
Begin
{   if xCrea then exit;

   if DMAF.wModo='A' then
   begin
   // Calcula en Max Codigo de Activo
   xSQL:='Select MAX( ACFID ) ACFID from ACF201 '
       +'WHERE CIAID='+quotedstr(dblcCia.text)+' and TACFID='+quotedstr(dbeTipAct.text);
   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest( xSQL );
   DMAF.cdsQry.Open;
   if DMAF.cdsQry.recordcount=0 then
      dbeAcfid.text:=DMAF.StrZero( 1, DMAF.cdsQry.FieldByName('ACFID').Size )
   else
   begin
      dbeAcfid.text:=DMAF.StrZero( DMAF.cdsQry.FieldByName('ACFID').AsInteger+1, Length( DMAF.cdsQry.FieldByName('ACFID').AsString )   );
   end;
   DMAF.cdsActFij.FieldByName('ACFID').Asstring :=dbeAcfid.text;
   end;

   xCondicion:='CIAID='''+dblcCia.Text+''' and TAcFId='''+dbeTipAct.Text+'''';
   edtTipoActDes.Text:=DMAF.DisplayDescrip('dspTGE','ACF101','*',xCondicion,'TAcFDes');

   xPorcentaje:=DMAF.cdsQry.FieldByName('TACFDEPREC').AsFloat;

//   X ADICION: Toma Cuenta y Vida útil de Referencia TIPO DE ACTIVO
   if (DMAF.cdsActFij.State<>dsEdit) and (Length(edtTipoActDes.Text)<>0) then
   begin
      dblcdCuenta.Text:=DMAF.cdsTipAct.FieldByname('CuentaId').Value;
      DMAF.cdsActFij.FieldByName('CuentaId').Value:= DMAF.cdsTipAct.FieldByname('CuentaId').AsString;
      xCondicion := 'CuentaId='+''''+dblcdCuenta.Text+'''';
      edtCuentaDes.Text:=DMAF.DisplayDescrip('dspTGE','TGE202','*',xCondicion,'CtaAbr');
      dbeVida.Text:=DMAF.cdsTipAct.FieldByname('TAcFVida').AsString;
      DMAF.cdsActFij.FieldByName('TAcFVida').Value:= DMAF.cdsTipAct.FieldByname('TacFVida').AsInteger;
   end;

//  X MODIFICACION: Toma CUENTA y VIDA UTIL directamente
//  del Maestro de Activos y toma Descripcion de Cuenta de función
//  dblcdCuentaChange(Self) que se activa automáticamente al cambio.

   dbeFlagComp.enabled  :=True;
// obc   dblcubica.enabled    :=True;
   dblcLocalidad.enabled:=True;
//   dblcdCuenta.enabled  :=True;
   dblcPiso.enabled:=True;
   dblcArea.enabled:=True;
   dblcAmbiente.enabled:=True;
//   dblcdCCosId.enabled  :=True;
   dblcResponsable.enabled  :=True;
//   dbeVida.enabled      :=True;

//   if DMAF.wModo='A' then dbeAcFId.SetFocus;
}
End;

Procedure TFMaestro.bbtnOk4Click(Sender: TObject);
Begin
// Consistencia Traslados;
   ConsistenciaTraslado;

   If DMAF.cdsTraslado.state <> dsinsert Then
   Begin
      DMAF.cdsTraslado.edit;
   End;

   Screen.Cursor := CrHourGlass;

   DMAF.cdsTraslado.FieldByName('CiaId').Value := dblcCia.Text;
   DMAF.cdsTraslado.FieldByName('TAcFId').Value := dbeTipAct.Text;
   DMAF.cdsTraslado.FieldByName('AcFId').Value := dbeAcFid.Text;

   DMAF.cdsTraslado.FieldByName('TraGuia_R').Clear;
   DMAF.cdsTraslado.FieldByName('TranLocal').Value := edtLoc5.Text;
// obc   DMAF.cdsTraslado.FieldByName('TranUbica').Value:=edtUbi5.Text;
   DMAF.cdsTraslado.FieldByName('TranPiso').Value := edtPiso5.Text;
   DMAF.cdsTraslado.FieldByName('TranArea').Value := edtArea5.Text;
   DMAF.cdsTraslado.FieldByName('TranAMBCOD').Value := edtAmbiente5.Text;

   If edtCCos5.Text = '' Then
      DMAF.cdsTraslado.FieldByName('TranCCos').Clear
   Else
      DMAF.cdsTraslado.FieldByName('TranCCos').Value := edtCCos5.Text;

   DMAF.cdsTraslado.FieldByName('TraHReg').Value := Time;
   DMAF.cdsTraslado.FieldByName('TraFReg').Value := Date;
   DMAF.cdsTraslado.FieldByName('TraUser').Value := DMAF.wUsuario;
   DMAF.cdsTraslado.FieldByName('F_ULTIMO').AsString := 'S';
   DMAF.cdsTraslado.FieldByName('TRAESTADO').AsString := 'A';
   cdsPost(DMAF.cdsTraslado);

   DMAF.AplicaDatos(DMAF.cdsTraslado, 'TRASLADO'); // Adiciona Traslado

   DMAF.cdsActFij.edit;
   DMAF.cdsActFij.fieldbyname('TRAFECHA').AsDateTime := dbdtpTraslado.Date;
// obc   DMAF.cdsActFij.fieldbyname('UBICID').asstring    :=dblcUBICACIONN.Text;
   DMAF.cdsActFij.fieldbyname('CIAID').asstring := dblcCiaN.Text;
   DMAF.cdsActFij.fieldbyname('LOCID').asstring := dblcLOCALIDADN.Text;
   DMAF.cdsActFij.fieldbyname('PISO').asstring := dblcPisoN.Text;
   DMAF.cdsActFij.fieldbyname('AREA').asstring := dblcAreaN.Text;
   DMAF.cdsActFij.fieldbyname('AMBCOD').asstring := dblcAmbienteN.Text;
   DMAF.cdsActFij.fieldbyname('CCOSID').asstring := dblcdCCostoN.Text;
   DMAF.cdsActFij.fieldbyname('F_REPA').asstring := DMAF.cdstraslado.FieldByName('FPROVE').AsString;
   DMAF.cdsActFij.FieldByName('AcFHReg').Value := Time;
   DMAF.cdsActFij.FieldByName('AcFFReg').Value := Date;
   DMAF.cdsActFij.FieldByName('AcFUser').Value := DMAF.wUsuario;
   DMAF.cdsActFij.FieldByName('AcFEdita').Value := 'S';
   DMAF.cdsActFij.FieldByName('RECIBEID').Value := dbeRecibe.Text;
   DMAF.cdsActFij.FieldByName('RECIBENOM').Value := dbeRecibeDes.Text;
//   cdsPost( DMAF.cdsActFij );
//   DMAF.cdsActFij.DataRequest( 'SELECT * FROM ACF201 WHERE ACFID='''+dbeACFID.TEXT+'''' );
   DMAF.AplicaDatos(DMAF.cdsActFij, 'ACTFIJ'); // Actualiza Maestro
   If DMAF.wTipoAdicion = 'xFiltro' Then
   Begin
      DMAF.ActualizaFiltro(Mant2, DMAF.cdsActFij, 'M');
   End;

//   pnlActTraslado.Visible := False;
//   pnlActTraslado.Enabled := False;
   dbgTraslado.Enabled := True;
   dbgTraslado.Visible := True;
   pnlCabTraslado.Enabled := True;
   ActualizacabTraslados;
   Z2bbtnImprime.Enabled := True;

// obc   dblcUba.Enabled     :=False;
   dblcLocalidad.Enabled := False;
   dblcPiso.enabled := False;
   dblcArea.enabled := False;
   dblcAmbiente.enabled := False;
//   dblcdCCosId.Enabled   :=False;

   Screen.Cursor := CrDefault;
//   Showmessage('Traslado Aceptado');
   xTab5 := True;
End;

Procedure TFMaestro.ConsistenciaTraslado;
Begin

   If Length(dbedocmtoT.Text) = 0 Then
   Begin
      dbedocmtoT.SetFocus;
      showmessage('Ingrese Documento de Traslado');
      exit;
   End;

   If Length(dbdtpTraslado.Text) = 0 Then
   Begin
      dbdtpTraslado.SetFocus;
      showmessage('Ingrese Fecha de Traslado');
      exit;
   End;

   If dbdtpTraslado.Date < xFechaTmp Then
   Begin
      dbdtpTraslado.SetFocus;
      showmessage('Fecha de traslado No puede ser Menor a' + #13
         + 'Última Fecha de Traslado Registrada :' + DateTimeToStr(xFechaTmp));
      exit;
   End;

   If Length(dbeMotivo.Text) = 0 Then
   Begin
      dbeMotivo.SetFocus;
      showmessage('Ingrese Motivo de Traslado');
      exit;
   End;

   If pnlTra2.Enabled Then
   Begin

// obc      if Length(dblcUbicacionN.Text)=0 then
//      begin
//         dblcUbicacionN.SetFocus ;
//         showmessage('Falta Ubicación Nueva');
//      end;
//      if Length(edtUbicacionDesN.Text)=0 then
//      begin
//         dblcUbicacionN.SetFocus ;
//         showmessage('Ubicación no existe');
//      end;

      If Length(dblcCiaN.Text) = 0 Then
      Begin
         dblcCiaN.SetFocus;
         showmessage('Ingrese Compañia');
         exit;
      End;

      If Length(edtCiaDesN.Text) = 0 Then
      Begin
         dblcCiaN.SetFocus;
         showmessage('Compañia invalida');
         exit;
      End;

      If Length(dblcLocalidadN.Text) = 0 Then
      Begin
         dblcLocalidadN.SetFocus;
         showmessage('Ingrese Localidad');
         exit;
      End;

      If Length(edtLocalidadDesN.Text) = 0 Then
      Begin
         dblcLocalidad.SetFocus;
         showmessage('Localidad invalida');
         exit;
      End;

      If Length(dblcPisoN.Text) = 0 Then
      Begin
         dblcPisoN.SetFocus;
         showmessage('Ingrese Piso');
         exit;
      End;

      If Length(edtPisoDesN.Text) = 0 Then
      Begin
         dblcPiso.SetFocus;
         showmessage('Piso Invalido');
         exit;
      End;

      If Length(dblcAreaN.Text) = 0 Then
      Begin
         dblcAreaN.SetFocus;
         showmessage('Ingrese Area');
         exit;
      End;

      If Length(edtAreaDesN.Text) = 0 Then
      Begin
         dblcArea.SetFocus;
         showmessage('Area Invalida');
         exit;
      End;

      If Length(dblcAmbienteN.Text) = 0 Then
      Begin
         dblcAmbienteN.SetFocus;
         showmessage('Ingrese Ambiente');
         exit;
      End;

      If Length(edtAmbienteDesN.Text) = 0 Then
      Begin
         dblcAmbiente.SetFocus;
         showmessage('Ambiente invalido');
         exit;
      End;

      If Length(dblcdCCostoN.Text) = 0 Then
      Begin
         dblcdCCostoN.SetFocus;
         showmessage('Ingrese Centro de Costo');
         exit;
      End;

      If Length(edtCCosDes.Text) = 0 Then
      Begin
         dblcdCCostoN.SetFocus;
         showmessage('Centro de Costo invalido');
         exit;
      End;

   End;

   If Length(dbeAutoriza.Text) = 0 Then
   Begin
      dbeAutoriza.SetFocus;
      showmessage('Ingrese Autorizacion');
      exit;
   End;

   If Length(dbeRecibe.Text) = 0 Then
   Begin
      dbeRecibe.SetFocus;
      showmessage('Ingrese Cod.Recepcion');
      exit;
   End;

   If Length(dbeRecibeDes.Text) = 0 Then
   Begin
      dbeRecibeDes.SetFocus;
      showmessage('Ingrese Nombre de Recepcion');
      exit;
   End;
End;

//  Traslados

Procedure TFMaestro.btnActTrasladoClick(Sender: TObject);
Begin
   xTab5 := False;

   HabilitaEdicion(True);
   If dbgTraslado.DataSource.DataSet.RecordCount <> 0 Then
   Begin
      dbgTraslado.DataSource.DataSet.First;
      //Validación
      If DMAF.cdsTraslado.fieldbyname('TRAESTADO').AsString <> 'A' Then
         showmessage('Primero debe Aceptar el Último traslado registrado');
      //fin de Validación
      xFechaTmp := TDate(dbgTraslado.DataSource.DataSet.fieldbyname('TRAFECHA').asdatetime);
   End
   Else
      xFechaTmp := 0;

   dbgTraslado.Enabled := False;
   pnlCabTraslado.Enabled := False;
//   pnlActTraslado.Visible:=True;
//   pnlActTraslado.Enabled:=True;
   dbeRecibe.Enabled := False;
   QuitaFlagTraslado;
   IniciaTraslado;
   //
   edtCCosDes.Text := '';
// obc   edtUbicacionDesN.Text  := '' ;
   edtLocalidadDesN.Text := '';
   edtPisoDesN.Text := '';
   edtAreaDesN.Text := '';
   edtAmbienteDesN.Text := '';
   Z2bbtnImprime.Enabled := False;
   //
   pnlTra1.Enabled := True;
   pnlTra2.Enabled := False;
   pnlTra3.Enabled := False;
   //
End;

Procedure TFMaestro.IniciaTraslado;
Var
   xSQL, xNumTras: String;
Begin
   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      xSQL := 'Select COALESCE( Max( TRADOCMTO ), ''0'' ) as NUMMAX from ACF202 ';
   End;
   If (SRV_D = 'ORACLE') Then
   Begin
      xSQL := 'Select ' + DMAF.wReplacCeros + '(max(to_number(TRADOCMTO)),''0'')  as NUMMAX from ACF202';
   End;
   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;
   xNumTras := DMAF.StrZero(DMAF.cdsQry.FieldByName('NUMMAX').AsInteger + 1, 8);

   dbdtpTraslado.SetFocus;
   DMAF.cdsTraslado.Insert; // Se dispone para Adición de Traslado
   DMAF.cdsTraslado.FieldByName('TRADOCMTO').Value := xNumTras;
   DMAF.cdsTraslado.FieldByName('TRAORDEN').AsInteger := DMAF.cdsTraslado.recordcount + 1;
   DMAF.cdsTraslado.FieldByName('EXTERNO').Value := 'N';
End;

Procedure TFMaestro.bbtnCancela4Click(Sender: TObject);
Begin
   DMAF.cdsTraslado.CancelUpdates;
//   pnlActTraslado.Visible:=False;
//   pnlActTraslado.Enabled:=False;
   dbgTraslado.Enabled := True;
   dbgTraslado.Visible := True;
   pnlCabTraslado.Enabled := true;
   xTab5 := True;
End;

Procedure TFMaestro.dbgTrasladoKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Begin
// para Modificar  (ojo :No Hay Eliminación para Traslados)
   If (key = 77) And (ssCtrl In Shift) Then
   Begin
      dbgTraslado.Enabled := False;
      dbgTraslado.Visible := False;
//      pnlActTraslado.Enabled:=True;
//      pnlActTraslado.Visible:=True;
      DMAF.cdsTraslado.Edit;
      dbedocmtoT.SetFocus;
   End;
End;

Procedure TFMaestro.dbgCompuestoKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Begin
// para Eliminar del grupo de Activos Compuestos
   If (key = VK_DELETE) And (ssCtrl In Shift) Then
   Begin
      If MessageDlg('Desea Eliminar del grupo el Activo ' + DMAF.cdsActFij3.FieldByName('ARTCODBAR').Value,
         mtconfirmation, [mbYes, MbNo], 0) = mrYes Then
      Begin
         DMAF.cdsActfij3.Edit;
         DMAF.cdsActfij3.FieldByName('ACFIDCOMP').Value := '';
         DMAF.AplicaDatos(DMAF.cdsActFij3, 'ACTFIJ');

         Tabsheet3Show(self);
      End;
   End;
End;

// FILTRA CODIGO DE ACTIVO(ACFID) ESCOGIDO DESDE LOOKUPCD.
// PARA Actualizarlo, AGREGANDOLO AL GRUPO DE COMPUESTOS(ACFIDCOMP).

Procedure TFMaestro.dblcdCodigoDblClick(Sender: TObject);
Begin
   If length(dblcdCodigo.Value) > 0 Then
   Begin
      Screen.Cursor := CrHourGlass;
      xSQL := 'UPDATE ACF201 SET ACFIDCOMP=' + '''' + edtAct3.Text + ''' '
         + 'WHERE CIAID=''' + edtCia3.Text + ''' and '
         + 'TACFID=''' + DMAF.cdsACTFIJ2.FieldByname('TACFID').AsString + ''' and '
         + 'ARTCODBAR=''' + DMAF.cdsACTFIJ2.FieldByname('ARTCODBAR').AsString + ''' and '
         + 'ACFREFOR=''' + DMAF.CDSACTFIJ2.FieldByname('ACFREFOR').AsString + ''' and '
         + 'ACFFLAGACT=''A'''; //Flag de Activo 'A'
      DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
      Screen.Cursor := CrDefault;
   End;

   DMAF.cdsActFij3.Close;
   DMAF.cdsActFij3.Open;

   dblcdCodigo.Text := ' ';
   dbgCompuesto.Refresh;
   dbgCompuesto.Setfocus;

   dblcdCodigo.Enabled := False;
   dblcdCodigo.Visible := False;
   lblCodigo.Visible := False;
   btnActComp.Enabled := True;
End;

// a la entrada de Lookup Combo Dialog, selecciona solo los
// registros que pertenecen al mismo tipo de Activo

Procedure TFMaestro.dblcdCodigoEnter(Sender: TObject);
Begin
   Screen.Cursor := CrHourGlass;
   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      xSQL := 'SELECT * FROM ACF201 '
         + 'WHERE CIAID=''' + edtCia3.Text + ''' and ' //De la misma Cia.
         + 'TACFID=''' + edtTip3.Text + ''' and ' //Del mismo tipo de Activo
         + 'COALESCE(ACFIDCOMP, '''')=''' + '' + ''' and ' //Grupo de Activo nulo
         + 'COALESCE(ACFFLAGACT,'''')=''' + 'A' + ''' and ' //Flag de Activo 'A'
         + 'COALESCE(ACFFLAGREF,'''')=''' + '' + ''' and '
         + 'ARTCODBAR<>''' + edtAct3.Text + ''' '
         + 'ORDER BY ACFID';
   End;
   If (SRV_D = 'ORACLE') Then
   Begin
      xSQL := 'SELECT * FROM ACF201 '
         + 'WHERE CIAID=''' + edtCia3.Text + ''' and ' //De la misma Cia.
         + 'TACFID=''' + edtTip3.Text + ''' and ' //Del mismo tipo de Activo
         + 'NVL(ACFIDCOMP, ''NULO'')=''NULO''  and ' //Grupo de Activo nulo
         + 'NVL(ACFFLAGACT,'''')=''' + 'A' + ''' and ' //Flag de Activo 'A'
         + 'NVL(ACFFLAGREF,''NULO'')=''NULO'' and '
         + 'ARTCODBAR<>''' + edtAct3.Text + ''' '
   End;

   DMAF.cdsActFij2.Close;
   DMAF.cdsActFij2.DataRequest(xSQL);
   DMAF.cdsActFij2.Open;
   Screen.Cursor := CrDefault;
End;

Procedure TFMaestro.dbgDepreEnter(Sender: TObject);
Begin
   dbgDepre.Refresh;
End;

Procedure TFMaestro.pcMaestroChanging(Sender: TObject;
   Var AllowChange: Boolean);
Begin
   If (DMAF.cdsActFij.State In [dsInsert]) Or
      (DMAF.dsTraslado.State In [dsInsert]) Then
   Begin
      AllowChange := False;
   End
   Else
   Begin
      AllowChange := true;
   End;

   xtipodep := 0;
End;

Procedure TFMaestro.ModificaActivos;
Var
   xSQL: String;
   xFlDep: Boolean;
Begin
   xFlDep := True;
// busca depreciacion
   xSql := 'Select * From ACF204 '
      + 'Where CIAID=''' + dblcCia.Text + ''' and '
      + 'TACFID=''' + dbeTipAct.Text + ''' and '
      + 'ARTCODBAR=''' + oaAF2000.Mant2.FMant.cds2.FieldbyName('ARTCODBAR').AsString + ''' and DEPFLAGPRO=''P''';
   DMAF.cdsQry.Close;
   DMAF.cdsQry.ProviderName := 'dspTGE';
   DMAF.cdsQry.DataRequest(xSQL);
   DMAF.cdsQry.Open;

   If DMAF.cdsQry.RecordCount > 0 Then
      xFlDep := False;

   If (DMAF.cdsActFij.FieldByName('AcFEdita').AsString = 'S') Or
      (xFlDep = True) Or (DMAF.cdsActFij.FieldByName('AcFFlagAct').Value = 'I') Then
      xFlMod := False
   Else
      xFlMod := True;

   ////////////////////////////////////////////////////////////////////////////
   // Para poder modificar datos a los Activos que no se deprecian.
   xSql := 'Select * From ACF101 '
      + 'Where CIAID=''' + dblcCia.Text + ''' and '
      + 'TACFID=' + quotedstr(dbeTipAct.Text);
   DMAF.cdsQry2.Close;
   DMAF.cdsQry2.ProviderName := 'dspTGE';
   DMAF.cdsQry2.DataRequest(xSQL);
   DMAF.cdsQry2.Open;
   If DMAF.cdsQry2.FieldbyName('TACFDEPREC').AsInteger = 0 Then
   Begin
      xFlMod := True;
      xFlDep := False;
   End;
   ////////////////////////////////////////////////////////////////////////////

   // presentacion
   dbeVeces.Enabled := False;

   edtCiaDes.Text := '';
   edtTipoActDes.Text := '';
   edtLocalidadDes.Text := '';
   edtPisoDes.Text := '';
   edtAreaDes.Text := '';
   edtAmbienteDes.Text := '';
// obc   edtUbicacionDes.Text  :='';
   edtMaterialDes.Text := '';
   edtAdquisicionDes.Text := '';
   edtTipDocDes.Text := '';
   edtCCostoDes.Text := '';
   edtProveedorDes.Text := '';
   edtCuentaDes.Text := '';
   edtMonedaDes.Text := '';
   edtEstado.text := '';

   xCondicion := 'CIAID=''' + dblcCia.Text + ''' and TAcFId=''' + dbeTipAct.Text + '''';
   edtTipoActDes.Text := DMAF.DisplayDescrip('dspTGE', 'ACF101', '*', xCondicion, 'TAcFDes');

//   xPorcentaje:=DMAF.cdsQry.FieldByName('TACFDEPREC').AsFloat;

   DMAF.cdsActFij.Edit;
   pcMaestro.ActivePageIndex := 0; // Pasa a Datos Generales
   pcMaestro.Visible := True; // visible panel de actualización
   pcMaestro.Enabled := True;
//   dbeACFId.Text:=DMAF.cdsActFij.FieldByName('AcFid').AsString;
   pnlActReg.SetFocus; // Centraliza en panel de actualización
 //Datos Generales

   If xFlMod = True Then
   Begin
      dblcDes.Enabled := False;
      dblcMaterial.Enabled := False;
      dblcLocalidad.Enabled := False;
      dblcPiso.Enabled := False;
      dblcArea.Enabled := False;
      dblcAmbiente.Enabled := False;
      dblcResponsable.Enabled := False;
      dblcTipAdqui.Enabled := False;
      dblcMoneda.Enabled := False;
      dblcEstado.Enabled := False;
      dblcCia.Enabled := False; // desabilita variable de Compañía
//OBC   dbeTipAct.Enabled:=False;       // codigo de Activo
      dbeTipAct.Enabled := False; // codigo de Activo
      dbeAcFId.Enabled := False; // codigo de Activo
      dbeBarra.Enabled := False; // codigo de Barras
      dbeRefor.Enabled := False; // y Reforma  porque son llave
      dbeFlagComp.Enabled := False;
      dbmDesAmp.Enabled := True;
      dbeMedidas.Enabled := False;
      dbeMarca.Enabled := False;
      dbeModelo.Enabled := False;
      dbeSerie.Enabled := False;
      dbeColor.Enabled := False;
      dblcdProveedor.enabled := True;
      dblcTipDoc.enabled := True;
      dbeSerieDoc.Enabled := True;
      dbeNoDoc.Enabled := True;
      dbeGarantia.Enabled := True;
      dbeCambio.Enabled := False;
      dbeValoMO.Enabled := False;
//   dbeOcompra.Enabled:=True;
//   dbeNIngreso.Enabled:=True;
//   dbeCambio.Enabled :=true;
//   dbeValOMO.Enabled :=true;
      dbdtpFecRecep.Enabled := True;
      dbdtpFecIns.Enabled := True;
//   dbeValOMN.Enabled :=true;
//   DMAF.cdsActFij.FieldByName('ACFCAMBIO').asfloat:=FRound(DMAF.cdsActFij.FieldByName('ACFCAMBIO').asfloat,15,4);
//   DMAF.cdsActFij.FieldByName('ACFVALOMO').asfloat:=FRound(DMAF.cdsActFij.FieldByName('ACFVALOMO').asfloat,15,2);
//   DMAF.cdsActFij.FieldByName('ACFVALOMN').asfloat:=FRound(DMAF.cdsActFij.FieldByName('ACFVALOMN').asfloat,15,2);
//   DMAF.cdsActFij.FieldByName('ACFVALOME').asfloat:=FRound(DMAF.cdsActFij.FieldByName('ACFVALOME').asfloat,15,2);
//   DMAF.cdsActFij.FieldByName('ACFFREG').ASDATETIME:=Date;
//   DMAF.cdsActFij.FieldByName('ACFHREG').ASDATETIME:=tIME;
//   DMAF.cdsActFij.FieldByName('AcFUser').Value:=DMAF.wUsuario;
      bbtnOk1.Enabled := True;
   End
   Else
   Begin
      bbtnOk1.Enabled := False;
      dbeFlagComp.Enabled := False;
// obc     dblcUbica.Enabled:=False;
      dblcLocalidad.Enabled := False;
      dblcPiso.Enabled := False;
      dblcArea.Enabled := False;
      dblcAmbiente.Enabled := False;
      dblcMaterial.Enabled := False;
      dblctipAdqui.Enabled := False;
      dbdtpFecAdqui.Enabled := False;
      dbdtpFecRecep.Enabled := False;
      dbdtpFecIns.Enabled := False;
      dbeMarca.Enabled := False;
      dbeModelo.Enabled := False;
      dbeSerie.Enabled := False;
      dblcTipDoc.Enabled := False;
      dbeSerieDoc.Enabled := False;
//     dblcdCCosId.Enabled:=False;
      dblcdProveedor.Enabled := False;
//     dblcdCuenta.Enabled:=False;
      dblcMoneda.Enabled := False;
      dbeCambio.Enabled := False;
      dbeValOMO.Enabled := False;
//     dbeValOMN.Enabled:=False;
//     dbeValOME.Enabled:=False;
      dblcDes.Enabled := False;
      dbmDesAmp.Enabled := False;
//     dbeVida.Enabled:=False;
//     dbdtpFiniDep.Enabled:=False;
   End;

   label19.Caption := DMAF.cdsActFij.FieldByName('AcFRefor').AsString;
   xCrea := False;
   dblcCiaExit(Self);
   dblcMaterialExit(Self);
   dblcLocalidadExit(Self);
   dblcPisoExit(Self);
   dblcAreaExit(Self);
   dblcAmbienteExit(Self);
   dblcResponsableExit(self);
   dblcTipAdquiExit(Self);
   dblcTipDocExit(Self);
   dblcdCuentaExit(Self);
   dblcMonedaExit(Self);
   dblcdProveedorExit(Self);
   dblcEstadoExit(Self);
   xCrea := true;
   Llenacabeceras;

   If DMAF.cdsActFij.FieldByName('AcFFlagAct').Value = 'I' Then // Inactivos
   Begin
      label18.Caption := 'Inactivo'; // datos generales
//     bbtnOk3.Enabled:=False;
//     dbdtpFecInac.Enabled:=False;
//     dblcMotivo.Enabled:=False;
//     dbeDesacMo.Enabled:=False;
//     Label17.Caption:='Inactivo';  // Desactivacion
      Label20.Caption := 'Inactivo'; // traslado
      btnActTraslado.Enabled := False;
      Label22.Caption := 'Inactivo'; // reforma
      Label23.Caption := 'Inactivo'; // Compuesto
      btnActComp.Enabled := False;
      Label25.Caption := 'Inactivo';
      Label31.Caption := 'Inactivo';
   End
   Else
   Begin
      label18.Caption := '';
//     Label17.Caption:='';  // Desactivacion
      Label20.Caption := ''; // traslado
      Label22.Caption := ''; // reforma
      Label23.Caption := ''; // Compuesto
      Label25.Caption := '';
      Label31.Caption := '';
   End;

   If xFlMod = True Then
      dbmDesAmp.setfocus;
End;

Procedure TFMaestro.bbtnOk3Click(Sender: TObject); //DESACTIVACION
//INICIO HPP_201104_ACF
Var
   ls_anio, ls_Numero, ls_NumeroSolicitud: String;
//FIN HPP_201104_ACF
Begin
   //INICIO HPP_201104_ACF
   If DMAF.cdsActFij.FieldByName('AcFFlagAct').Value = 'I' Then
   Begin
      ShowMessage('Este Activo ya fue Desactivado');
      Exit;
   End;

   //FIN HPP_201104_ACF
   If Length(dbdtpFecInac.Text) = 0 Then
   Begin
      dbdtpFecInac.Setfocus;
      showmessage('Falta Fecha de Desactivación');
      exit;
   End;

   If Length(dblcMotivo.Text) = 0 Then
   Begin
      dblcMotivo.setfocus;
      showmessage('Falta Codigo de Desactivación');
      exit;
   End;

   If Length(edtMotivo.Text) = 0 Then
   Begin
      dblcMotivo.setfocus;
      showmessage('Codigo de Desactivación no existe');
      exit;
   End;

   DMAF.cdsActFij.FieldByName('AcFFlagAct').Value := 'I';
   // TOMA DATOS DE REGISTRO DE FECHA
   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      xSQL := 'SELECT * FROM TGE114 WHERE FECHA=DATE(';
      xSQL := XSQL + '''' + FORMATDATETIME('YYYY-MM-DD', DMAF.cdsActFij.FieldByName('ACFFECINAC').VALUE) + '''' + ')';
   End;

   If (SRV_D = 'ORACLE') Then
   Begin
      xSQL := 'SELECT * FROM TGE114 WHERE FECHA=TO_DATE(';
      xSQL := XSQL + '''' + FORMATDATETIME(DMAF.wFormatFecha, DMAF.cdsActFij.FieldByName('ACFFECINAC').VALUE) + '''' + ')';
   End;
   DMAF.cdsWork1.Close;
   DMAF.cdsWork1.datarequest(xSQL);
   DMAF.cdsWork1.OPEN;

   DMAF.cdsActFij.FieldByName('DesAno').Value := DMAF.cdsWork1.FieldByName('FECANO').Value;
   DMAF.cdsActFij.FieldByName('DesAnoMes').Value := DMAF.cdsWork1.FieldByName('FECANO').Value +
      DMAF.cdsWork1.FieldByName('FECMES').Value;
   //INICIO HPP_201104_ACF
   DMAF.cdsActFij.FieldByName('DESAUTORI').AsString := dbeDesAutori_des.Text;
   //FIN HPP_201104_ACF
{   if DMAF.cdsActFij.fieldbyname('ACFDESL').AsString='' then
      DMAF.cdsActFij.fieldbyname('ACFDESL').AsString:= ' ';
   if DMAF.cdsActFij.fieldbyname('ACFDESACMO').AsString='' then
      DMAF.cdsActFij.fieldbyname('ACFDESACMO').AsString:= ' ';}

   cdsPost(DMAF.cdsActFij);

   DMAF.AplicaDatos(DMAF.cdsActFij, 'ACTFIJ'); // Actualiza Maestro
   //INICIO HPP_201104_ACF
   ls_anio := Copy(datetoStr(dbdtpFecInac.Date), 7, 4);
   xSQL := 'TO_CHAR(FECHA,' + QuotedStr('YYYY') + ') = ' + QuotedStr(ls_anio);
   ls_Numero := DMAF.DisplayDescrip('dspTGE', 'ACF130', 'LPAD( NVL(MAX(TO_NUMBER(SUBSTR(NUMSOLDES,5,4)))+1,1),4,' + QuotedStr('0') + ') as F', xSQL, 'F');
   ls_NumeroSolicitud := ls_anio + ls_Numero;

   //insertando la cabecera
   xSQL := ' INSERT INTO ACF130(CIAID,NUMSOLDES,DESACID,ESTADO,PROCESO,USUARIO, ' +
      ' FECHA,USUAUT,FECAUT,OBSERVACION,USUREG,FECREG,USUMOD,FECMOD) ' +
      ' VALUES(' + QuotedStr('02') + ', ' + QuotedStr(ls_NumeroSolicitud) + ', ' +
      QuotedStr(dblcMotivo.Text) + ', ' + QuotedStr('ACEPTADO') + ', ' +
      QuotedStr('INDIVIDUAL') + ', ' + QuotedStr(DMAF.wUsuario) + ', TO_DATE(' +
      QuotedStr(datetoStr(dbdtpFecInac.Date)) + ',' + QuotedStr('DD/MM/YYYY') + '),' +
      QuotedStr(dbeDesAutori.Text) + ', TO_DATE(' +
      QuotedStr(datetoStr(dbdtpFecInac.Date)) + ',' + QuotedStr('DD/MM/YYYY') + '),' +
      QuotedStr(dbeDesacmo.Text) + ', USER, SYSDATE, NULL, NULL) ';
   DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
   //insertando el detalle
   xSQL := ' INSERT INTO ACF131(CIAID,NUMSOLDES,ARTCODBAR,ARTID,USUREG,FECREG,USUMOD,FECMOD) ' +
      ' VALUES(' + QuotedStr('02') + ', ' + QuotedStr(ls_NumeroSolicitud) + ', ' +
      QuotedStr(DMAF.cdsActFij.FieldByName('ARTCODBAR').AsString) + ', ' +
      QuotedStr(DMAF.cdsActFij.FieldByName('ARTID').AsString) + ', ' +
      ' USER, SYSDATE, NULL,NULL ) ';
   DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
   //FIN HPP_201104_ACF

   DMAF.cdsActFij.Edit; // pasa a edición nuevamente.
   pcMaestro.ActivePageIndex := 0; // Pasa a Datos Generales
   //INICIO HPP_201104_ACF
   //Showmessage('Activo Desactivado');
   Showmessage('Activo Desactivado con Solicitud de Desactivación Nº ' + ls_NumeroSolicitud);
   //FIN HPP_201104_ACF
End;

Procedure TFMaestro.bbtnCancela3Click(Sender: TObject);
Begin
   Close;
//   dbgMaestro.Visible:=True;
End;

Procedure TFMaestro.bbtnCancela6Click(Sender: TObject);
Begin
//   DMAF.cdsActFij.CancelUpdates;
End;

Procedure TFMaestro.TabSheet8Enter(Sender: TObject);
Begin
   xvalordep := 0;
   xvalorsum := 0;
   pnlCCosto.enabled := False;

   If xtipoDep = 0 Then
   Begin

// Distribución por Centros de Costos
      xSQL := 'SELECT * FROM ACF103 '
         + 'WHERE CIAID=''' + DMAF.cdsACTFIJ.FieldByName('CIAID').ASSTRING + ''' and '
         + 'TACFID=''' + DMAF.cdsACTFIJ.FieldByName('TACFID').ASSTRING + ''' and '
         + 'ACFID=''' + DMAF.cdsACTFIJ.FieldByName('ACFID').ASSTRING + ''' and '
         + 'ACFREFOR=''' + DMAF.cdsACTFIJ.FieldByName('ACFREFOR').ASSTRING + '''';
      DMAF.cdsAFCC.Close;
      DMAF.cdsAFCC.DataRequest(xSQL);
      DMAF.cdsAFCC.Open;

// grid para distribución de depreciación (todos los X)
      xSQL := 'SELECT * FROM ACF204 '
         + 'WHERE CIAID=''' + DMAF.CDSACTFIJ.FieldByName('CIAID').ASSTRING + ''' and '
         + 'TACFID=''' + DMAF.CDSACTFIJ.FieldByName('TACFID').ASSTRING + ''' and '
         + 'ACFID=''' + DMAF.CDSACTFIJ.FieldByName('ACFID').ASSTRING + ''' and '
         + 'DEPFLAGPRO=''X'' ';
//         +'ORDER BY DEPCOD,DEPFLAGREF, DEPFECDEPR';
      DMAF.cdsDepre.Close;
      DMAF.cdsDepre.DataRequest(xSQL);
      DMAF.cdsDepre.Open;

      lb99.Visible := False;
      xTipoDep := 1;
      MuestraPorcen;
   End;
End;

Procedure TFMaestro.bbtnOk6Click(Sender: TObject);
Var
   p: double;
   i: integer;
Begin
 // distribucion CENTRO DE COSTO.
   If Length(dblcCCosto.Text) = 0 Then
   Begin
      showmessage('Falta Centro de Costo');
      exit;
   End;

   If Length(dbePDepr.Text) = 0 Then
   Begin
      showmessage('Falta Porcentaje de Depreciación');
      exit;
   End;

// chequea antes de INSERTAR
   dbgCCosto.ColumnByName('AFDEPREP').FooterValue := FORMAT('%15.2f', [DMAF.OperClientDataset(DMAF.cdsAFCC, 'SUM(AFDEPREP)', '')]);

   xvalorDep := StrtoFloat(dbePDepr.Text);

   If (xvalorsum + xvalorDep) > 100 Then
   Begin
      bbtnGraba.Enabled := False;
      showmessage('Excedió el 100%');
      dbePDepr.SetFocus;
      exit;
   End
   Else
      If DMAF.cdsAFCC.Locate('CCOSID', VarArrayOf([dblcCCosto.Text]), [loPartialKey]) Then
      Begin
         dblcCCosto.text := '';
         dblcCCosto.setfocus;
         showmessage('El centro de Costo debe ser diferente');
         exit;
      End;

   pnlCCosto.enabled := True;

   xvalorsum := xvalorsum + xvalorDep;
   bbtnGraba.Enabled := True;
   dbeSum.text := FloattoStr(xvalorsum);
   DMAF.cdsAFCC.Insert;
   DMAF.cdsAFCC.FieldByname('CIAID').Value := edtCia2.Text;
   DMAF.cdsAFCC.FieldByName('TACFID').Value := edtTip2.Text;
   DMAF.cdsAFCC.FieldByName('ACFID').Value := dbeAcFid.Text;
   DMAF.cdsAFCC.FieldByName('CCOSID').Value := dblcCCosto.Text;
   DMAF.cdsAFCC.FieldByName('AFDEPREP').Value := xvalorDep;

   If DMAF.cdsDepre.recordcount > 0 Then
      DMAF.cdsAFCC.FieldByName('DEPCOD').Asstring := DMAF.cdsDepre.FieldByName('DEPCOD').AsString
   Else
      DMAF.cdsAFCC.FieldByName('DEPCOD').Asstring := '';

   DMAF.cdsAFCC.FieldByName('ACFREFOR').Asstring := DMAF.cdsActFij.FieldByName('ACFREFOR').AsString;
   DMAF.cdsAFCC.FieldByName('AFCOD').AsInteger := 0;
   xvalorDep := 0;
   cdsPost(DMAF.cdsAFCC);
   MuestraPorcen;
// bbtnGraba.Enabled:=False;
//   dbgCCosto.ColumnByName('AFDEPREP').FooterValue:=FORMAT('%15.2f',[DMAF.OperClientDataset(DMAF.cdsAFCC, 'SUM(AFDEPREP)', '')]);

   dblcCCosto.text := '';
   dbePDepr.text := '';
End;

Procedure TFMaestro.MuestraPorcen;
Begin
   dbgCCosto.Enabled := True;
   dbgCCosto.Visible := True;
   dbgCCosto.Refresh;

   If DMAF.cdsActFij.FieldByName('ACFFLAGACT').Asstring = 'I' Then
   Begin
      pnlCCosto.Visible := False;
      pnlCCosto.Enabled := False;
      bbtnGraba.Visible := False; // botón de Grabación: Cierre
      bbtnGraba.Enabled := False;
      bbtnCancela.Visible := False;
      bbtnCancela.Enabled := False;
   End
   Else
   Begin
      pnlCCosto.Enabled := True; // botón de acceso a Adición
      pnlCCosto.Visible := True;
      bbtnGraba.Visible := True; // botón de Grabación: Cierre
      bbtnGraba.Enabled := True;
      bbtnCancela.Visible := True;
      bbtnCancela.Enabled := True;
   End;

   If DMAF.OperClientDataset(DMAF.cdsAFCC, 'SUM(AFDEPREP)', '') = 100 Then
   Begin
      pnlCCosto.Enabled := False;
      pnlCCosto.visible := False;
      bbtnGraba.Enabled := False;
      bbtnGraba.Visible := False; // botón de Grabación: Cierre
      bbtnCancela.Visible := False;
      bbtnCancela.Enabled := False;
   End;
End;

Procedure TFMaestro.bbtngrabaClick(Sender: TObject);
Var
   XNNUMERO: INTEGER;
   XSNUMERO: String;
Begin
   If (length(dblcCCosto.text) > 0) Or
      (length(dbePDepr.text) > 0) Then
   Begin
      bbtnOk6.setfocus;
      exit;
   End;

{   if  xvalorsum <> 100 then
   begin
   showmessage('Total Distribucion no es el 100%');
   dbePDepr.setfocus;
   exit;
   end;
}
   DMAF.cdsActFij.DataRequest('Select * From ACF201 '
      + 'WHERE CIAID=''' + dblcCia.Text + ''' and ARTCODBAR=''' + dbeBarra.Text + '''');

//   DMAF.cdsActFij.DataRequest('Select * From ACF201');
   DMAF.cdsAFCC.edit;
   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
      DMAF.cdsAFCC.Fieldbyname('ACFHREG').asdatetime := time;
   If SRV_D = 'ORACLE' Then
      DMAF.cdsAFCC.Fieldbyname('ACFHREG').asdatetime := date + time;

   DMAF.cdsActFij.edit;
   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
      DMAF.cdsActFij.Fieldbyname('ACFHREG').asdatetime := time;
   If SRV_D = 'ORACLE' Then
      DMAF.cdsActFij.Fieldbyname('ACFHREG').asdatetime := date + time;

   DMAF.ControlTran;
   dblcCCosto.Text := '';
   dbePDepr.Text := '';

   xSQL := 'SELECT * FROM ACF106 WHERE AFREF=''01'''; //TOMA ULTIMO # DISTRIBUCION
   DMAF.cdsDEPRE2.CLOSE;
   DMAF.cdsDepre2.dataRequest(xSQL);
   DMAF.cdsDEPRE2.OPEN;
   XNNUMERO := DMAF.CDSDEPRE2.FieldByName('AFCOD').AsInteger + 1; // NUEVO NUMERO
   XSNUMERO := INTTOSTR(XNNUMERO);

   dbgCCosto.ColumnByName('AFDEPREP').FooterValue := FORMAT('%15.2f', [DMAF.OperClientDataset(DMAF.cdsAFCC, 'SUM(AFDEPREP)', '')]);

   xSQL := 'UPDATE ACF106 SET AFCOD=' + XSNUMERO + ' WHERE AFREF=''01'''; //LO ACTUALIZA EN REFERENCIA
   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   End;

   xSQL := 'UPDATE ACF103 SET AFCOD=' + XSNUMERO + ' ' //PONE EN TABLA DISTRIBUCION
      + 'WHERE AFCOD=0 and '
//        +  'DEPCOD='''  +DMAF.cdsDEPRE.FieldByName('DEPCOD').AsString  +''' and '
   + 'CIAID=''' + DMAF.cdsACTFIJ.FieldByName('CIAID').ASSTRING + ''' and '
      + 'TACFID=''' + DMAF.cdsACTFIJ.FieldByName('TACFID').ASSTRING + ''' and '
      + 'ACFID=''' + DMAF.cdsACTFIJ.FieldByName('ACFID').ASSTRING + ''' and '
      + 'ACFREFOR=''' + DMAF.cdsACTFIJ.FieldByName('ACFREFOR').ASSTRING + '''';
   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   End;

//   DMAF.cdsActFij.DataRequest('Select * From ACF201');
   //agregado por ana
   DMAF.cdsActFij.DataRequest('Select * From ACF201 '
      + 'WHERE CIAID=''' + dblcCia.Text + ''' and ACFID=''' + dbeAcfid.Text + '''');

   DMAF.cdsActFij.edit;
   DMAF.cdsActFij.FieldByName('ACFHREG').asdatetime := time;
   /////
   cdsPost(DMAF.cdsActFij);
   DMAF.ControlTran;
   xTipoDep := 0;
   Tabsheet8Enter(self);
   Showmessage('Distribucion Grabada');
End;

Procedure TFMaestro.dbgCCostoKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Begin
// para Eliminar
   If (key = VK_DELETE) And (ssCtrl In Shift) Then
   Begin
      If MessageDlg('Desea Eliminar', mtconfirmation, [mbYes, MbNo], 0) = mrYes Then
      Begin
         DMAF.cdsActFij.DataRequest('Select * From ACF201');
         DMAF.cdsAFCC.Delete;
         DMAF.ControlTran;
         MuestraPorcen;
      End;
   End;
End;

Procedure TFMaestro.ProcesoRefor;
Begin
   {
   if (dbeRefor.Text='R') and (Length(wretorno)=0) then
   begin
      showmessage('Compañía-Codigo de Activo no existe');
   end;
   }

   If dbeRefor.Text = 'R' Then
   Begin
//      lbRefor.caption:='Reforma';
      WSQL := 'SELECT * FROM ACF201 '
         + 'WHERE CIAID=''' + dblcCIA.Text + ''' and '
         + 'TACFID=''' + dbeTipAct.Text + ''' and '
         + 'ARTCODBAR=''' + dbeBarra.Text + ''' and '
         + 'ACFREFOR=''00''';
      DMAF.cdsWORK1.Close;
//      DMAF.Dcom1.Appserver.EjecutaQry2(WSQL);
      DMAF.cdsWORK1.dATArEQUEST(WSQL);
      DMAF.cdsWORK1.Open;
// obc agregado el 30/09/2004
      wRetorno := DMAF.cdsWork1.FieldByName('ACFID').AsString;
   // Campos a duplicar fijos x Reforma
      dbeFlagComp.Text := DMAF.cdsWork1.FieldByName('ACFFLACOMP').AsString;
      dbeFlagComp.enabled := False;
// obc      DMAF.cdsActFij.FieldByName('UbicId').AsString:=DMAF.cdsWork1.FieldByName('UBICID').AsString;
//      dblcUbica.Text:=DMAF.cdsWork1.FieldByName('UBICID').AsString;
//      dblcubica.enabled:=False;
      DMAF.cdsActFij.FieldByName('LocId').AsString := DMAF.cdsWork1.FieldByName('LOCID').AsString;
      dblcLocalidad.Text := DMAF.cdsWork1.FieldByName('LOCID').AsString;
      dblcLocalidad.enabled := False;
      DMAF.cdsActFij.FieldByName('PISO').AsString := DMAF.cdsWork1.FieldByName('PISO').AsString;
      dblcPiso.Text := DMAF.cdsWork1.FieldByName('PISO').AsString;
      dblcPiso.enabled := False;
      DMAF.cdsActFij.FieldByName('AREA').AsString := DMAF.cdsWork1.FieldByName('AREA').AsString;
      dblcArea.Text := DMAF.cdsWork1.FieldByName('AREA').AsString;
      dblcArea.enabled := False;
      DMAF.cdsActFij.FieldByName('AMBCOD').AsString := DMAF.cdsWork1.FieldByName('AMBCOD').AsString;
      dblcAmbiente.Text := DMAF.cdsWork1.FieldByName('AMBCOD').AsString;
      dblcAmbiente.enabled := False;

      DMAF.cdsActFij.FieldByName('CuentaId').AsString := DMAF.cdsWork1.FieldByName('CUENTAID').AsString;
      dblcdCuenta.Text := DMAF.cdsWork1.FieldByName('CUENTAID').AsString;
//      dblcdCuenta.enabled:=False;
      DMAF.cdsActFij.FieldByName('CCosId').AsString := DMAF.cdsWork1.FieldByName('CCOSID').AsString;
      dblcdCCosId.Text := DMAF.cdsWork1.FieldByName('CCOSID').AsString;

      DMAF.cdsActFij.FieldByName('ACFDES').Value := DMAF.cdsWork1.FieldByName('ACFDES').AsString;

      DMAF.cdsActFij.FieldByName('ACFDESL').Value := DMAF.cdsWork1.FieldByName('ACFDESL').AsString;

      DMAF.cdsActFij.FieldByName('ACFMARCA').Value := DMAF.cdsWork1.FieldByName('ACFMARCA').AsString;
      dbeMarca.Enabled := False;

      DMAF.cdsActFij.FieldByName('ACFMODELO').Value := DMAF.cdsWork1.FieldByName('ACFMODELO').AsString;
      dbeModelo.Enabled := False;

      DMAF.cdsActFij.FieldByName('ACFSERIE').Value := DMAF.cdsWork1.FieldByName('ACFSERIE').AsString;
      dbeSerie.Enabled := False;

      DMAF.cdsActFij.FieldByName('ACFMEDIDA').Value := DMAF.cdsWork1.FieldByName('ACFMEDIDA').AsString;
      dbeMedidas.Enabled := False;

      DMAF.cdsActFij.FieldByName('ACFTIPADQU').Value := DMAF.cdsWork1.FieldByName('ACFTIPADQU').AsString;
      dblcTipAdqui.Enabled := False;

      DMAF.cdsActFij.FieldByName('MATERIALID').Value := DMAF.cdsWork1.FieldByName('MATERIALID').AsString;
      dblcMaterial.Enabled := False;

//      dbebarra.Enabled:=False;
      dbeVeces.Enabled := False;

      xCondicion := 'CIAID=''' + dblcCia.Text + ''' and TAcFId=''' + dbeTipAct.Text + '''';
      edtTipoActDes.Text := DMAF.DisplayDescrip('dspTGE', 'ACF101', '*', xCondicion, 'TAcFDes');

      xCrea := False;
      dblcCiaExit(Self);
      dblcLocalidadExit(Self);
      dblcPisoExit(Self);
      dblcAreaExit(Self);
      dblcAmbienteExit(Self);
      dblcMaterialExit(Self);
// obc      dblcUbicaExit(Self);
      dblcTipAdquiExit(Self);
      dblcdCuentaExit(Self);
      dblcMonedaExit(Self);
      xCrea := True;

//      dblcdCCosId.enabled:=False;
//      dbeVida.enabled:=True;
      label19.Caption := ' ';
{   end
   else
   if length(dbeRefor.Text)>0 then
   if (dbeRefor.Text <> 'R') then   //23 Marzo
   begin
//      lbRefor.caption:='';
      dbeTipAct.enabled   :=True;
      dbeFlagComp.enabled  :=True;
// obc      dblcUbica.enabled    :=True;
      dblcLocalidad.enabled:=True;
      dblcPiso.enabled    :=True;
      dblcArea.enabled    :=True;
      dblcAmbiente.enabled:=True;
//      dblcdCCosId.enabled  :=True;
//      dbeVida.enabled      :=False;
//      dbeTipAct.Text   :='';
      dbeFlagComp.Text  :='';
// obc       dblcUbica.Text    :='';
      dblcLocalidad.Text:='';
      dblcPiso.Text    :='';
      dblcArea.Text    :='';
      dblcAmbiente.Text    :='';
//      dblcdCuenta.Text  :='';  // 23 de Marzo
      dblcdCCosId.Text  :='';
//      dbeAcfidExit(self);
  }
   End;

End;

Procedure TFMaestro.TabSheet4Enter(Sender: TObject);
Begin
// Reformas
   DBGrid1.Selected.Clear;
   DBGrid1.Selected.Add('ACFID'#9'8'#9'Activo'#9'F');
   DBGrid1.Selected.Add('ACFREFOR'#9'6'#9'Nº~Reforma'#9'F');
   DBGrid1.Selected.Add('ACFFECADQ'#9'11'#9'Fecha~Adquisición'#9'F');
   DBGrid1.Selected.Add('ACFFECRECE'#9'11'#9'Fecha~Recepción'#9'F');
   DBGrid1.Selected.Add('ACFFECINS'#9'11'#9'Fecha~Instalación'#9'F');
   DBGrid1.Selected.Add('DOCID'#9'4'#9'Id~Doc.'#9'F');
   DBGrid1.Selected.Add('ACFSERIEDO'#9'6'#9'Nº~Serie'#9'F');
   DBGrid1.Selected.Add('ACFNODOC'#9'12'#9'Nº~Documento'#9'F');
   DBGrid1.Selected.Add('ACFVALOMN'#9'12'#9'Valor~M.N.'#9'F');
   DBGrid1.Selected.Add('ACFDES'#9'20'#9'Activo Fijo'#9'F');
   DBGrid1.Selected.Add('ACFFINIDEP'#9'11'#9'F.Inicio~Depreciación'#9'F');

   xSQL := 'SELECT ACFID, ACFREFOR, ACFFECADQ, ACFFECRECE, ACFFECINS, DOCID, '
      + 'ACFSERIEDO, ACFNODOC, ACFVALOMN, ACFDES, ACFFINIDEP '
      + 'FROM ACF201 '
      + 'WHERE CIAID=' + '''' + dblcCIA.Text + ''' and '
      + 'TACFID=' + '''' + dbeTipAct.Text + ''' and '
      + 'ACFID=' + '''' + dbeACFID.Text + ''' and ACFFLAGREF=''R'' '
      + 'ORDER BY ACFFECADQ, ACFREFOR';
   DMAF.cdsWORK1.Close;
   DMAF.cdsWORK1.DataRequest(xSQL);
   DMAF.cdsWork1.Open;
End;

Procedure TFMaestro.TabSheet2Enter(Sender: TObject);
Begin
   xSalir := False;

   If DMAF.cdsUDep.RecordCount = 1 Then
   Begin
      dblcTipoD.Text := DMAF.cdsUDep.FieldByName('DEPCOD').AsString;
      dblcTipoDExit(Sender);
      dbgDepre.SetFocus;
   End;
End;

Procedure TFMaestro.bbtnCancelaClick(Sender: TObject);
Begin
   If xvalorsum > 0 Then
      If MessageDlg(' ¿Desea eliminar la Distribución actual? '
         , mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Else
         exit;

   pnlCCosto.enabled := False;
   dbesum.text := floattostr(0);
   xvalorsum := 0;
   dblcCCosto.Text := '';
   dbePDepr.Text := '';

   xSQL := 'DELETE FROM ACF103 '
      + 'WHERE CIAID=''' + DMAF.cdsDEPRE.FieldByName('CIAID').AsString + ''' and '
      + 'ACFID=''' + DMAF.cdsDEPRE.FieldByName('ACFID').AsString + ''' and '
      + 'TACFID=''' + DMAF.cdsDEPRE.FieldByName('TACFID').AsString + ''' and '
      + 'ACFREFOR=''' + DMAF.cdsDEPRE.FieldByName('ACFREFOR').AsString + '''';
   Try
      DMAF.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   End;

   xSQL := 'SELECT * FROM ACF103 '
      + 'WHERE CIAID=''' + DMAF.cdsACTFIJ.FieldByName('CIAID').ASSTRING + ''' and '
      + 'TACFID=''' + DMAF.cdsACTFIJ.FieldByName('TACFID').ASSTRING + ''' and '
      + 'ACFID=''' + DMAF.cdsACTFIJ.FieldByName('ACFID').ASSTRING + ''' and '
      + 'ACFREFOR=''' + DMAF.cdsACTFIJ.FieldByName('ACFREFOR').ASSTRING + '''';

   DMAF.cdsAFCC.Close;
   DMAF.cdsAFCC.DataRequest(xSQL);
   DMAF.cdsAFCC.Open;

//   DMAF.cdsDepre.CancelUpdates;
//   pcMaestro.ActivePageIndex:=0;    // Pasa a Datos Generales
End;

Procedure TFMaestro.TabSheet5Enter(Sender: TObject);
Begin
   // Traslados
   If Not xTab5 Then Exit;

   xSQL := 'SELECT * FROM ACF321 '
      + 'WHERE ARTCODBAR=' + quotedstr(DMAF.CDSACTFIJ.FieldByName('ARTCODBAR').AsString);
   If DMAF.cdsTraslado.active Then
      If DMAF.cdsTraslado.IndexName = 'XXX' Then
         DMAF.cdsTraslado.DeleteIndex('XXX');

   DMAF.cdsTraslado.Close;
   DMAF.cdsTraslado.DataRequest(xSQL);
   DMAF.cdsTraslado.Open;
   DMAF.cdsTraslado.AddIndex('XXX', 'NUMDOC', [ixDescending]);
   DMAF.cdsTraslado.IndexName := 'XXX';
// Reformas
   dbgTraslado.Selected.Clear;
   dbgTraslado.Selected.Add('TRANLOCID'#9'2'#9'Loc~Des'#9'F');
   dbgTraslado.Selected.Add('TRANPISO'#9'2'#9'Piso~Des'#9'F');
   dbgTraslado.Selected.Add('TRANAREA'#9'2'#9'Area~Des'#9'F');
   dbgTraslado.Selected.Add('TRANAMBCOD'#9'3'#9'Amb~Des'#9'F');
   dbgTraslado.Selected.Add('FECTRAS'#9'11'#9'Fecha~Traslado'#9'F');
   dbgTraslado.Selected.Add('NUMDOC'#9'6'#9'Num~Doc.'#9'F');
   dbgTraslado.Selected.Add('LOCID'#9'2'#9'Loc~Ori'#9'F');
   dbgTraslado.Selected.Add('PISO'#9'2'#9'Piso~Ori'#9'F');
   dbgTraslado.Selected.Add('AREA'#9'2'#9'Area~Ori'#9'F');
   dbgTraslado.Selected.Add('AMBCOD'#9'3'#9'Amb~Ori'#9'F');
   dbgTraslado.Selected.Add('RECIBEID'#9'5'#9'Respons'#9'F');
   dbgTraslado.Selected.Add('RECIBENOM'#9'15'#9'Respons'#9'F');
End;

Procedure TFMaestro.HabilitaActivo;
Begin
   label18.Caption := ' ';
   dbeFlagComp.Enabled := true;
// obc      dblcUbica.Enabled:=true;
   dblcLocalidad.Enabled := true;
   dblcPiso.Enabled := true;
   dblcArea.Enabled := true;
   dblcAmbiente.Enabled := true;
   dblcMaterial.Enabled := true;
   dblctipAdqui.Enabled := true;
   dbdtpFecAdqui.Enabled := true;
   dbdtpFecRecep.Enabled := true;
   dbdtpFecIns.Enabled := true;
   dbeMarca.Enabled := true;
   dbeModelo.Enabled := true;
   dbeSerie.Enabled := true;
   dblcTipDoc.Enabled := true;
   dbeSerieDoc.Enabled := true;
//     dblcdCCosId.Enabled:=true;
   dblcdProveedor.Enabled := true;
//     dblcdCuenta.Enabled:=true;
   dblcMoneda.Enabled := true;
   dbeCambio.Enabled := true;
   dbeValOMO.Enabled := true;
//     dbeValOMN.Enabled:=true;
//     dbeValOME.Enabled:=true;
   dblcDes.Enabled := true;
   dbmDesAmp.Enabled := true;
//     dbeVida.Enabled:=true;
//     dbdtpFiniDep.Enabled:=true;
End;

Procedure TFMaestro.btnActCompClick(Sender: TObject);
Begin
   dblcdCodigo.Enabled := True;
   dblcdCodigo.Visible := True;
   lblCodigo.Visible := True;
   btnActComp.Enabled := False;
End;

Procedure TFMaestro.dbeAcFidExit(Sender: TObject);
Var
   xMsg: String;
Begin
{// Consistencia Cía-Codigo de Activo

      if xCrea then exit;
   if dblccia.Focused then Exit;
   if dbeTipAct.Focused then exit;

   if dbeACFID.Text='' then begin
      ShowMessage( 'Ingrese Código de Activo');
      dbeACFID.SetFocus;
      Exit;
   end;

   xCondicion:='CIAID='''+dblcCIA.Text+''' and ACFID='''+dbeACFID.Text+''' and '
              +'TACFID='''+dbeTipAct.Text+''' ' ;

   If DMAF.cdsActFij.State  in [dsInsert]  then
      xCondicion:=xCondicion+'and ACFREFOR=''00'''
   else
      xCondicion:=xCondicion+'and ACFREFOR='''+DMAF.CDSACTFIJ.FieldByName('ACFREFOR').VALUE+'''';

   wretorno:=DMAF.DisplayDescrip('dspTGE','ACF201','*',xCondicion,'AcFId');

// obc   DMAF.cdsActFij.FieldByName('ARTCODBAR').Value:=dbeAcFId.Text;

/// Agregar

//   xCondicion:='ACFID='''+dbeAcFId.Text+''' ' Se agrago la Compañía a la  busqueda ;
   xCondicion:='ACFID='''+dbeAcFId.Text+''' AND CIAID='''+dblcCia.Text+'''';
   xCondicion:='ACFID='''+dbeAcFId.Text+''' and TACFID='''+dbeTipAct.Text+''' AND CIAID='''+dblcCia.Text+'''';
   if DMAF.DisplayDescrip('dspTGE','ACF201','TACFID, ACFID, ACFDES',xCondicion,'ACFDES')<>'' then
   begin
      xMsg:='';
      while not DMAF.cdsQry.Eof do
      begin
         xMsg:=xMsg+DMAF.cdsQry.FieldByName('TACFID').AsString+'  '
                 +DMAF.cdsQry.FieldByName('ACFID').AsString+'  '
                 +Trim(DMAF.cdsQry.FieldByName('ACFDES').AsString)+#13+#13;
         DMAF.cdsQry.Next;
      end;
     ShowMessage('      Código de Activo ya Fue Registrado       '+#13+#13
                 +' Tipo   Activo   Descripción'+#13+#13+xMsg );
      dbeAcFid.setfocus;
      Exit;
   end;

   dbeFlagComp.enabled  :=True;
// obc    dblcubica.enabled    :=True;
   dblcLocalidad.enabled:=True;
   dblcPiso.enabled:=True;
   dblcArea.enabled:=True;
   dblcAmbiente.enabled:=True;
//   dblcdCuenta.enabled  :=True;
//   dblcdCCosId.enabled  :=True;
//   dbeVida.enabled      :=True;

   if Length(wretorno)=0 then
      dbeFlagComp.SetFocus
   else
      dbeRefor.SetFocus;
}
End;

Procedure TFMaestro.dblcdCCostoNExit(Sender: TObject);
Begin
// Consistencia Centro de Costo y toma descripción
   If xCrea Then Exit;
   If bbtncancela4.Focused Then Exit;
   If dbeMotivo.Focused Then Exit;
   If dbcbExt.Focused Then Exit;

   xCondicion := 'CCosId=' + '''' + dblcdCCostoN.Text + '''';
   edtCCosDes.Text := DMAF.DisplayDescrip('dspTGE', 'TGE203', '*', xCondicion, 'CCosAbr');
   If trim(edtCCosDes.Text) = '' Then
   Begin
      dblcdCCoston.SetFocus;
      If trim(dblcdCCoston.text) = '' Then
      Begin
         Showmessage('Ingrese Centro de Costo');
         exit;
      End
      Else
      Begin
         Showmessage('Centro de Costo invalido');
         exit;
      End;
   End
End;

Procedure TFMaestro.dblcUbicacionNExit(Sender: TObject);
Begin
// obc    if xCrea then Exit;
//   if bbtncancela4.Focused then Exit;
//   if dbeMotivo.Focused    then Exit;
//   if dbcbExt.Focused      then Exit;

//   xCondicion := 'UbicId='+''''+dblcUbicacionN.Value+'''';
//   edtUbicacionDesN.Text:=DMAF.DisplayDescrip('dspTGE','TGE117','*',xCondicion,'UbicAbr');
//   if trim(  edtUbicacionDesN.Text ) = '' then
//   begin
//      dblcUbicacionN.SetFocus ;
//      if trim( dblcUbicacionN.text ) = '' then
//         Showmessage('Ingrese Ubicación')
//      else
//         Showmessage('Ubicación Equivocada - Corrija ') ;
//   end
End;

Procedure TFMaestro.dblcLocalidadNExit(Sender: TObject);
Begin
   If xCrea Then Exit;
   If bbtncancela4.Focused Then Exit;
   If dbeMotivo.Focused Then Exit;
   If dbcbExt.Focused Then Exit;

   xCondicion := 'LocId=' + '''' + dblcLocalidadN.Value + '''';
   edtLocalidadDesN.Text := DMAF.DisplayDescrip('dspTGE', 'ACF120', '*', xCondicion, 'LocDes');
   If trim(edtLocalidadDesN.Text) = '' Then
   Begin
      dblcLocalidadN.SetFocus;
      If trim(dblcLocalidadN.text) = '' Then
      Begin
         Showmessage('Ingrese Localidad');
         exit;
      End
      Else
      Begin
         Showmessage('Localidad invalida');
         exit;
      End;
   End;
   Filtracds(DMAF.cdsLocalidad, 'SELECT * FROM ACF121 WHERE LOCID=''' + dblcLocalidadN.TEXT + '''');
End;

Procedure TFMaestro.TabSheet3Show(Sender: TObject);
Begin
   Screen.Cursor := CrHourGlass;
   dbgCompuesto.Selected.Clear;
   dbgCompuesto.Selected.Add('CIAID'#9'4'#9'Cía'#9'F');
   dbgCompuesto.Selected.Add('ACFID'#9'8'#9'Id.~Activo'#9'F');
   dbgCompuesto.Selected.Add('ACFDES'#9'15'#9'Activo Fijo'#9'F');
   dbgCompuesto.Selected.Add('TACFID'#9'8'#9'Tipo~A.Fijo'#9'F');
   dbgCompuesto.Selected.Add('ACFFECADQ'#9'11'#9'Fecha~Adquisición'#9'F');
   dbgCompuesto.Selected.Add('ACFMARCA'#9'12'#9'Marca'#9'F');
   dbgCompuesto.Selected.Add('ACFMODELO'#9'12'#9'Modelo'#9'F');
   dbgCompuesto.Selected.Add('ACFSERIE'#9'12'#9'Serie'#9'F');
   dbgCompuesto.Selected.Add('CCOSID'#9'10'#9'Centro~Costo'#9'F');
   dbgCompuesto.Selected.Add('CUENTAID'#9'12'#9'Cuenta~Contable'#9'F');
   dbgCompuesto.Selected.Add('PROV'#9'12'#9'Proveedor'#9'F');
   dbgCompuesto.Selected.Add('DOCID'#9'4'#9'Id.~Doc.'#9'F');
   dbgCompuesto.Selected.Add('ACFSERIEDO'#9'6'#9'Nº~Serie'#9'F');
   dbgCompuesto.Selected.Add('ACFNODOC'#9'12'#9'Nº~Documento'#9'F');
   dbgCompuesto.Selected.Add('ACFTIPADQ'#9'5'#9'Tipo~Adqu.'#9'F');
   dbgCompuesto.Selected.Add('TMONID'#9'6'#9'Tipo~Moneda'#9'F');
   dbgCompuesto.Selected.Add('ACFVALOMO'#9'12'#9'Valor~M.Orig.'#9'F');
   dbgCompuesto.Selected.Add('ACFVALOMN'#9'12'#9'Valor~M.Nacional'#9'F');
   dbgCompuesto.Selected.Add('ACFVALOME'#9'12'#9'Valor~M.Extranj.'#9'F');
   dbgCompuesto.Selected.Add('ACFCAMBIO'#9'10'#9'Tipo~Cambio'#9'F');
   dbgCompuesto.Selected.Add('ACFFECINS'#9'11'#9'Fecha~Instalación'#9'F');
   dbgCompuesto.Selected.Add('ACFFLAGACT'#9'5'#9'Flag~Activo'#9'F');
   dbgCompuesto.Selected.Add('ACFFREG'#9'11'#9'Fecha~Registro'#9'F');
   dbgCompuesto.Selected.Add('ACFHREG'#9'11'#9'Hora~Registro'#9'F');
   dbgCompuesto.Selected.Add('ACFUSER'#9'10'#9'Usuario'#9'F');
   dbgCompuesto.Selected.Add('ACFDESL'#9'30'#9'Activo Fijo~Descripción Larga'#9'F');
   dbgCompuesto.Selected.Add('TACFVIDA'#9'6'#9'Vida~Util'#9'F');
// obc   dbgCompuesto.Selected.Add('UBICID'#9'10'#9'Ubicación'#9'F');
   dbgCompuesto.Selected.Add('LOCID'#9'10'#9'Localidad'#9'F');
   dbgCompuesto.Selected.Add('PISO'#9'10'#9'Piso'#9'F');
   dbgCompuesto.Selected.Add('AREA'#9'10'#9'Area'#9'F');
   dbgCompuesto.Selected.Add('AMBCOD'#9'10'#9'Ambiente'#9'F');
   dbgCompuesto.Selected.Add('MATERIALID'#9'5'#9'Material'#9'F');
   dbgCompuesto.Selected.Add('ACFFINIDEP'#9'11'#9'Fecha Ini.~Depreciación'#9'F');
   dbgCompuesto.Selected.Add('FECANOMES'#9'6'#9'Año~Mes'#9'F');
   dbgCompuesto.Selected.Add('ACFREFOR'#9'6'#9'Nº~Reforma'#9'F');

   xSQL := 'SELECT * FROM ACF201 WHERE CIAID=''' + edtCia3.Text + ''' and '
      + 'ACFIDCOMP=''' + edtAct3.Text + ''' and ' //Grupo Compuesto
      + '(ACFFLACOMP<>''S'' OR ACFFLACOMP IS NULL ) ' //Flag Compuesto'S'
      + 'ORDER BY ACFID'; //solo en cabecera.

   DMAF.cdsActFij3.Close;
   DMAF.cdsActFij3.DataRequest(xSQL);
   DMAF.cdsActFij3.Open;
   dbgCompuesto.Setfocus;
   Screen.Cursor := CrDefault;
End;

Procedure TFMaestro.TabSheet2Show(Sender: TObject);
Begin
   dbgDepre.Selected.Clear;
   dbgDepre.Selected.Add('DEPFECDEPR'#9'11'#9'Fecha~Depreciación'#9'F');
   dbgDepre.Selected.Add('FAPERIODO'#9'6'#9'Perido'#9'F');
   dbgDepre.Selected.Add('FAREDONDEO'#9'8'#9'Factor'#9'F');
   dbgDepre.Selected.Add('TACFDEPREC'#9'6'#9'( % )~Deprec.'#9'F');
   dbgDepre.Selected.Add('DEPVALHIST'#9'12'#9'Valor~Historico'#9'F');
   dbgDepre.Selected.Add('DEPVALAJUS'#9'12'#9'Valor~Ajustado'#9'F');
   dbgDepre.Selected.Add('DEPNOMESES'#9'5'#9'Meses'#9'F');
   dbgDepre.Selected.Add('DEPANTAJUS'#9'12'#9'Saldo Anterior~Ajustado'#9'F');
   dbgDepre.Selected.Add('DEPIMPAJUS'#9'12'#9'Depreciación~Ajustado'#9'F');
   dbgDepre.Selected.Add('DEPACUAJUS'#9'12'#9'Deprec.Acum.~Ajustada'#9'F');
   dbgDepre.Selected.Add('DEPNETOAJU'#9'12'#9'Valor Neto.~Ajustado'#9'F');
   dbgDepre.Selected.Add('CCOSID'#9'8'#9'Centro~Costo'#9'F');
   dbgDepre.Selected.Add('AFDEPREP'#9'8'#9'( % )~C.Costro'#9'F');
   dbgDepre.Selected.Add('AFCOD'#9'10'#9'Codigo~Distribución'#9'F');
   dbgDepre.Selected.Add('LOCID'#9'10'#9'Localidad'#9'F');
   dbgDepre.Selected.Add('PISO'#9'10'#9'Piso'#9'F');
   dbgDepre.Selected.Add('AREA'#9'10'#9'Area'#9'F');
   dbgDepre.Selected.Add('AMBCOD'#9'10'#9'Ambiente'#9'F');
// obc   dbgDepre.Selected.Add('UBICID'#9'10'#9'Ubicación'#9'F');
   dbgDepre.Selected.Add('DEPFLAGPRO'#9'06'#9'Flag~Pro.'#9'F');
   dbgDepre.Selected.Add('DEPCOD'#9'06'#9'Tipo~Depre.'#9'F');
   dbgDepre.Selected.Add('ACFREFOR'#9'6'#9'Nº~Reforma'#9'F');
   dbgDepre.Selected.Add('CUENTAID'#9'12'#9'Cuenta~Contable'#9'F');
   dbgDepre.Selected.Add('DEPFECPRO'#9'11'#9'Fecha~Proceso'#9'F');
   dbgDepre.Selected.Add('DEPHREG'#9'10'#9'Hora de~Registro'#9'F');
   dbgDepre.Selected.Add('DEPUSER'#9'5'#9'Usuario.'#9'F');
End;

Procedure TFMaestro.dbeReforExit(Sender: TObject);
Begin
   {
   if xCrea then exit;
   if dbeAcfId.Focused   then Exit;
   if dbeTipAct.Focused then Exit;
   }

   If (Length(wretorno) > 0) And (dbeRefor.Text <> 'R') Then
   Begin
      dbeRefor.SetFocus; ///problema
      showmessage('Activo Fijo debe Tener Reforma');
      Flagerr := 1;
      exit;
   End;

   If xxflag <> '1' Then
      ProcesoRefor;
End;

Procedure TFMaestro.dbeMotivoEnter(Sender: TObject);
Begin
   strTmp := TCustomEdit(Sender).Text;
End;

Procedure TFMaestro.dbeMotivoExit(Sender: TObject);
Var
   xWherex: String;
Begin
   If xCrea Then Exit;
   If bbtncancela4.Focused Then Exit;

   Tmp := strTmp;
   dbeMotivo.Text := trim(dbeMotivo.Text);
   If trim(dbeMotivo.Text) = '' Then
   Begin
      dbeMotivo.SetFocus;
      strTmp := Tmp;
      showmessage('Ingrese Motivo');
      exit;
   End;

   If trim(dbeMotivo.Text) <> strTmp Then
   Begin
      If Not DMAF.cdsMotivo.locate('MOTID', VarArrayOf([dbeMotivo.text]), []) Then
      Begin
         dbeMotivo.SetFocus;
         strTmp := Tmp;
         showmessage('Motivo No Registrado en Sistema');
         exit;
      End
      Else
      Begin
         edtMot.Text := DMAF.cdsMotivo.fieldbyname('MOTDES').AsString;
         DMAF.cdsTraslado.FieldByName('EXTERNO').AsString := 'N';
         DMAF.cdsTraslado.FieldByName('TRAMOTIVO').AsString := DMAF.cdsMotivo.fieldbyname('MOTDES').AsString;
         DMAF.cdsTraslado.FieldByName('FPROVE').AsString := DMAF.cdsMotivo.fieldbyname('FREPARACION').AsString;

         dbcbExt.Enabled := True;
         pnlTra1.Enabled := True;
         pnlTra2.Enabled := True;
         pnlTra3.Enabled := True;

         If DMAF.cdsMotivo.fieldbyname('FREPARACION').AsString = 'S' Then
         Begin

            DMAF.cdsTraslado.FieldByName('EXTERNO').AsString := 'S';
            dbcbExt.Enabled := False;

            DMAF.cdsTraslado.fieldbyname('CCOSID').AsString := edtCCos5.Text;
            xWherex := 'CCosId=' + '''' + dblcdCCostoN.Text + '''';
            edtCCosDes.Text := DMAF.DisplayDescrip('dspTGE', 'TGE203', '*', xWherex, 'CCosAbr');

// obc            DMAF.cdsTraslado.fieldbyname('UBICID').clear;
            DMAF.cdsTraslado.fieldbyname('LOCID').clear;
            DMAF.cdsTraslado.fieldbyname('PISO').clear;
            DMAF.cdsTraslado.fieldbyname('AREA').clear;
            DMAF.cdsTraslado.fieldbyname('AMBCOD').clear;
// obc            edtUbicacionDesN.Text:='';
            edtLocalidadDesN.Text := '';
            edtPisoDesN.Text := '';
            edtAreaDesN.Text := '';
            edtAmbienteDesN.Text := '';

            If (dbeRecibe.Text <> '') And (dbeRecibe.LookupTable <> DMAF.cdsProvee) Then
            Begin
               DMAF.cdsTraslado.fieldbyname('RECIBEID').clear;
               DMAF.cdsTraslado.fieldbyname('TRARECIBE').clear;
            End;
            dbeRecibe.LookupField := '';
            dbeRecibe.LookupTable := DMAF.cdsProvee;
            dbeRecibe.LookupField := 'PROV';
            With dbeRecibe.Selected Do
            Begin
               Clear;
               Add('PROV'#9'12'#9'Código'#9'F');
               Add('PROVDES'#9'30'#9'Proveedor'#9'F');
               Add('PROVABR'#9'15'#9'Abr.'#9'F');
            End;

            pnlTra1.Enabled := True;
            pnlTra2.Enabled := False;
            pnlTra3.Enabled := True;
            dbeAutoriza.SetFocus;
         End
         Else
         Begin
            If (dbeRecibe.Text <> '') And (dbeRecibe.LookupTable <> DMAF.cdsTrab) Then
            Begin
               DMAF.cdsTraslado.fieldbyname('RECIBEID').clear;
               DMAF.cdsTraslado.fieldbyname('TRARECIBE').clear;
            End;
            dbeRecibe.LookupField := '';
            dbeRecibe.LookupTable := DMAF.cdsTrab;
            dbeRecibe.LookupField := 'TRABID';
            With dbeRecibe.Selected Do
            Begin
               Clear;
               Add('TRABID'#9'6'#9'Código'#9'F');
               Add('TRABNOM'#9'15'#9'Nombre'#9'F');
               Add('CARGO'#9'15'#9'Cargo'#9'F');
            End;
         End;
      End;
   End;
End;

Procedure TFMaestro.dbeRecibeEnter(Sender: TObject);
Begin
   strTmp := TCustomEdit(Sender).Text;
End;

Procedure TFMaestro.dbeRecibeExit(Sender: TObject);
Begin
   If xCrea Then Exit;
   If bbtncancela4.Focused Then Exit;
   If dbeMotivo.Focused Then Exit;
   If dbcbExt.Focused Then Exit;

   Tmp := strTmp;
   dbeRecibe.Text := trim(dbeRecibe.Text);
   If trim(dbeRecibe.Text) = '' Then
   Begin
      dbeRecibe.SetFocus;
      strTmp := Tmp;
      showmessage('Ingrese Código de Destinatario');
      exit;
   End;
   If trim(dbeRecibe.Text) <> strTmp Then
   Begin
      If Not dbeRecibe.LookupTable.locate(dbeRecibe.LookupField,
         VarArrayOf([dbeRecibe.text]), []) Then
      Begin
         If dbeMotivo.Focused Then
         Begin
            If DMAF.cdsTraslado.fieldbyname('RECIBEID').AsString <> strTmp Then
               DMAF.cdsTraslado.fieldbyname('RECIBEID').AsString := strTmp;
            Exit;
         End;
         dbeRecibe.SetFocus;
         strTmp := Tmp;
         showmessage('Ingrese Código de Destinatario');
         exit;
      End
      Else
      Begin
         If dbeRecibe.LookupTable = DMAF.cdsProvee Then
         Begin
            DMAF.cdsTraslado.FieldByName('CLAUXID').AsString :=
               dbeRecibe.LookupTable.fieldbyname('CLAUXID').AsString;
            DMAF.cdsTraslado.FieldByName('TRARECIBE').AsString :=
               dbeRecibe.LookupTable.fieldbyname('PROVDES').AsString;
         End
         Else
         Begin
            DMAF.cdsTraslado.FieldByName('CLAUXID').Clear;
            DMAF.cdsTraslado.FieldByName('TRARECIBE').AsString :=
               dbeRecibe.LookupTable.fieldbyname('TRABNOM').AsString;
         End;
      End;
   End;
End;

Procedure TFMaestro.dbeMotivoChange(Sender: TObject);
Begin
   If dbemotivo.Focused Then
      dbeRecibe.Enabled := true;
End;

Procedure TFMaestro.FormCreate(Sender: TObject);
Begin
   Filtracds(DMAF.cdsQry7, 'SELECT * FROM ACF124 '); // Denominacion

   dblcDes.Selected.Clear;
   dblcDes.LookupField := '';
   dblcDes.LookupTable := DMAF.CdsQry7;
   dblcDes.LookupField := 'DENOMINACI';

   dblcDes.Selected.Add('DENOMINACI' + #9 + '43' + #9 + 'Denominacion');
   dblcDes.Selected.Add('TACF' + #9 + '10' + #9 + 'Tipo Act.');

   If Not DMAF.cdsMotivo.Active Then
      DMAF.cdsMotivo.Open;
   If Not DMAF.cdsTrab.Active Then
      DMAF.cdsTrab.Open;

   If Not DMAF.cdsPiso.Active Then
   Begin
      Filtracds(DMAF.cdsPiso, 'SELECT * FROM ACF121 where LocId=' + '''' + dblcLocalidad.Text + '''');
     //DMAF.cdsPiso.Open ;
   End;
   If Not DMAF.cdsArea.Active Then
   Begin
      Filtracds(DMAF.cdsArea, 'SELECT * FROM ACF122 WHERE ' +
         ' LOCID=' + quotedstr(dblcLocalidad.Text) +
         ' AND PISO=' + quotedstr(dblcPiso.Text));
     //DMAF.cdsArea.Open ;
   End;
   If Not DMAF.cdsAmbiente.Active Then
   Begin
      Filtracds(DMAF.cdsAmbiente, 'SELECT * FROM ACF123 WHERE ' +
         ' LOCID=' + quotedstr(dblcLocalidad.Text) +
         ' AND PISO=' + quotedstr(dblcPiso.Text) +
         ' AND AREA=' + quotedstr(dblcArea.Text));
     //DMAF.cdsAmbiente.Open ;
   End;
   If Not DMAF.cdsResponsable.Active Then
   Begin
      DMAF.cdsResponsable.Open;
   End;
End;

Procedure TFMaestro.FormDestroy(Sender: TObject);
Begin
   If DMAF.cdsTraslado.IndexName = 'XXX' Then
      DMAF.cdsTraslado.DeleteIndex('XXX');
End;

Procedure TFMaestro.QuitaFlagTraslado;
Begin
   With DMAF.cdsTraslado Do
   Begin
      If recordcount = 0 Then
         Exit;

      First;
      Edit;
      Fieldbyname('F_ULTIMO').AsString := 'N';
      Post;
   End;
End;

Procedure TFMaestro.ActualizacabTraslados;
Begin
   edtCCos5.Text := dblcdCCostoN.Text;
   edtcCosD5.Text := edtCCosDes.Text;
// obc     edtUbi5.Text    := dblcUbicacionN.Text ;
//    edtUbiD5.Text   := edtUbicacionDesN.Text ;
   edtCia5.Text := dblcCiaN.Text;
   edtCiaD5.Text := edtCiaDesN.Text;
   edtLoc5.Text := dblcLocalidadN.Text;
   edtLocD5.Text := edtLocalidadDesN.Text;
   edtPiso5.Text := dblcPisoN.Text;
   edtPisoD5.Text := edtPisoDesN.Text;
   edtArea5.Text := dblcAreaN.Text;
   edtAreaD5.Text := edtAreaDesN.Text;
   edtAmbiente5.Text := dblcAmbienteN.Text;
   edtAmbienteD5.Text := edtAmbienteDesN.Text;
End;

Procedure TFMaestro.Z2bbtnImprimeClick(Sender: TObject);
Var
   cds: TwwClientdataset;
   xCCOSID_ANT, xCCOSDE_ANT,
      xUBICID_ANT, xUBICDE_ANT,
      xRECIBEID_ANT: String;
   xRECIBEDE_ANT: String;
   xRECIBECA_ANT: String;
Begin
// obc falta corregir
   cds := TwwClientDataSet.Create(self);
   cds.CloneCursor(DMAF.cdsTraslado, false);

   If cds.RecordCount > 1 Then
   Begin
      cds.Next;

      xCondicion := 'CCosId=' + '''' + cds.fieldbyname('CCOSID').AsString + '''';
      xCCOSID_ANT := cds.fieldbyname('CCOSID').AsString;
      xCCOSDE_ANT := DMAF.DisplayDescrip('dspTGE', 'TGE203', '*', xCondicion, 'CCosDes');

      xCondicion := 'UbicId=' + '''' + cds.fieldbyname('UBICID').AsString + '''';
      xUBICID_ANT := cds.fieldbyname('UBICID').AsString;
      xUBICDE_ANT := DMAF.DisplayDescrip('dspTGE', 'TGE117', '*', xCondicion, 'UbicDes');

      If cds.fieldbyname('FPROVE').AsString = 'S' Then
      Begin
         xCondicion := 'PROV=' + '''' + cds.fieldbyname('RECIBEID').AsString + '''';
         xRECIBEID_ANT := cds.fieldbyname('RECIBEID').AsString;
         xRECIBEDE_ANT := DMAF.DisplayDescrip('dspTGE', 'TGE201', '*', xCondicion, 'PROVDES');
         xRECIBECA_ANT := 'PROVEEDOR';
      End
      Else
      Begin
         xCondicion := 'RECIBEID=' + '''' + cds.fieldbyname('RECIBEID').AsString + '''';
         xRECIBEID_ANT := cds.fieldbyname('RECIBEID').AsString;
         xRECIBEDE_ANT := DMAF.DisplayDescrip('dspTGE', 'ACF126', '*', xCondicion, 'RECIBENOM');
//OBC 20050621        xRECIBECA_ANT:='CARGO : '+DMAF.cdsQry.FieldByName('CARGO').AsString;
      End;
   End
   Else
   Begin
      xCondicion := 'CCosId=' + '''' + DMAF.cdsTraslado.fieldbyname('TRANCCOS').AsString + '''';
      xCCOSID_ANT := DMAF.cdsTraslado.fieldbyname('TRANCCOS').AsString;
      xCCOSDE_ANT := DMAF.DisplayDescrip('dspTGE', 'TGE203', '*', xCondicion, 'CCosDes');

      xCondicion := 'UbicId=' + '''' + DMAF.cdsTraslado.fieldbyname('TRANUBICA').AsString + '''';
      xUBICID_ANT := DMAF.cdsTraslado.fieldbyname('TRANUBICA').AsString;
      xUBICDE_ANT := DMAF.DisplayDescrip('dspTGE', 'TGE117', '*', xCondicion, 'UbicDes');

      xRECIBEID_ANT := '';
      xRECIBEDE_ANT := '';
      xRECIBECA_ANT := '';
   End;
   cds.free;

   pprTraslados.template.fileName := ExtractFilePath(application.ExeName) + wRutaRpt + 'ACF\DEMA\ACFTransladoActivo_A4.rtm';

//  pprTraslados.template.fileName:=ExtractFilePath( application.ExeName )+'SolFormatos\ACFTransladoActivo_A4.rtm';
   pprTraslados.template.LoadFromFile;

   pplFecha.Caption := DatetoStr(DMAF.cdstraslado.fieldbyname('TRAFECHA').Value);
   pplMovimiento.Caption := DMAF.cdstraslado.fieldbyname('TRADOCMTO').AsString;
   ppchkexterno.Checked := (DMAF.cdstraslado.fieldbyname('EXTERNO').AsString = 'S');
   ppChkinterno.Checked := Not ppchkexterno.Checked;
   pplCodigo.Caption := DMAF.cdstraslado.fieldbyname('ACFID').AsString + '  '
      + DMAF.cdsActFij.FieldByName('ACFDES').AsString;
   pplCodigoBarras.Caption := DMAF.cdsActFij.fieldbyname('ARTCODBAR').AsString;

   xCondicion := 'CCosId=' + '''' + DMAF.cdsTraslado.fieldbyname('CCOSID').AsString + '''';
   pplCCostoDestino.Caption := DMAF.cdstraslado.fieldbyname('CCOSID').AsString;
   pplCCostoDes.Caption := DMAF.DisplayDescrip('dspTGE', 'TGE203', '*', xCondicion, 'CCosDes');

   xCondicion := 'UbicId=' + '''' + DMAF.cdsTraslado.fieldbyname('UBICID').AsString + '''';
   pplUbicacionDestino.Caption := DMAF.cdstraslado.fieldbyname('UBICID').AsString;
   pplUbicaDes.Caption := DMAF.DisplayDescrip('dspTGE', 'TGE117', '*', xCondicion, 'UbicDes');

   pplEmpleadoDestino.Caption := DMAF.cdstraslado.fieldbyname('RECIBEID').AsString;
   pplEmpDes.Caption := DMAF.cdstraslado.fieldbyname('TRARECIBE').AsString;
   pplMarca.Caption := DMAF.cdsActFij.FieldByname('ACFMARCA').asString;
   pplModelo.Caption := DMAF.cdsActFij.FieldByname('ACFMODELO').asString;
   pplSerie.Caption := DMAF.cdsActFij.FieldByname('ACFSERIE').asString;
   If DMAF.cdstraslado.fieldbyname('FPROVE').AsString = 'S' Then
   Begin
      xCondicion := 'PROV=' + '''' + DMAF.cdstraslado.fieldbyname('RECIBEID').AsString + '''';
      pplCargoDes.Caption := 'PROVEEDOR';
   End
   Else
   Begin
      xCondicion := 'TRABID=' + '''' + DMAF.cdstraslado.fieldbyname('RECIBEID').AsString + '''';
      pplCargoDes.Caption := DMAF.DisplayDescrip('dspTGE', 'ACF207', '*', xCondicion, 'CARGO');
   End;

   pplMotivo.Caption := DMAF.cdstraslado.fieldbyname('TRAMOTIVO').AsString;

   pplCCostoOrigen.Caption := xCCOSID_ANT;
   pplCCostoDesAnt.Caption := xCCOSDE_ANT;
   pplUbicacionOrigen.Caption := xUBICID_ANT;
   pplUbicaDesAnt.Caption := xUBICDE_ANT;
   pplEmpleadoOrigen.Caption := xRECIBEID_ANT;
   pplEmpOri.Caption := xRECIBEDE_ANT;
   pplCargoOri.Caption := xRECIBECA_ANT;

   pprTraslados.Print;
   pprTraslados.Stop;
End;

Procedure TFMaestro.dbgTrasladoDblClick(Sender: TObject);
Var
   xSQL: String;
Begin
//obc 18102005 se desactiva el mantenimiento de traslados,
// solo debe funcionar a traves del Control Operativo
   If DMAF.cdsTraslado.RecordCount = 0 Then Exit;

   xTab5 := False;

   If (DMAF.cdsTraslado.fieldbyname('TRAESTADO').AsString = 'P')
      And (DMAF.cdsTraslado.fieldbyname('F_ULTIMO').AsString = 'S') Then
   Begin
      If DMAF.cdsTraslado.FieldByName('FPROVE').AsString = 'S' Then
      Begin
         DMAF.cdsTraslado.Edit;
         DMAF.cdsTraslado.fieldbyname('CCOSID').clear;
// obc        DMAF.cdsTraslado.fieldbyname('UBICID').clear;
         DMAF.cdsTraslado.fieldbyname('LOCID').clear;
         DMAF.cdsTraslado.fieldbyname('PISO').clear;
         DMAF.cdsTraslado.fieldbyname('AREA').clear;
         DMAF.cdsTraslado.fieldbyname('AMBCOD').clear;
         edtCCosDes.Text := '';
// obc        edtUbicacionDesN.Text:='';
         edtLocalidadDesN.Text := '';
         edtPisoDesN.Text := '';
         edtAreaDesN.Text := '';
         edtAmbienteDesN.Text := '';

         pnlTra1.Enabled := True;
         pnlTra2.Enabled := False;
         pnlTra3.Enabled := True;
      End;

      If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
      Begin
         xSQL :=
            'SELECT TGE203.CCOSABR , TGE126.LOCABR, ACF112.PISODES, ACF113.AREADES, ACF114.AMBDES '
            + 'FROM ACF202 '
            + 'LEFT JOIN TGE203 ON ( ACF202.CCOSID= TGE203.CCOSID ) '
            + 'LEFT JOIN TGE126 ON ( ACF202.LOCID = TGE126.LOCID  ) '
            + 'LEFT JOIN ACF112 ON ( ACF202.PISO  = ACF112.PISO   ) '
            + 'LEFT JOIN ACF113 ON ( ACF202.AREA  = ACF113.AREA   ) '
            + 'LEFT JOIN ACF114 ON ( ACF202.AMBCOD= ACF114.AMBCOD ) '
            + 'WHERE ACF202.CIAID=''' + DMAF.cdsTraslado.fieldbyname('CIAID').AsString + ''' '
            + 'AND ACF202.ACFID=''' + DMAF.cdsTraslado.fieldbyname('ACFID').AsString + ''' '
            + 'AND ACF202.TRAORDEN=' + DMAF.cdsTraslado.fieldbyname('TRAORDEN').AsString;
      End;

      If (SRV_D = 'ORACLE') Then
      Begin
         xSQL :=
            ' SELECT B.CCOSABR , D.LOCDES '
            + ' FROM ACF202 A,TGE203 B,ACF120 C, ACF121 D, ACF122 E, ACF123 F '
            + ' WHERE A.CCOSID=B.CCOSID(+) '
            + ' AND  A.LOCID = C.LOCID(+)  '
            + ' AND  A.PISO  = D.PISO(+)  '
            + ' AND  A.AREA  = E.AREA(+)  '
            + ' AND  A.AMBCOD= F.AMBCOD(+)  '
            + ' AND A.CIAID = ''' + DMAF.cdsTraslado.fieldbyname('CIAID').AsString + ''' '
            + ' AND A.ACFID = ''' + DMAF.cdsTraslado.fieldbyname('ACFID').AsString + ''' '
            + ' AND A.TRAORDEN = ' + DMAF.cdsTraslado.fieldbyname('TRAORDEN').AsString;
      End;

      DMAF.cdsQry.close;
      DMAF.cdsQry.DataRequest(xSQL);
      DMAF.cdsQry.Open;
      If DMAF.cdsQry.RecordCount <> 0 Then
      Begin
         edtCCosDes.Text := DMAF.cdsQry.fieldbyname('CCOSABR').AsString;
// OBC        edtUbicacionDesN.Text  := DMAF.cdsQry.fieldbyname('UBICABR').AsString ;
         edtLocalidadDesN.Text := DMAF.cdsQry.fieldbyname('LOCDES').AsString;
         edtPisoDesN.Text := DMAF.cdsQry.fieldbyname('PISODES').AsString;
         edtAreaDesN.Text := DMAF.cdsQry.fieldbyname('AREADES').AsString;
         edtAmbienteDesN.Text := DMAF.cdsQry.fieldbyname('AMBDES').AsString;
      End;

     //////***********************************************************
      dbgTraslado.Enabled := False; // deshabilita dbgrid va a ADICION
      pnlCabTraslado.Enabled := False;
//     pnlActTraslado.Visible:=True;
//     pnlActTraslado.Enabled:=True;
      dbeRecibe.Enabled := False;
      Z2bbtnImprime.Enabled := True;
     //////***********************************************************
   End
   Else
   Begin
      showmessage('Solo se Puede Modificar el Último Traslado Ingresado ' + #13 +
         '              Que no esté Aceptado');
   End;
End;

Procedure TFMaestro.pprTrasladosPrintingComplete(Sender: TObject);
Begin
//
End;

Procedure TFMaestro.Z2bbtnGrabaClick(Sender: TObject);
Var
   xSQL, xNumTras: String;
Begin
   ConsistenciaTraslado;

// grabación de TRASLADOS OK.
   DMAF.cdsTraslado.Edit;
   DMAF.cdsTraslado.FieldByName('TraHReg').Value := Time;
   DMAF.cdsTraslado.FieldByName('TraFReg').Value := Date;
   DMAF.cdsTraslado.FieldByName('TraUser').Value := DMAF.wUsuario;
   DMAF.cdsTraslado.FieldByName('F_ULTIMO').AsString := 'S';
   DMAF.cdsTraslado.FieldByName('TRAESTADO').AsString := 'P';

   //      DMAF.cdsActFij.DataRequest( 'SELECT * FROM ACF201 WHERE ACFID='''+dbeACFID.TEXT+'''' );
   xSQL := 'SELECT * FROM ACF202 WHERE ACFID=''' + dbeACFID.TEXT + ''''; //AÑADIDO POR ANAX
   DMAF.cdsTraslado.DataRequest(xSQL);

   If DMAF.cdsTraslado.State = dsEdit Then // Modificacion
   Begin
      DMAF.AplicaDatos(DMAF.cdsTraslado, 'TRASLADO');
   End
   Else
   Begin

      DMAF.cdsTraslado.FieldByName('CiaId').Value := dblcCia.Text;

      If dbeTipAct.Text = '' Then
         DMAF.cdsTraslado.FieldByName('TAcFId').Clear
      Else
         DMAF.cdsTraslado.FieldByName('TAcFId').Value := dbeTipAct.Text;

      DMAF.cdsTraslado.FieldByName('AcFId').Value := dbeAcFid.Text;

      If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
      Begin
         xSQL := 'Select COALESCE( Max( TRADOCMTO ), ''0'' ) as NUMMAX from ACF202 ';
      End;
      If (SRV_D = 'ORACLE') Then
      Begin
         xSQL := 'Select ' + DMAF.wReplacCeros + '(max(to_number(TRADOCMTO)),''0'')  as NUMMAX from ACF202';
      End;
      DMAF.cdsQry.Close;
      DMAF.cdsQry.DataRequest(xSQL);
      DMAF.cdsQry.Open;
      xNumTras := DMAF.StrZero(DMAF.cdsQry.FieldByName('NUMMAX').AsInteger + 1, 8);
      DMAF.cdsTraslado.FieldByName('TRADOCMTO').Value := xNumTras;

      cdsPost(DMAF.cdsTraslado);

      DMAF.AplicaDatos(DMAF.cdsTraslado, 'TRASLADO'); // Adiciona Traslado

   End;
   Z2bbtnImprime.Enabled := True;
//   Showmessage('Traslado Registrado');
   xTab5 := True;
End;

Procedure TFMaestro.Z2bbtnImprimeCabClick(Sender: TObject);
Begin
//
   If DMAF.cdsTraslado.RecordCount = 0 Then
   Begin
      showmessage('No Hay Traslado a Emitir');
   End;
   DMAF.cdsTraslado.First;
   Z2bbtnImprime.OnClick(Z2bbtnImprime);
End;

Procedure TFMaestro.HabilitaEdicion;
Begin
   dblcdCCostoN.Enabled := xHabilita;
// obc     dblcUbicacionN.Enabled := xHabilita ;
   dblcCiaN.Enabled := xHabilita;
   dblcLocalidadN.Enabled := xHabilita;
   dblcPisoN.Enabled := xHabilita;
   dblcAreaN.Enabled := xHabilita;
   dblcAmbienteN.Enabled := xHabilita;
//    dbedocmtoT.Enabled     := xHabilita ;
End;

Procedure TFMaestro.dbdtpTrasladoExit(Sender: TObject);
Begin
   If xCrea Then Exit;
   If bbtncancela4.Focused Then Exit;

   If Length(dbdtpTraslado.Text) = 0 Then
   Begin
      dbdtpTraslado.SetFocus;
      showmessage('Falta Fecha de Traslado');
   End;
End;

Procedure TFMaestro.dbeBarraExit(Sender: TObject);
Var
   xresult: String;
Begin
   If xCrea Then exit;

   If dblcCia.focused Then exit;

   If Length(dbeBarra.Text) = 0 Then
   Begin
      dbeBarra.SetFocus;
      showmessage('Ingrese Codigo de Barras');
      Flagerr := 1;
      exit;
   End;

   If DMAF.wModo = 'A' Then
   Begin

      DMAF.cdsActFij.fieldbyname('ARTCODBAR').ASSTRING := DMAF.strzero(StrToInt(dbeBarra.text), 6);
      dbeBarra.text := DMAF.cdsActFij.fieldbyname('ARTCODBAR').ASSTRING;
      xCondicion := 'ARTCODBAR=''' + dbeBarra.Text + ''''; // obc AND CIAID='''+dblcCia.Text+'''';
      xresult := (DMAF.DisplayDescrip('dspTGE', 'ACF201', 'ARTCODBAR', xCondicion, 'ARTCODBAR'));

      If length(xresult) > 0 Then
      Begin
         ShowMessage('Código de Barra Duplicado');
         dbebarra.SetFocus;
         Flagerr := 1;
         exit;
      End;

   End;

{   if DMAF.wModo='A' then
   begin
      if DMAF.DisplayDescrip('dspTGE','ACF201','ARTCODBAR',xCondicion,'ARTCODBAR')<>'' then
      begin
         ShowMessage('Error : Código de Barra ya Fue Registrado');
         dbebarra.SetFocus;
      end;
   end
   else
   begin
      if DMAF.DisplayDescrip('dspTGE','ACF201','ARTCODBAR',xCondicion,'ARTCODBAR')=wCodBarra then // obc dbeBarra.Text then
      else
      begin
         if DMAF.DisplayDescrip('dspTGE','ACF201','ARTCODBAR',xCondicion,'ARTCODBAR')<>'' then
         begin
            ShowMessage('Error : Código de Barra ya Fue Registrado');
            dbebarra.SetFocus;
         end;
      end;
   end;
}
{   if DMAF.wModo='A' then
   begin

      xCondicion:='ARTCODBAR='''+dbeBarra.Text+'''';// obc AND CIAID='''+dblcCia.Text+'''';

      if DMAF.DisplayDescrip('dspTGE','ACF201','ARTCODBAR',xCondicion,'ARTCODBAR')<>'' then
      begin
         ShowMessage('Error : Código de Barra ya Fue Registrado');
         dbebarra.SetFocus;
      end;

   end
   else
   begin
}
// obc      xCondicion:='ARTCODBAR='''+dbeBarra.Text  +''' and '
//                 +'CIAID='''    +dblcCIA.Text   +''' and ACFID='''+dbeACFID.Text+''' and '
//                 +'TACFID='''   +dbeTipAct.Text+''' ';
{      xCondicion:='ARTCODBAR='''+dbeBarra.Text+'''';
      if DMAF.DisplayDescrip('dspTGE','ACF201','ARTCODBAR',xCondicion,'ARTCODBAR')=dbeBarra.Text then
      else begin

         xCondicion:='ARTCODBAR='''+dbeBarra.Text+'''';

         if DMAF.DisplayDescrip('dspTGE','ACF201','ARTCODBAR',xCondicion,'ARTCODBAR')<>'' then
         begin
            ShowMessage('Error : Código de Barra ya Fue Registrado');
            dbebarra.SetFocus;
         end;

      end;

   end;}
End;

Procedure TFMaestro.dbdtpFiniDepExit(Sender: TObject);
Var
   xsql: String;
Begin
{  if xCrea then exit;

  xSQL:='select MAX(FAPERIODO)PERIODO,MAX(FAFECDEPRE) FECHADEPREC FROM ACF102 WHERE FAPROC=''P''';
  DMAF.cdsQry.close;
  DMAF.cdsQry.DataRequest(xSQL);
  DMAF.cdsQry.open;

  IF dbdtpFinidep.date <=DMAF.cdsqry.fieldbyname('FECHADEPREC').asdatetime THEN
  begin
      Showmessage('El Periodo ha sido cerrado');
      dbdtpFinidep.text:='';
      dbdtpFinidep.setfocus;
      Exit;
  end

  else
  begin
     if not(dbdtpFinidep.datetime >=dbdtpFecins.datetime) then
     begin
        showmessage('La Fecha de Depreciacion debe ser mayor o igual a la fecha de Instalacion');
        dbdtpFecRecep.SetFocus;
     end;
   end
 }
End;

Procedure TFMaestro.dbdtpFecInsExit(Sender: TObject);
Begin
   If xCrea Then exit;

   If dbdtpFecIns.datetime > 0 Then
   Begin
      If Not (dbdtpFecIns.DateTime >= dbdtpFecRecep.datetime) Then
      Begin
         showmessage('La Fecha de Instalación debe ser mayor o igual a la fecha de recepcion');
         dbdtpFecIns.setfocus;
         flagerr := 1;
         exit;
      End;
   End;
End;

Procedure TFMaestro.dbdtpFecRecepExit(Sender: TObject);
Begin
   If xCrea Then exit;

   If dbdtpFecRecep.datetime > 0 Then
   Begin
      If dbdtpFecRecep.datetime < dbdtpFecAdqui.datetime Then
      Begin
         showmessage('La Fecha de Recepcion no puede ser menor a la Fecha de Adquisicion');
         dbdtpFecRecep.SetFocus;
         flagerr := 1;
         exit;
      End;
   End;
End;

Procedure TFMaestro.dbeValOMOExit(Sender: TObject);
Var
   valex, valor: double;
   cal: real;
Begin
   If (xCrea) And (dbeRefor.Text <> 'R') Then exit;

   If dblcCia.focused Then exit;

   If length(dbeValOMO.text) = 0 Then
   Begin
      dbeValOMO.setfocus;
      Showmessage('Ingrese el Monto Original');
      flagerr := 1;
      exit;
   End;
   If DMAF.cdsActFij.FieldByName('tmonid').asstring = DMAF.wtmonloc Then
   Begin
      dbevalomn.text := '';
      dbevalome.text := '';
      DMAF.cdsActFij.fieldbyname('ACFVALOMN').value := DMAF.cdsActFij.fieldbyname('ACFVALOMO').value;
      DMAF.cdsActFij.fieldbyname('ACFVALOME').value := 0;
      If DMAF.cdsActFij.fieldbyname('ACFCAMBIO').AsFloat > 0 Then
      Begin
         valor := (DMAF.cdsActFij.fieldbyname('ACFVALOMO').value) / (DMAF.cdsActFij.fieldbyname('ACFCAMBIO').value);
         DMAF.cdsActFij.fieldbyname('ACFVALOME').value := fround(valor, 15, 2);
      End;
   End;
   If DMAF.cdsActFij.FieldByName('tmonid').asstring = DMAF.wTMonExt Then
   Begin
      dbevalomn.text := '';
      dbevalome.text := '';
      DMAF.cdsActFij.fieldbyname('ACFVALOME').value := DMAF.cdsActFij.fieldbyname('ACFVALOMO').value;
      DMAF.cdsActFij.fieldbyname('ACFVALOMN').value := 0;
      If DMAF.cdsActFij.fieldbyname('ACFCAMBIO').AsFloat > 0 Then
      Begin
         valex := (DMAF.cdsActFij.fieldbyname('ACFVALOMO').value) * (DMAF.cdsActFij.fieldbyname('ACFCAMBIO').value);
         DMAF.cdsActFij.fieldbyname('ACFVALOMN').value := fround(valex, 15, 2);
      End;
   End;
End;

Procedure TFMaestro.dbeCambioExit(Sender: TObject);
Begin
   If xCrea Then exit;

   If dblcCia.focused Then exit;

   If length(dbecambio.text) = 0 Then
   Begin
      showmessage('Ingrese el valor de cambio');
      dbecambio.enabled := true;
      dbecambio.setfocus;
      flagerr := 1;
      exit;
   End;
{
 dbevalomo.text:='';
 dbevalomn.text:='';
 dbevalome.text:='';
 }
End;

Procedure TFMaestro.dblcLocalidadExit(Sender: TObject);
Var
   xLocal: String;
Begin
   If xCrea Then exit;

   If DMAF.wmodo = 'A' Then
   Begin
      edtLocalidadDes.Text := '';
      dblcPiso.text := '';
      DMAF.cdsActFij.fieldbyname('Piso').asstring := '';
      edtPisoDes.text := '';
      dblcArea.text := '';
      DMAF.cdsActFij.fieldbyname('Area').asstring := '';
      edtAreaDes.text := '';
      dblcAmbiente.text := '';
      DMAF.cdsActFij.fieldbyname('AmbCod').asstring := '';
      edtAmbienteDes.text := '';
      edtLocalidadDes.Text := '';

      If dblcCia.focused Then exit;

      If length(dblcLocalidad.Text) = 0 Then
      Begin
         ShowMessage('Ingrese Localidad');
         dblcLocalidad.SetFocus;
         exit;
      End;
   End;

   xCondicion := 'LocId=' + '''' + dblcLocalidad.Text + '''';
   edtLocalidadDes.Text := BuscaDescripcion(DMAF.cdsLocalidad, xCondicion, 'LocDes');
   edtLocalidadDesN.Text := edtLocalidadDes.Text;

   If DMAF.wmodo = 'A' Then
   Begin
      If length(edtLocalidadDes.Text) = 0 Then
      Begin
         ShowMessage('Localidad invalida');
         dblcLocalidad.SetFocus;
         exit;
      End;
   End;

   Filtracds(DMAF.cdsPiso, 'SELECT * FROM ACF121 where LocId=' + '''' + dblcLocalidad.Text + '''');
End;

Procedure TFMaestro.dblcCiaExit(Sender: TObject);
Begin
   If xCrea Then exit;

//   dblcAmbiente.text:='';
//   DMAF.cdsActFij.fieldbyname('AmbCod').asstring:='';
//   edtAmbienteDes.text:='';

   xCondicion := 'CIAID=' + '''' + dblcCia.Text + '''';
   edtCiaDes.Text := BuscaDescripcion(DMAF.cdsCia, xCondicion, 'CiaAbr');

   If DMAF.wmodo = 'A' Then
   Begin
      If length(edtCiaDes.Text) = 0 Then
      Begin
         dblcCia.setfocus;
         Showmessage('Compañía invalida');
         exit;
      End;
   End;

   Filtracds(DMAF.cdsTipAct, 'SELECT * FROM ACF101 WHERE CIAID=' + quotedstr(wCiaConsol));
   Filtracds(DMAF.cdsLocalidad, 'SELECT * FROM ACF120 ');

   If DMAF.wModo = 'A' Then dblcDes.SetFocus;
End;

Procedure TFMaestro.dblcUbicaxExit(Sender: TObject);
Begin
// obc    if xCrea then exit;
//   xCondicion := 'UbicId='+''''+dblcUbica.Text+'''';
//   if dblcUbica.text<>'' then begin
//      edtUbicacionDes.Text:=BuscaDescripcion( DMAF.cdsUbica, xCondicion, 'UbicDes');
//      if edtUbicacionDes.Text='' then begin
//         ShowMessage('Error : Ubicacion no Existe');
//         dblcUbica.SetFocus;
//      end
//   end
End;

Procedure TFMaestro.dblcMaterialExit(Sender: TObject);
Begin
   If xCrea Then exit;

   edtMaterialDes.text := '';

   If dblcCia.focused Then exit;

{   if length(dblcMaterial.Text) = 0 then
      begin
      showmessage('Ingrese Material');
      dblcMaterial.SetFocus;
      Flagerr:=1;
      exit;
      end;                      }

   xCondicion := 'MaterialId=' + '''' + dblcmaterial.Text + '''';
//   edtMaterialDes.Text:=DMAF.DisplayDescrip('dspTGE','TGE178','*',xCondicion,'MaterDes');
   edtMaterialDes.Text := BuscaDescripcion(DMAF.cdsMaterial, xCondicion, 'MaterDes');

   If length(dblcMaterial.Text) > 0 Then
      If length(edtMaterialDes.Text) = 0 Then
      Begin
         showmessage('Material Invalido');
         dblcMaterial.SetFocus;
         Flagerr := 1;
         exit;
      End;
End;

Procedure TFMaestro.dblcTipAdquiExit(Sender: TObject);
Begin
   If xCrea Then exit;

   edtAdquisicionDes.Text := '';

   If dblcCia.focused Then exit;

// Consistencia Tipo de Adquisición y toma descripción
//   edtAdquisicionDes.Text:=DMAF.DisplayDescrip('dspTGE','TGE177','*',xCondicion,'TipAdAbr');

   If DMAF.wmodo = 'A' Then
   Begin
      If length(dblcTipAdqui.text) = 0 Then
      Begin
         dblcTipAdqui.SetFocus;
         showmessage('Ingrese Clase de Activo');
         flagerr := 1;
         exit;
      End;
   End;

   xCondicion := 'TipAdqui=' + '''' + dblcTipAdqui.Text + '''';
   edtAdquisicionDes.Text := BuscaDescripcion(DMAF.cdsAdqui, xCondicion, 'TipAdAbr');

   If DMAF.wmodo = 'A' Then
   Begin
      If length(edtAdquisicionDes.text) = 0 Then
      Begin
         dblcTipAdqui.SetFocus;
         showmessage('Clase de Activo Invalido');
         flagerr := 1;
         exit;
      End;
   End;
End;

Procedure TFMaestro.dbeSerieExit(Sender: TObject);
Begin
{   if xCrea then exit;

   if length(dbeserie.Text) <> 0 then
      dbeBarra.SetFocus
   else
      showmessage('Falta ingresar el numero de serie');}
End;

Procedure TFMaestro.dblcTipDocExit(Sender: TObject);
Begin
   If (xCrea) And (dbeRefor.Text <> 'R') Then exit;

   If length(dblcTipDoc.text) > 0 Then
   Begin
// Consistencia Tipo de Documento y toma descripción
      xCondicion := 'DocId=' + '''' + dblcTipDoc.Text + '''';
//   edtTipDocDes.Text:=DMAF.DisplayDescrip('dspTGE','TGE110','*',xCondicion,'DocAbr');
      edtTipDocDes.Text := BuscaDescripcion(DMAF.cdsTipDoc, xCondicion, 'DocAbr');
   End;

   If length(dblcTipDoc.text) > 0 Then
      If length(edtTipDocDes.text) = 0 Then
      Begin
         dblcTipDoc.setfocus;
         Showmessage('Tipo de Documento Invalido');
         flagerr := 1;
         exit;
      End;

   dbeseriedoc.enabled := true;
   dbeseriedoc.setfocus;
End;

Procedure TFMaestro.dblcMonedaExit(Sender: TObject);
Begin
   If (xCrea) And (dbeRefor.Text <> 'R') Then exit;

   edtMonedaDes.Text := '';

   If dblcCia.focused Then exit;

   If DMAF.wmodo = 'A' Then
   Begin
      If length(dblcMoneda.text) = 0 Then
      Begin
         dblcMoneda.setfocus;
         Showmessage('Ingrese Moneda');
         flagerr := 1;
         exit;
      End;
   End;

   xCondicion := 'TMonid=' + '''' + dblcMoneda.Text + '''';
//   edtMonedaDes.Text:=DMAF.DisplayDescrip('dspTGE','TGE103','*',xCondicion,'TMonAbr');
   edtMonedaDes.Text := BuscaDescripcion(DMAF.cdsMoneda, xCondicion, 'TMonAbr');

   If DMAF.wmodo = 'A' Then
   Begin
      If length(edtMonedaDes.text) = 0 Then
      Begin
         dblcMoneda.setfocus;
         Showmessage('Moneda Invalida');
         flagerr := 1;
         exit;
      End;
   End;
End;

Procedure TFMaestro.dblcMotivoExit(Sender: TObject);
Begin
   xCondicion := 'DESACID=' + '''' + dblcMOTIVO.Text + '''';
   edtMotivo.Text := DMAF.DisplayDescrip('dspTGE', 'ACF105', '*', xCondicion, 'DesacAbr');
   If length(edtMotivo.Text) = 0 Then
   Begin
      dblcMotivo.setfocus;
      Showmessage('Motivo no Existe');
      exit;
   End;
End;

Procedure TFMaestro.dblcdCuentaExit(Sender: TObject);
Begin
   If xCrea Then exit;

   xCondicion := 'CuentaId=' + '''' + dblcdCuenta.Text + '''';
   edtCuentaDes.Text := DMAF.DisplayDescrip('dspTGE', 'TGE202', '*', xCondicion, 'CtaAbr');
//   edtCuentaDes.Text:=BuscaDescripcion( DMAF.cdsCuenta, xCondicion, 'CTADES');
End;

Procedure TFMaestro.dblcdProveedorExit(Sender: TObject);
Begin
   If xCrea Then exit;

   edtProveedorDes.Text := '';

   If dblcCia.focused Then exit;

   If length(dblcdProveedor.Text) > 0 Then
   Begin
// Consistencia Codigo de Proveedor y toma descripción
      xCondicion := 'Prov=' + '''' + dblcdProveedor.Text + '''';
//   edtProveedorDes.Text:=DMAF.DisplayDescrip('dspTGE','TGE201','*',xCondicion,'ProvAbr');
      edtProveedorDes.Text := BuscaDescripcion(DMAF.cdsProvee, xCondicion, 'PROVDES');

      If length(edtProveedorDes.Text) = 0 Then
      Begin
         ShowMessage('Proveedor invalido');
         dblcdProveedor.SetFocus;
         flagerr := 1;
         exit;
      End;
   End;
End;

Procedure TFMaestro.dblcTipoExit(Sender: TObject);
Begin
   xCondicion := 'DEPCOD=''' + dblcTipoD.Text + '''';
   dbeTipo.Text := DMAF.DisplayDescrip('dspTGE', 'ACF104', 'DEPDESCRI', xCondicion, 'DEPDESCRI');

   If dbeTipo.Text = '' Then
   Begin
      ShowMessage('Falta Tipo de Depreciación');
      dblcTipoD.SetFocus;
      exit;
   End
   Else
   Begin
      // Consulta a la Depreciación
      {
      xSQL:='SELECT * FROM ACF204 '
          +'WHERE CIAID='''   +DMAF.cdsACTFIJ.FieldByName('CIAID').Value   +''' and '
          +      'DEPCOD='''  +DMAF.cdsUDEPDEPCOD.Value    +''' and '
          +      'TACFID='''  +DMAF.cdsACTFIJ.FieldByName('TACFID').Value  +''' and '
          +      'ACFID='''   +DMAF.cdsACTFIJ.FieldByName('ACFID').Value   +''' and '
          +      'ACFREFOR='''+DMAF.cdsACTFIJ.FieldByName('ACFREFOR').Value+''' '
          +'ORDER BY DEPFLAGREF, DEPFECDEPR';
      DMAF.cdsWORK2.Close;
      DMAF.DCOM1.Appserver.EjecutaSQL(xSQL);
      DMAF.cdsWork2.Open;

      TNumericField( DMAF.cdsWork2.FieldByName('FAREDONDEO')  ).DisplayFormat:='### ###.0000';
      TNumericField( DMAF.cdsWork2.FieldByName('TACFDEPREC')  ).DisplayFormat:='### ###.00';
      TNumericField( DMAF.cdsWork2.FieldByName('DEPVALHIST')  ).DisplayFormat:='### ### ###.00';
      TNumericField( DMAF.cdsWork2.FieldByName('DEPVALAJUS')  ).DisplayFormat:='### ### ###.00';
      TNumericField( DMAF.cdsWork2.FieldByName('DEPNOMESES')  ).DisplayFormat:='##0';
      TNumericField( DMAF.cdsWork2.FieldByName('DEPACUHIST')  ).DisplayFormat:='### ### ###.00';
      TNumericField( DMAF.cdsWork2.FieldByName('DEPACUAJUS')  ).DisplayFormat:='### ### ###.00';
      TNumericField( DMAF.cdsWork2.FieldByName('ACFVALOMN' )  ).DisplayFormat:='### ### ###.00';
      }
   End;
End;

Procedure TFMaestro.dblcTipoDExit(Sender: TObject);
Var
   xTemp: String;
Begin
   If xSalir Then Exit;

   xCondicion := 'DEPCOD=''' + dblcTipoD.Text + '''';
   dbeTipo.Text := DMAF.DisplayDescrip('dspTGE', 'ACF104', 'DEPDESCRI', xCondicion, 'DEPDESCRI');

   If dbeTipo.Text <> '' Then
   Begin
      // Consulta a la Depreciación

      xSQL := 'SELECT * FROM ACF204 '
         + 'WHERE CIAID=''' + DMAF.cdsACTFIJ.FieldByName('CIAID').AsString + ''' and '
         + 'DEPCOD=''' + DMAF.cdsUDEP.FieldByName('DEPCOD').AsString + ''' and '
//          +      'TACFID='''  +DMAF.cdsACTFIJ.FieldByName('TACFID').AsString  +''' and '
//          +      'ACFID='''   +DMAF.cdsACTFIJ.FieldByName('ACFID').AsString   +''' and '
      + 'ARTCODBAR=''' + DMAF.cdsACTFIJ.FieldByName('ARTCODBAR').AsString + ''' and '
         + 'ACFREFOR=''' + DMAF.cdsACTFIJ.FieldByName('ACFREFOR').AsString + ''' '
         + 'ORDER BY DEPFLAGREF, DEPFECDEPR';
      DMAF.cdsWORK2.Close;
      DMAF.cdsWork2.DataRequest(xSQL);
      DMAF.cdsWork2.Open;

      TNumericField(DMAF.cdsWork2.FieldByName('FAREDONDEO')).DisplayFormat := '### ###.0000';
      TNumericField(DMAF.cdsWork2.FieldByName('TACFDEPREC')).DisplayFormat := '### ###.00';
      TNumericField(DMAF.cdsWork2.FieldByName('DEPVALHIST')).DisplayFormat := '### ### ###.00';
      TNumericField(DMAF.cdsWork2.FieldByName('DEPVALAJUS')).DisplayFormat := '### ### ###.00';
      TNumericField(DMAF.cdsWork2.FieldByName('DEPNOMESES')).DisplayFormat := '##0';
      TNumericField(DMAF.cdsWork2.FieldByName('DEPACUHIST')).DisplayFormat := '### ### ###.00';
      TNumericField(DMAF.cdsWork2.FieldByName('DEPACUAJUS')).DisplayFormat := '### ### ###.00';
      TNumericField(DMAF.cdsWork2.FieldByName('ACFVALOMN')).DisplayFormat := '### ### ###.00';
   End;
End;

Procedure TFMaestro.TabSheet2Exit(Sender: TObject);
Begin
   xSalir := True;
End;

Procedure TFMaestro.dblcResponsableExit(Sender: TObject);
Begin
   If xCrea Then exit;

   edtResponsableId.Text := '';
   dblcdCCosId.text := '';
   DMAF.cdsActFij.FieldByName('CCosId').asstring := '';
   edtCCosDes.text := '';

   If dblcCia.focused Then exit;

   If DMAF.wmodo = 'A' Then
   Begin
      If length(dblcResponsable.text) = 0 Then
      Begin
         dblcResponsable.SetFocus;
         showmessage('Ingrese Usuario Responsable');
         flagerr := 1;
         exit;
      End;
   End;

   xCondicion := 'RECIBENOM=' + '''' + dblcResponsable.Text + '''';
   edtResponsableId.Text := BuscaDescripcion(DMAF.cdsResponsable, xCondicion, 'RECIBEID');

   If DMAF.wmodo = 'A' Then
   Begin
      If length(edtResponsableId.text) = 0 Then
      Begin
         dblcResponsable.SetFocus;
         showmessage('Responsable Invalido');
         flagerr := 1;
         exit;
      End;
   End;

   DMAF.cdsActFij.FieldByName('RecibeId').asstring := DMAF.cdsResponsable.FieldByName('RecibeId').asstring;
   dblcdCCosId.Text := DMAF.cdsResponsable.FieldByName('CCosId').asstring;
   DMAF.cdsActFij.FieldByName('CCosId').asstring := DMAF.cdsResponsable.FieldByName('CCosId').asstring;

   xCondicion := 'CCosId=' + '''' + dblcdCCosId.Text + '''';
//   edtCCostoDes.Text:=DMAF.DisplayDescrip('dspTGE','TGE203','*',xCondicion,'CCosAbr');
   edtCCostoDes.Text := BuscaDescripcion(DMAF.cdsCCosto, xCondicion, 'CCosAbr');
End;

{procedure TFMaestro.dbeTipActExit(Sender: TObject);
var
   xSQL3, xCondicion : String;
begin
   if xCrea then exit;
   if dblccia.Focused then Exit;
   xCondicion:='CIAID='''+dblcCia.Text+''' and TAcFId='''+dbeTipAct.Text+'''';
   edtTipoActDes.Text:=DMAF.DisplayDescrip('dspTGE','ACF101','*',xCondicion,'TAcFDes');
   if length(edtTipoActDes.text)=0 then
   Begin
     dbeTipAct.setfocus;
     Showmessage('Tipo de Activo invalido');
     Exit;
   End;

   xPorcentaje:=DMAF.cdsQry.FieldByName('TACFDEPREC').AsFloat;

//   X ADICION: Toma Cuenta y Vida útil de Referencia TIPO DE ACTIVO
   if (DMAF.cdsActFij.State<>dsEdit) and (Length(edtTipoActDes.Text)<>0) then
   begin
      dblcdCuenta.Text:=DMAF.cdsTipAct.FieldByname('CuentaId').Value;
      DMAF.cdsActFij.FieldByName('CuentaId').Value:= DMAF.cdsTipAct.FieldByname('CuentaId').AsString;
      xCondicion := 'CuentaId='+''''+dblcdCuenta.Text+'''';
      edtCuentaDes.Text:=DMAF.DisplayDescrip('dspTGE','TGE202','*',xCondicion,'CtaAbr');
      dbeVida.Text:=DMAF.cdsTipAct.FieldByname('TAcFVida').AsString;
      DMAF.cdsActFij.FieldByName('TAcFVida').Value:= DMAF.cdsTipAct.FieldByname('TacFVida').AsInteger;
   end;

   // Calcula en Max Codigo de Activo
   xSQL3:='Select MAX( ACFID ) ACFID from ACF201 '
         +'WHERE CIAID='''+dblcCia.Text+''' and TACFID='''+dbeTipAct.Text+'''';
   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest( xSQL3 );
   DMAF.cdsQry.Open;

   if DMAF.cdsQry.FieldByName('ACFID').AsString='' then
      dbeAcFId.Text:=DMAF.StrZero( 1, DMAF.cdsActFij.FieldByName('ACFID').Size )
   else
   begin
      dbeAcFId.Text:=DMAF.StrZero( DMAF.cdsQry.FieldByName('ACFID').AsInteger+1, Length( DMAF.cdsQry.FieldByName('ACFID').AsString )   );
   end;

//  X MODIFICACION: Toma CUENTA y VIDA UTIL directamente
//  del Maestro de Activos y toma Descripcion de Cuenta de función
//  dblcdCuentaChange(Self) que se activa automáticamente al cambio.

   dbeFlagComp.enabled  :=True;
// obc   dblcubica.enabled    :=True;
   dblcLocalidad.enabled:=True;
   dblcPiso.enabled:=True;
   dblcArea.enabled:=True;
   dblcAmbiente.enabled:=True;
   dblcdCuenta.enabled  :=True;
   dblcdCCosId.enabled  :=True;
   dbeVida.enabled      :=True;

   if DMAF.wModo='A' then dbeAcFId.SetFocus;
end;
}

Procedure TFMaestro.dblcEstadoExit(Sender: TObject);
Begin
   If (xCrea) And (dbeRefor.Text <> 'R') Then exit;

   edtEstado.Text := '';

   If dblcCia.focused Then exit;

   If DMAF.wmodo = 'A' Then
   Begin
      If length(dblcEstado.text) = 0 Then
      Begin
         dblcEstado.SetFocus;
         showmessage('Ingrese Estado');
         flagerr := 1;
         exit;
      End;
   End;

   xCondicion := 'ESTADOID=' + '''' + dblcEstado.Text + '''';
   edtEstado.Text := BuscaDescripcion(DMAF.cdsEstado, xCondicion, 'ESTADODES');

   If DMAF.wmodo = 'A' Then
   Begin
      If length(edtEstado.text) = 0 Then
      Begin
         dblcEstado.SetFocus;
         showmessage('Estado Invalido');
         flagerr := 1;
         exit;
      End;
   End;
End;

Procedure TFMaestro.dbdtpFecAdquiExit(Sender: TObject);
Var
   periodoactivo, SQL: String;
   Year, Month, Day, Hour, Min, Sec, MSec: Word;

Begin
   If dblcCia.focused Then exit;

   DecodeDate(dbdtpFecAdqui.date, Year, Month, Day);

   If dbdtpFecAdqui.date = 0 Then
   Begin
      dbdtpFecAdqui.SetFocus;
      showmessage('Ingrese Fecha de Adquisicion');
      flagerr := 1;
      exit;
   End;

// periodo adquisicion
   periodoactivo := (inttostr(year)) + DMAF.StrZero(month, 2);

// periodo cerrado
   SQL := 'SELECT MAX(PERIODO) as PERIODO FROM ACF111';
   DMAF.cdsQry.close;
   DMAF.cdsQry.DataRequest(SQL);
   DMAF.cdsQry.open;

   periodoc := DMAF.cdsqry.fieldbyname('PERIODO').asstring;

// adquisicion debe ser posterior al cierre
   If Periodoactivo < periodoc Then
   Begin
      dbdtpFecAdqui.enabled := true;
      dbdtpFecAdqui.SetFocus;
      showmessage('La Fecha de Adquisicion debe ser mayor al Periodo de Cierre');
      exit;
   End;
End;

Procedure TFMaestro.FormShow(Sender: TObject);
Begin
   xCrea := True;
   xTab5 := True;
   xSalir := True;
   wCodBarra := dbeBarra.Text;

// Inicio HPC_201801_ACF
// Se cambia el Provider debido a que no devuelve el valor correctamente
   // PARA OBTENER EL CODIGO DE LA CIA CONSOLIDADA O PRINCIPAL
   //wCiaConsol := DMAF.DisplayDescrip('dspCia', 'TGE101', '*', 'CNTCONSOL=' + quotedstr('S'), 'CIAID');
   wCiaConsol := DMAF.DisplayDescrip('dspQry18', 'TGE101', '*', 'CNTCONSOL=' + quotedstr('S'), 'CIAID');
// Fin HPC_201801_ACF
   WSQL := 'SELECT * FROM ACF104 WHERE DEPFLAGACT=' + quotedstr('A') + ' and CIAID=' + quotedstr(wCiaConsol);
   DMAF.cdsUDEP.Close;
   DMAF.cdsUDEP.DataRequest(WSQL);
   DMAF.cdsUDEP.Open;

   If DMAF.wModo = 'A' Then
      XFlMod := True;

   If DMAF.wModo = 'M' Then
      ModificaActivos
   Else
      btnActRegClick(self);
//
   TabSheet5Enter(self);

   xCrea := False;

   //INICIO HPP_201104_ACF
   //Usuario Autoriza
   xSQL := 'Select RECIBEID,RECIBENOM,CCOSID from ACF126 where FLGAUTDES = ' + QuotedStr('S');
   ;
   DMAF.cdsTem1.Close;
   DMAF.cdsTem1.DataRequest(xSQL);
   DMAF.cdsTem1.Open;
   dbeDesAutori.Selected.Clear;
   dbeDesAutori.Selected.Add('RECIBEID'#9'12'#9'C'#243'digo'#9'F');
   dbeDesAutori.Selected.Add('RECIBENOM'#9'40'#9'Nombre'#9'F');
   dbeDesAutori.LookupField := 'RECIBEID';
   dbeDesAutori.LookupTable := DMAF.cdsTem1;
   dbeDesAutori_des.DataField := 'DESAUTORI';
   dbeDesAutori_des.DataSource := DMAF.dsActFij;
   //FIN HPP_201104_ACF

//
End;

Procedure TFMaestro.dblcPisoExit(Sender: TObject);
Begin
   If xCrea Then exit;

   If DMAF.wmodo = 'A' Then
   Begin
      edtPisoDes.Text := '';
      dblcArea.text := '';
      edtAreaDes.text := '';
      DMAF.cdsActFij.fieldbyname('Area').asstring := '';
      dblcAmbiente.text := '';
      DMAF.cdsActFij.fieldbyname('AmbCod').asstring := '';
      edtAmbienteDes.text := '';

      If dblcCia.focused Then exit;

      If length(dblcPiso.Text) = 0 Then
      Begin
         ShowMessage('Ingrese Piso');
         dblcPiso.SetFocus;
         exit;
      End;

   End;

   xCondicion := 'Piso=' + '''' + dblcPiso.Text + '''';
   edtPisoDes.Text := BuscaDescripcion(DMAF.cdsPiso, xCondicion, 'PISODES');
   edtPisoDesN.Text := edtPisoDes.Text;

   If DMAF.wmodo = 'A' Then
   Begin
      If length(edtPisoDes.Text) = 0 Then
      Begin
         ShowMessage('Piso invalido');
         dblcPiso.SetFocus;
         exit;
      End;
   End;

   Filtracds(DMAF.cdsArea, 'SELECT * FROM ACF122 WHERE ' +
      ' LOCID=' + quotedstr(dblcLocalidad.Text) +
      ' AND PISO=' + quotedstr(dblcPiso.Text));
End;

Procedure TFMaestro.dblcAreaExit(Sender: TObject);
Begin
   If xCrea Then exit;

   If DMAF.wmodo = 'A' Then
   Begin

      edtAreaDes.Text := '';
      dblcAmbiente.text := '';
      edtAmbienteDes.text := '';
      DMAF.cdsActFij.fieldbyname('AmbCod').asstring := '';

      If dblcCia.focused Then exit;

      If length(dblcArea.Text) = 0 Then
      Begin
         ShowMessage('Ingrese Area');
         dblcArea.SetFocus;
         exit;
      End;

   End;

   xCondicion := 'Area=' + '''' + dblcArea.Text + '''';
   edtAreaDes.Text := BuscaDescripcion(DMAF.cdsArea, xCondicion, 'AREADES');
   edtAreaDesN.Text := edtAreaDes.Text;

   If DMAF.wmodo = 'A' Then
   Begin

      If length(edtAreaDes.Text) = 0 Then
      Begin
         ShowMessage('Area invalida');
         dblcArea.SetFocus;
         exit;
      End;

   End;

   Filtracds(DMAF.cdsAmbiente, 'SELECT * FROM ACF123 WHERE ' +
      ' LOCID=' + quotedstr(dblcLocalidad.Text) +
      ' AND PISO=' + quotedstr(dblcPiso.Text) +
      ' AND AREA=' + quotedstr(dblcArea.Text));
      //   + ' AND CIAID='+quotedstr(dblcCia.Text));
End;

Procedure TFMaestro.dblcAmbienteExit(Sender: TObject);
Begin
   If xCrea Then exit;

   If DMAF.wmodo = 'A' Then
   Begin
      edtAmbienteDes.Text := '';

      If dblcCia.focused Then exit;

      If length(dblcAmbiente.Text) = 0 Then
      Begin
         ShowMessage('Ingrese Ambiente');
         dblcAmbiente.SetFocus;
         exit;
      End;
   End;

   xCondicion := 'AMBCOD=' + '''' + dblcAmbiente.Text + '''';
   DMAF.AbreCds(DMAF.cdsAmbiente, 'SELECT * FROM ACF123 WHERE ' +
      'LOCID=' + quotedstr(dblcLocalidad.Text) + ' AND ' +
      'PISO=' + quotedstr(dblcPiso.Text) + ' AND ' +
      'AREA=' + quotedstr(dblcArea.Text) + ' AND ' +
      'AMBCOD=' + quotedstr(dblcAmbiente.Text), '', '');
   edtAmbienteDes.Text := DMAF.cdsAmbiente.FieldbyName('AMBDES').AsSTring;
// edtAmbienteDes.Text:=BuscaDescripcion( DMAF.cdsAmbiente, xCondicion, 'AMBDES');

   If DMAF.wmodo = 'A' Then
   Begin
      If length(edtAmbienteDes.Text) = 0 Then
      Begin
         ShowMessage('Ambiente invalido');
         dblcAmbiente.SetFocus;
         exit;
      End;
   End;
End;

Procedure TFMaestro.dblcPisoNExit(Sender: TObject);
Begin
   If xCrea Then Exit;
   If bbtncancela4.Focused Then Exit;
   If dbeMotivo.Focused Then Exit;
   If dbcbExt.Focused Then Exit;

   xCondicion := 'Piso=' + '''' + dblcPisoN.Value + '''';
   edtPisoDesN.Text := DMAF.DisplayDescrip('dspPiso', 'ACF121', '*', xCondicion, 'PISODES');
   If trim(edtPisoDesN.Text) = '' Then
   Begin
      dblcPisoN.SetFocus;
      If trim(dblcPisoN.text) = '' Then
      Begin
         Showmessage('Ingrese Piso');
         exit;
      End
      Else
      Begin
         Showmessage('Piso invalido ');
         exit;
      End;
   End;
   Filtracds(DMAF.cdsArea, 'SELECT * FROM ACF122 WHERE ' +
      ' LOCID=' + quotedstr(dblcLocalidadN.Text) +
      ' AND PISO=' + quotedstr(dblcPisoN.Text));
End;

Procedure TFMaestro.dblcAreaNExit(Sender: TObject);
Begin
   If xCrea Then Exit;
   If bbtncancela4.Focused Then Exit;
   If dbeMotivo.Focused Then Exit;
   If dbcbExt.Focused Then Exit;

   xCondicion := 'Area=' + '''' + dblcAreaN.Value + '''';
   edtAreaDesN.Text := DMAF.DisplayDescrip('dspArea', 'ACF122', '*', xCondicion, 'AREADES');
   If trim(edtAreaDesN.Text) = '' Then
   Begin
      dblcAreaN.SetFocus;
      If trim(dblcAreaN.text) = '' Then
      Begin
         Showmessage('Ingrese Area');
         exit;
      End
      Else
      Begin
         Showmessage('Area Equivocada - Corrija ');
         exit;
      End;
   End;
   Filtracds(DMAF.cdsAmbiente, 'SELECT * FROM ACF123 WHERE ' +
      ' LOCID=' + quotedstr(dblcLocalidadN.Text) +
      ' AND PISO=' + quotedstr(dblcPisoN.Text) +
      ' AND AREA=' + quotedstr(dblcAreaN.Text));
End;

Procedure TFMaestro.dblcAmbienteNExit(Sender: TObject);
Begin
   If xCrea Then Exit;
   If bbtncancela4.Focused Then Exit;
   If dbeMotivo.Focused Then Exit;
   If dbcbExt.Focused Then Exit;

   xCondicion := 'AMBCOD=' + '''' + dblcAmbienteN.Value + '''';
   edtAmbienteDesN.Text := DMAF.DisplayDescrip('dspAmbiente', 'ACF123', '*', xCondicion, 'AMBDES');
   If trim(edtAmbienteDesN.Text) = '' Then
   Begin
      dblcAmbienteN.SetFocus;
      If trim(dblcAmbienteN.text) = '' Then
      Begin
         Showmessage('Ingrese Ambiente');
         exit;
      End
      Else
      Begin
         Showmessage('Ambiente Equivocado - Corrija ');
         exit;
      End;
   End
End;

Procedure TFMaestro.dblcCiaNExit(Sender: TObject);
Begin
   If xCrea Then Exit;
   If bbtncancela4.Focused Then Exit;
   If dbeMotivo.Focused Then Exit;
   If dbcbExt.Focused Then Exit;

   xCondicion := 'CIAID=' + '''' + dblcCiaN.Value + '''';
   edtCiaDesN.Text := DMAF.DisplayDescrip('dspCia', 'TGE101', '*', xCondicion, 'CIADES');

   If trim(edtCiaDesN.Text) = '' Then
   Begin
      dblcCiaN.SetFocus;
      If trim(dblcCiaN.text) = '' Then
      Begin
         Showmessage('Ingrese Compañia');
         exit;
      End
      Else
      Begin
         Showmessage('Compañia Equivocada - Corrija ');
         exit;
      End;
   End;
   Filtracds(DMAF.cdsLocalidad, 'SELECT * FROM ACF120 ');
End;

Procedure TFMaestro.dblcDesExit(Sender: TObject);
Begin
   If xCrea Then exit;

   edtTipoActDes.text := '';
   dbeTipAct.text := '';
   DMAF.cdsActFij.fieldbyname('TACFID').AsString := '';
   edtTipoActDes.text := '';
   dbeAcfid.text := '';
   DMAF.cdsActFij.fieldbyname('ACFID').AsString := '';
   dblcdCuenta.Text := '';
   DMAF.cdsActFij.FieldByName('CuentaId').Asstring := '';
   edtCuentaDes.Text := '';
   dbeVida.Text := '';
   DMAF.cdsActFij.FieldByName('TAcFVida').Value := 0;

   If dblcCia.focused Then exit;

   If length(dblcDes.Text) = 0 Then
   Begin
      dblcDes.setfocus;
      Showmessage('Denominacion invalida');
      Exit;
   End;

   dbeTipAct.text := DMAF.cdsQry7.fieldbyname('TACF').AsString;
   DMAF.cdsActFij.fieldbyname('TACFID').AsString := DMAF.cdsQry7.fieldbyname('TACF').AsString;

   Filtracds(DMAF.cdsTipAct, 'SELECT * FROM ACF101 WHERE CIAID=' + quotedstr(wCiaConsol)
      + ' AND TACFID=' + '''' + DMAF.cdsQry7.fieldbyname('TACF').AsString + '''');
   edtTipoActDes.text := DMAF.cdsTipAct.fieldbyname('TACFDES').AsString;
   DMAF.cdsActFij.fieldbyname('ACFDES').AsString := DMAF.cdsQry7.fieldbyname('DENOMINACI').AsString;

   Filtracds(DMAF.cdsLocalidad, 'SELECT * FROM ACF120 ');

   If DMAF.wModo = 'A' Then
   Begin
      // Calcula en Max Codigo de Activo
      xSQL := 'Select MAX( ACFID ) ACFID from ACF201 '
         + 'WHERE CIAID=' + quotedstr(wCiaConsol) + ' and TACFID=' + quotedstr(dbeTipAct.text);
      DMAF.cdsQry8.Close;
      DMAF.cdsQry8.DataRequest(xSQL);
      DMAF.cdsQry8.Open;
      If length(DMAF.cdsQry8.FieldByName('ACFID').AsString) = 0 Then
         dbeAcfid.text := DMAF.StrZero(1, DMAF.cdsQry8.FieldByName('ACFID').Size)
      Else
      Begin
         dbeAcfid.text := DMAF.StrZero(DMAF.cdsQry8.FieldByName('ACFID').AsInteger + 1, Length(DMAF.cdsQry8.FieldByName('ACFID').AsString));
      End;
      DMAF.cdsActFij.FieldByName('ACFID').Asstring := dbeAcfid.text;
//          DMAF.StrZero( DMAF.cdsQry.FieldByName('ACFID').AsInteger+1, Length( DMAF.cdsQry.FieldByName('ACFID').AsString ));
   End;

   xCondicion := 'CIAID=''' + dblcCia.Text + ''' and TAcFId=''' + dbeTipAct.Text + '''';
//   edtTipoActDes.Text:=DMAF.DisplayDescrip('dspTGE','ACF101','*',xCondicion,'TAcFDes');

   xPorcentaje := DMAF.cdsTipAct.FieldByName('TACFDEPREC').AsFloat;

//   X ADICION: Toma Cuenta y Vida útil de Referencia TIPO DE ACTIVO
   If (DMAF.cdsActFij.State <> dsEdit) And (Length(edtTipoActDes.Text) <> 0) Then
   Begin
      dblcdCuenta.Text := DMAF.cdsTipAct.FieldByname('CuentaId').Value;
      DMAF.cdsActFij.FieldByName('CuentaId').Value := DMAF.cdsTipAct.FieldByname('CuentaId').AsString;
      xCondicion := 'CuentaId=' + '''' + dblcdCuenta.Text + '''';
      edtCuentaDes.Text := DMAF.DisplayDescrip('dspTGE', 'TGE202', '*', xCondicion, 'CtaAbr');
      dbeVida.Text := DMAF.cdsTipAct.FieldByname('TAcFVida').AsString;
      DMAF.cdsActFij.FieldByName('TAcFVida').Value := DMAF.cdsTipAct.FieldByname('TacFVida').AsInteger;
   End;

//  X MODIFICACION: Toma CUENTA y VIDA UTIL directamente
//  del Maestro de Activos y toma Descripcion de Cuenta de función
//  dblcdCuentaChange(Self) que se activa automáticamente al cambio.

   dbeFlagComp.enabled := True;
// obc   dblcubica.enabled    :=True;
   dblcLocalidad.enabled := True;
//   dblcdCuenta.enabled  :=True;
   dblcPiso.enabled := True;
   dblcArea.enabled := True;
   dblcAmbiente.enabled := True;
//   dblcdCCosId.enabled  :=True;
   dblcResponsable.enabled := True;
//   dbeVida.enabled      :=True;

   If DMAF.wModo = 'A' Then dbeRefor.SetFocus;
End;

Procedure TFMaestro.dbeFlagCompExit(Sender: TObject);
Begin
   If (dbeFlagComp.Text) <> 'S' Then
   Begin
      dbeFlagComp.Text := 'N';
      DMAF.cdsActfij.FieldByName('ACFFlaComp').Value := 'N';
   End;
End;

Procedure TFMaestro.dbdtpFecInacExit(Sender: TObject);
Begin
   DMAF.cdsQry9.Close;
   DMAF.cdsQry9.DataRequest('SELECT * FROM ACF105');
   DMAF.cdsQry9.Open;
   dblcMotivo.Selected.Clear;
   dblcMotivo.Selected.Add('DESACID'#9'2'#9'Motivo'#9'F');
   dblcMotivo.Selected.Add('DESACDES'#9'20'#9'Nº~Descripción'#9'F');
End;
//INICIO HPP_201104_ACF

Procedure TFMaestro.dbeDesAutoriExit(Sender: TObject);
Begin
   xSQL := 'RECIBEID=' + quotedstr(dbeDesAutori.Text);
   dbeDesAutori_des.text := DMAF.DisplayDescrip('dspTGE', 'ACF126', 'RECIBENOM', xSQL, 'RECIBENOM');
End;
//FIN HPP_201104_ACF
End.

