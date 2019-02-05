unit ACF310;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, wwdblook, Buttons, Wwdbdlg, ppCache, ppDB, ppDBPipe, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, ppPrnabl, ppCtrls, ppBands, ppVar;

type
  TFDepRep = class(TForm)
    dblcCia: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    dblcdPeriodo: TwwDBLookupComboDlg;
    Label3: TLabel;
    dblcTipo: TwwDBLookupCombo;
    bbtnOk1: TBitBtn;
    bbtnCancela4: TBitBtn;
    Label4: TLabel;
    dblcTipAct: TwwDBLookupComboDlg;
    pprDepre: TppReport;
    ppdbDepre: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel1: TppLabel;
    ppDBText11: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDBText12: TppDBText;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    procedure bbtnOk1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDepRep: TFDepRep;

implementation

{$R *.DFM}

Uses ACFDM;

procedure TFDepRep.bbtnOk1Click(Sender: TObject);
var
   wSQL : String;
begin

   wSQL:='SELECT A.CIAID, A.TACFID, A.ACFID, B.ACFDES, C.TACFDES, '
        +  'FAREDONDEO, DEPVALHIST, DEPVALAJUS, DEPACUHIST, DEPACUAJUS, '
        +  'DEPIMPAJUS, DEPNETOAJU, DEPANTHIST, DEPANTAJUS, '
        +  'A.TACFDEPREC, A.ACFFECADQ, A.FAPERIODO '
        +'FROM ACF204 A, ACF201 B, ACF101 C '
        +'WHERE A.CIAID='''   +dblcCia.Text     +''' and '
        +      'A.DEPCOD='''  +dblcTipo.Text    +''' and '
        +      'A.FAPERIODO='''+dblcdPeriodo.Text+''' and '
        +      'A.CIAID=B.CIAID AND '
        +      'A.TACFID=B.TACFID AND '
        +      'A.ACFID=B.ACFID AND '
        +      'A.CIAID=C.CIAID AND '
        +      'A.TACFID=C.TACFID ';

   if dblcTipAct.Text<>'' then
      wSQL:=wSQL+'and A.TACFID='''+dblcTipAct.Text+''' ';

   wsql:=wsql+'Order by ciaid, tacfid, acfid ';

   DMAF.cdsWORK1.CLOSE;
   DMAF.Dcom1.Appserver.EjecutaSQL(WSQL);
   DMAF.cdsWORK1.OPEN;

   ppdbDepre.DataSource:=DMAF.dsWork1;
   pprDepre.Print;
   pprDepre.Stop;
   
end;

end.
