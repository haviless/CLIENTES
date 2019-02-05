unit ACF320;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, Mask, wwdbedit, wwdblook, Wwdbdlg, ppProd,
  ppClass, ppReport, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, ppDBBDE,
  ppEndUsr, ppBands, ppCtrls, ppVar, ppPrnabl;
  

type
  TFResumen = class(TForm)
    Label2: TLabel;
    wMensaje4: TLabel;
    Label74: TLabel;
    dblcdPeriodo: TwwDBLookupComboDlg;
    dblcTipoD: TwwDBLookupCombo;
    dbeTipo: TwwDBEdit;
    Label1: TLabel;
    bbtnOk1: TBitBtn;
    bbtnCancela4: TBitBtn;
    pbDep: TProgressBar;
    Label3: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCiades: TEdit;
    ppBDEPipeline1: TppBDEPipeline;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLine1: TppLine;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLine4: TppLine;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppDBText11: TppDBText;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppLine13: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLabel19: TppLabel;
    ppDBText6: TppDBText;
    ppDBCalc9: TppDBCalc;
    ppDBText12: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel20: TppLabel;
    ppLine23: TppLine;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppDBCalc18: TppDBCalc;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppLine31: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppDBText13: TppDBText;
    ppdsgQry: TppDesigner;
    procedure dblcTipoDExit(Sender: TObject);
    procedure bbtnOk1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcTipoDEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  FResumen: TFResumen;

implementation

uses ACFDM;

{$R *.DFM}

procedure TFResumen.dblcTipoDExit(Sender: TObject);
var
   xWhere, wSQL : String;
begin
   xWhere:='DEPCOD='''+dblcTipoD.Text+'''';
   dbeTipo.Text:=DMAF.DisplayDescrip('dspTGE','ACF104','DEPDESCRI',xWhere,'DEPDESCRI');

   if dbeTipo.Text='' then begin
      dblcTipoD.SetFocus;
      ShowMessage('Error : Falta Tipo de Depreciación');
      Exit;
   end;

   wSQL:='SELECT * FROM ACF102 '
        +'WHERE DEPCOD='''+dblcTipoD.Text+''' AND FAPROC=''P'' '
        +'ORDER BY FAPERIODO';
   DMAF.cdsFACTOR.Close;
   DMAF.cdsFACTOR.DataRequest(wSQL);
   DMAF.cdsFACTOR.Open;
end;


procedure TFResumen.bbtnOk1Click(Sender: TObject);
var
   xSQL, xMesAnt, xMes : String;
begin
   if edtCiades.Text='' then begin
      ShowMessage('Error : Falta Seleccionar Compañía');
      dblcCia.SetFocus;
      Exit;
   end;
   if dbeTipo.Text='' then begin
      dblcTipoD.SetFocus;
      ShowMessage('Error : Falta Tipo de Depreciación');
      Exit;
   end;

   if dblcdPeriodo.Text='' then begin
      dblcdPeriodo.SetFocus;
      ShowMessage('Error : Falta Periodo');
      Exit;
   end;

   xSQL:='Select * from TGE181 Where MESID='''+Copy(dblcdPeriodo.text,5,2)+'''';

   DMAF.cdsQry.Close;
   DMAF.cdsQry.DataRequest( xSQL );
   DMAF.cdsQry.Open;

   xMes:=DMAF.cdsQry.FieldByName('MESDESL').AsString;
   xMes:='MES '+xMes+' DEL '+Copy(dblcdPeriodo.Text,1,4);

   if Copy(dblcdPeriodo.Text,5,2)='01' then
      xMesAnt:=IntToStr(StrToInt(Copy(dblcdPeriodo.Text,1,4))-1)+'12'
   else
      xMesAnt:=Copy(dblcdPeriodo.Text,1,4)+ DMAF.StrZero( StrToInt( Copy(dblcdPeriodo.Text,5,2) )-1,2);

   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
   xSQL:='Select '''+xMes+''' PERIODO, ''01'' ORDEN, Z.GRUPOREP, A.CIAID, A.CUENTAID, C.CTADES, '
        +  'DEPVALHIST-COALESCE(COMPRAS,0)+COALESCE(BAJAS,0) SALANTHIST, '
        +  'COALESCE(COMPRAS,0) COMPRAS, COALESCE(BAJAS,0) BAJAS, DEPVALHIST, '

        +  'ACFREIACUM-ACFREIPERI SALANTREI, ACFREIPERI, ACFREIACUM, DEPVALAJUS, DEPNETOAJU '
        +'From '
        +  '( Select A.CIAID, A.CUENTAID, '
        +      'Sum( DEPVALHIST ) DEPVALHIST, Sum( DEPVALAJUS ) DEPVALAJUS, '
        +      'Sum( ACFREIPERI ) ACFREIPERI, Sum( ACFREIACUM ) ACFREIACUM, '
        +      'Sum( A.DEPNETOAJU ) DEPNETOAJU '
        +    'From ACF204 A '
        +    'Where A.CIAID='''    +dblcCia.Text     +''' and '
        +          'A.FAPERIODO='''+dblcdPeriodo.Text+''' and '
        +          'A.DEPCOD='''   +dblcTipoD.text   +''' '
        +    'Group by A.CIAID, A.CUENTAID ) A '
        +  'Left Join ( Select A.CUENTAID, SUM( COALESCE(DEPVALHIST,0) ) COMPRAS '
        +              'From ACF204 A '
        +              'Where CIAID='''    +dblcCia.text     +''' and '
        +                    'FAPERIODO='''+dblcdPeriodo.Text+''' and '
        +                    'A.DEPCOD=''' +dblcTipoD.text   +''' and '
        +                    'ACFDEPEST=''COMPRAS'' '
        +              'Group by A.CUENTAID ) B on A.CUENTAID=B.CUENTAID '
        +  'Left Join ( Select C.CUENTAID, SUM( B.BAJAS ) BAJAS from ACF201 C '
        +                'Left Join ( Select X.CIAID, X.CUENTAID, X.ACFID, SUM( COALESCE(X.DEPVALHIST,0) ) BAJAS '
        +                            'From ACF204 X '
        +                            'Where X.CIAID='''    +dblcCia.text  +''' and '
        +                                  'X.FAPERIODO='''+xMesAnt       +''' and '
        +                                  'X.DEPCOD='''   +dblcTipoD.text+''' '
        +                            'Group by X.CIAID, X.CUENTAID, X.ACFID ) B '
        +                    'ON C.CIAID=B.CIAID AND C.CUENTAID=B.CUENTAID AND C.ACFID=B.ACFID '
        +              'Where DESANOMES='''+dblcdPeriodo.Text+''' '
        +              'GROUP BY C.CUENTAID ) D on ( A.CUENTAID=D.CUENTAID ) '

        +  'Left Join TGE202 C on ( C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID ) '
        +  'Left Join ACF110 Z on ( A.CUENTAID=Z.CUENTAID ) '
        +'Union all '
        +'Select '''+xMes+''' PERIODO, ''02'' ORDEN, MAX(B.GRUPOREP) GRUPOREP, A.CIAID, MAX(B.CTADEPAC) CUENTAID, MAX( C.CTADES ) CTADES, '
        +  'Sum( DEPANTHIST ) SALANTHIST, Sum( DEPIMPHIST ) COMPRAS, 0 BAJAS, SUM(DEPACUHIST) DEPVALHIST, '

        +  'Sum( ACFREIDEPAC )-Sum( ACFREIDEPR ) SALANTREI, Sum( ACFREIDEPR ) ACFREIPERI, '

        +  'Sum( ACFREIDEPAC ) ACFREIACUM, Sum( DEPACUAJUS ) DEPVALAJUS, SUM( DEPNETOAJU ) DEPNETOAJU '

        +'From ACF204 A, ACF110 B '
        +  'Left Join TGE202 C on ( C.CIAID=B.CIAID AND C.CUENTAID=B.CTADEPAC ) '
        +'Where A.CIAID='''    +dblcCia.Text     +''' and '
        +      'A.FAPERIODO='''+dblcdPeriodo.Text+''' and '
        +      'A.DEPCOD='''   +dblcTipoD.text   +''' and '
        +      'A.CUENTAID=B.CUENTAID '
        +'Group by A.CIAID, A.CUENTAID';
   end;

{
SELECT A.CIAID, B.CIADES, '1' TIPREG, A.CUENTAID, C.TACFDES, SUM(SALANT) SALANT, SUM(COMPRAS) COMPRAS,  
SUM(BAJAS) BAJAS, SUM((SALANT+COMPRAS)) SALACT, 0 FACSNT, 0 FACMES, 0 FACSACT
FROM 
(
SELECT CIAID, CUENTAID, 
CASE WHEN ((ACFFECADQ<'01/07/2005') AND (ACFFLAGACT='A')) 
          THEN SUM( NVL(ACFVALOMN,0)) ELSE 0 END SALANT,
CASE WHEN ((ACFFECADQ>='01/07/2005' and ACFFECADQ<='31/07/2005') AND (ACFFLAGACT='A')) 
          THEN SUM(NVL(ACFVALOMN,0)) ELSE 0 END COMPRAS,
CASE WHEN ((ACFFECADQ>='01/07/2005' and ACFFECADQ<='31/07/2005') AND (ACFFLAGACT='I'))
          THEN SUM(NVL(ACFVALOMN,0)) ELSE 0 END BAJAS
FROM ACF201                            
Where CIAID='02' AND ACFFLAGACT='A' AND TMONID IS NOT NULL AND VERI IN('S','Z','E')
Group by CIAID,CUENTAID,ACFFECADQ,ACFFLAGACT) A, TGE101 B, ACF101 C 
Where A.CIAID=B.CIAID(+) and A.CUENTAID=C.CUENTAID(+)
Group by A.CIAID, B.CIADES,A.CUENTAID, C.TACFDES
UNION ALL
SELECT A.CIAID, B.CIADES, '1' TIPREG, A.CUENTAID, C.TACFDES, 0 SALANT, 0 COMPRAS, 0 BAJAS, 0 SALACT,
SUM(FACSANT) FACSANT, SUM(FACMES) FACMES, SUM((FACSANT+FACMES)) FACSACT
FROM
(
SELECT CIAID, CUENTAID,
CASE WHEN ((DCPANOMM<'200504') AND (DCPESTDO='P'))
          THEN SUM( NVL(DCPMOLOC,0)) ELSE 0 END FACSANT,
CASE WHEN ((DCPANOMM='200504') AND (DCPESTDO='P'))
          THEN SUM(NVL(DCPMOLOC,0)) ELSE 0 END FACMES
FROM CXP302
Where CIAID='02' AND DCPESTDO='P' AND CUENTAID LIKE '33%'
Group by CIAID,CUENTAID,DCPANOMM,DCPESTDO) A, TGE101 B, ACF101 C
Where A.CIAID=B.CIAID(+) and A.CUENTAID=C.CUENTAID(+)
Group by A.CIAID, B.CIADES,A.CUENTAID, C.TACFDES
}
   if (SRV_D = 'ORACLE') then
   begin
   xSQL:='Select '''+xMes+''' PERIODO, ''01'' ORDEN, Z.GRUPOREP, A.CIAID, A.CUENTAID, C.CTADES, '
        +  'DEPVALHIST-NVL(COMPRAS,0)+NVL(BAJAS,0) SALANTHIST, '
        +  'NVL(COMPRAS,0) COMPRAS, NVL(BAJAS,0) BAJAS, DEPVALHIST, '

        +  'ACFREIACUM-ACFREIPERI SALANTREI, ACFREIPERI, ACFREIACUM, DEPVALAJUS, DEPNETOAJU '
        +'From '
        +  '( Select A.CIAID, A.CUENTAID, '
        +      'Sum( DEPVALHIST ) DEPVALHIST, Sum( DEPVALAJUS ) DEPVALAJUS, '
        +      'Sum( ACFREIPERI ) ACFREIPERI, Sum( ACFREIACUM ) ACFREIACUM, '
        +      'Sum( A.DEPNETOAJU ) DEPNETOAJU '
        +    'From ACF204 A '
        +    'Where A.CIAID='''    +dblcCia.Text     +''' and '
        +          'A.FAPERIODO='''+dblcdPeriodo.Text+''' and '
        +          'A.DEPCOD='''   +dblcTipoD.text   +''' '
        +    'Group by A.CIAID, A.CUENTAID ) A, '

        +  '( Select A.CUENTAID, SUM( NVL(DEPVALHIST,0) ) COMPRAS '
        +    'From ACF204 A '
        +    'Where CIAID='''    +dblcCia.text     +''' and '
        +          'FAPERIODO='''+dblcdPeriodo.Text+''' and '
        +          'A.DEPCOD=''' +dblcTipoD.text   +''' and '
        +          'ACFDEPEST=''COMPRAS'' '
        +     'Group by A.CUENTAID ) B, '

        +  '( Select C.CUENTAID, SUM( B.BAJAS ) BAJAS from ACF201 C, '
        +      '( Select X.CIAID, X.CUENTAID, X.ACFID, SUM( NVL(X.DEPVALHIST,0) ) BAJAS '
        +        'From ACF204 X '
        +        'Where X.CIAID='''    +dblcCia.text  +''' and '
        +              'X.FAPERIODO='''+xMesAnt       +''' and '
        +              'X.DEPCOD='''   +dblcTipoD.text+''' '
        +        'Group by X.CIAID, X.CUENTAID, X.ACFID ) B '
        +    'Where DESANOMES='''+dblcdPeriodo.Text+''' '
        +      'and C.CIAID=B.CIAID(+) AND C.CUENTAID=B.CUENTAID(+) AND C.ACFID=B.ACFID(+) '
        +    'GROUP BY C.CUENTAID ) D, '
        +    'TGE202 C, '
        +    'ACF110 Z '
        +'Where A.CUENTAID=B.CUENTAID(+) '
        +  'and A.CUENTAID=D.CUENTAID(+) '
        +  'and A.CIAID=C.CIAID(+) AND A.CUENTAID=C.CUENTAID(+) '
        +  'and A.CIAID=Z.CIAID(+) AND A.CUENTAID=Z.CUENTAID(+) '

        +'Union all '

        +'Select '''+xMes+''' PERIODO, ''02'' ORDEN, MAX(B.GRUPOREP) GRUPOREP, A.CIAID, MAX(B.CTADEPAC), MAX( C.CTADES ) CTADES, '
        +  'Sum( DEPANTHIST ) SALANTHIST, Sum( DEPIMPHIST ) COMPRAS, 0 BAJAS, SUM(DEPACUHIST) DEPVALHIST, '

        +  'Sum( ACFREIDEPAC )-Sum( ACFREIDEPR ) SALANTREI, Sum( ACFREIDEPR ) ACFREIPERI, '

        +  'Sum( ACFREIDEPAC ) ACFREIACUM, Sum( DEPACUAJUS ) DEPVALAJUS, SUM( DEPNETOAJU ) DEPNETOAJU '

        +'From ACF204 A, ACF110 B, TGE202 C '
        +'Where A.CIAID='''    +dblcCia.Text     +''' and '
        +      'A.FAPERIODO='''+dblcdPeriodo.Text+''' and '
        +      'A.DEPCOD='''   +dblcTipoD.text   +''' and '
        +      'A.CIAID=B.CIAID(+) AND A.CUENTAID=B.CUENTAID(+) and '
        +      'B.CIAID=C.CIAID(+) AND B.CTADEPAC=C.CUENTAID(+) '
        +'Group by A.CIAID, A.CUENTAID';
   end;

   DMAF.cdsQry2.Close;
   DMAF.cdsQry2.DataRequest( xSQL );
   DMAF.cdsQry2.Open;

   DMAF.cdsQry2.IndexFieldNames:='ORDEN;GRUPOREP;CUENTAID';

   ppReport1.template.fileName:=ExtractFilePath( application.ExeName )  +wRutaRpt+'\ResumenCNT.rtm';
   ppReport1.template.LoadFromFile;
   ppdsgQry.Report := ppReport1;
   ppdsgQry.Show;

//   ppReport1.Print;
end;

procedure TFResumen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DMAF.cdsQry2.IndexFieldNames:='';
   DMAF.cdsQry2.Close;

   Action:=caFree;
end;

procedure TFResumen.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
   begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0 );
   end;
end;

procedure TFResumen.dblcCiaExit(Sender: TObject);
var
  xWhere, wSQL : String;
begin  
   xWhere:='CIAID='''+dblcCia.Text+'''';
   edtCiades.Text:=DMAF.DisplayDescrip('dspTGE','TGE101','CIADES',xWhere,'CIADES');

   if edtCiades.Text='' then begin
      dblcCia.SetFocus;
      ShowMessage('Error : Falta Seleccionar Compañía');
      Exit;
   end;

   wSQL:='SELECT * FROM ACF104 '
        +'WHERE CIAID='''+dblcCia.Text+''' AND DEPFLAGACT=''A''';

   DMAF.cdsUDEP.Close;
   DMAF.cdsUDEP.DataRequest(wSQL);
   DMAF.cdsUDEP.Open;

end;

procedure TFResumen.dblcTipoDEnter(Sender: TObject);
begin
   if dblcCia.Text='' then
      dblcCia.SetFocus;
end;

procedure TFResumen.FormShow(Sender: TObject);
var
   xSQL : String;
begin
    xSQL:= 'SELECT * FROM ACF104 WHERE';
    xSql:=xSql+' DEPFLAGACT='+''''+'A'+'''';

    DMAF.cdsUDEP.Close;
    DMAF.cdsUDEP.DataRequest(xSQL);
    DMAF.cdsUDEP.Open;

   dblcTipoD.Selected.Clear;
   dblcTipoD.Selected.Add('DEPCOD'#9'8'#9'Código'#9'F');
   dblcTipoD.Selected.Add('DEPDESCRI'#9'20'#9'Descripción'#9'F');
end;

end.
