
unit ACF006;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, wwdbedit, ComCtrls, Db, Wwdatsrc, wwclient, Wwkeycb,
  mask, Wwtable, fcButton, fcImgBtn, fcClearPanel, fcButtonGroup, fcLabel,
  Menus;

type
  TFAccesos = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbeUsuario: TwwDBEdit;
    dbePassword: TwwDBEdit;
    Image1: TImage;
    pnlConecta: TPanel;
    fcLabel1: TfcLabel;
    fcLabel2: TfcLabel;
    pbTablas: TProgressBar;
    Image2: TImage;
    fcBtnG1: TfcButtonGroup;
    fcbtn1: TfcImageBtn;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure fcbtn1Click(Sender: TObject);
    procedure dbePasswordExit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
        // Accesos al Sistema
    wUsuario   : string;
    wComponente: TControl;
    wObjetoDescr: String;
    wObjetoForma: String;
    wObjetoNombr: String;
    wObjetoDesPr: String;
    wModulo    : String;
    wGrupo     : String;
    wGrupoTmp  : String;
    wAdmin     : String;
    // Fin Accesos al Sistema
    procedure Accesos;
    procedure FiltraTabla( xxCds:TwwClientDataSet; xxArchivo,xxCampo:String  );
    procedure AbrirCDS( xxCds:TwwClientDataSet );
    procedure AbrirTabla( xxTabla:TwwTable );
    function  DesEncripta(wPalabra:String): String;
    function  Encripta(wPalabra:String): String;
  end;

var
  FAccesos: TFAccesos;
  xVeces  : Integer;
  xSQL2   : String;

implementation

uses ACF001, ACFDM;

{$R *.DFM}

procedure TFAccesos.fcbtn1Click(Sender: TObject);
var
   xOk : Boolean;
begin
   xVeces := xVeces + 1;
   xOk := False;
   DMAF.cdsUsuarios.SetKey;
   DMAF.cdsUsuarios.FieldByName('UserId').AsString := dbeUsuario.Text;
   DMAF.cdsUsuarios.FieldByName('MODULOID').AsString := DMAF.wModulo;
   If DMAF.cdsUsuarios.GotoKey then begin
      If Uppercase(DesEncripta(DMAF.cdsUsuarios.FieldByName('Password').AsString))=Uppercase(dbePassword.Text) then
      begin
         DMAF.wGrupo := DMAF.cdsUsuarios.FieldByName('GrupoId').AsString;

         DMAF.wAdmin := '';
         DMAF.cdsMGrupo.SetKey;
         DMAF.cdsMGrupo.FieldByName('GrupoId').AsString := DMAF.wGrupo;
         If DMAF.cdsMGrupo.GotoKey then begin
            DMAF.wAdmin := DMAF.cdsMGrupo.FieldByName('GrupoAdm').AsString;
         end;
         If DMAF.wAdmin='G' then
            xOk := True
         else begin
            DMAF.cdsGrupos.Setkey;
            DMAF.cdsGrupos.FieldByName('GrupoId').Value := DMAF.wGrupo;
            DMAF.cdsGrupos.FieldByName('ModuloId').Value:= DMAF.wModulo;
            DMAF.cdsGrupos.FieldByName('Tipo').Value    := '0';
            If DMAF.cdsGrupos.GotoKey then begin
               xOk := True
            end
         end
      end
   end;

   If xOk then begin

      fcBtnG1.Visible    := False;

      pnlConecta.Visible := True;
      pnlConecta.Refresh;

      Accesos;

      FPrincipal :=TFPrincipal.Create(Self);

      FAccesos.Visible := False;

      With FPrincipal Do
      Try
         DMAF.wUsuario := dbeUsuario.Text;
         ShowModal;
      Finally
         FPrincipal.Free;
         FAccesos.Close;
      End;

      end
   else begin
      ShowMessage('No Tiene Acceso al Sistema');
      If xVeces>=3 then begin
         ShowMessage('Error : NO Puede Cargar el Sistema');
         FAccesos.Close;
         Exit;
      end;
      dbeUsuario.SetFocus;
   end;
end;

Procedure TFAccesos.Accesos;
var
   xSQL : String;
   xCtas1, xctas2, xCta: String;
   xWhere1, xWhere2 : string;
begin
   fcLabel1.Visible  := True;
   fcLabel2.Visible  := True;

   pbTablas.Max      := 19;    // Cantidad de Tablas a Abrir;
   pbTablas.Position := 0;     // Cantidad de Tablas a Abrir;

   fcLabel1.Visible  := True;
   fcLabel2.Visible  := True;

   AbrirCDS(   DMAF.cdsAcceso );
   FiltraTabla( DMAF.cdsCia,      'TGE101', 'CIAID'     );
   FiltraTabla( DMAF.cdsMoneda,   'TGE103', 'TMONID'    );
   FiltraTabla( DMAF.cdsProvee,   'TGE201', 'PROV'      );
   FiltraTabla( DMAF.cdsTipDoc,   'TGE110', 'DOCID'     );
   FiltraTabla( DMAF.cdsUbica,    'TGE117', 'UBICID'    );
   FiltraTabla( DMAF.cdsAdqui,    'TGE177', 'TIPADQUI'  );
   FiltraTabla( DMAF.cdsTCambio,  'TGE107', 'TMONID'    );
   FiltraTabla( DMAF.cdsLocalidad,'TGE126', 'LOCID'     );
   FiltraTabla( DMAF.cdsMaterial, 'TGE178', 'MATERIALID');
   FiltraTabla( DMAF.cdsRefor,    'ACF203', 'ACFID'     );
   FiltraTabla( DMAF.cdsFactor,   'ACF102', 'FAPERIODO' );
   FiltraTabla( DMAF.cdsNivel,    'ACF107', 'NIVEL'     );
   FiltraTabla( DMAF.cdsTrab,     'ACF207', 'TRABID'    );
   FiltraTabla( DMAF.cdsDesac,    'ACF105', 'DESACID'   );
   FiltraTabla( DMAF.cdsEstado,   'ACF109', 'ESTADOID'   );
   FiltraTabla( DMAF.cdsMotivo,   'ACF108', 'MOTID'   );


   DMAF.cdsQry.Close;
   DMAF.cdsQry.datarequest('select * from SOLCONFIG');
   DMAF.cdsQry.Open;

   xCtas1:=Trim( DMAF.cdsQry.FieldByName('ACFCTAS1').AsString );
   xCtas2:=Trim( DMAF.cdsQry.FieldByName('ACFCTAS2').AsString );
   xWhere1:='';
   xWhere2:='';

   while Length( xCtas1 )>0 do begin

      if Pos('.',xCtas1)>0 then begin
         xCta:=Trim( Copy(xCtas1, 1, Pos('.',xCtas1)-1 ) );
         xCtas1:=Copy(xCtas1, Pos('.',xCtas1)+1, 20 );
      end
      else begin
         xCta:=Trim( Copy(xCtas1, 1, Pos('.',xCtas1)-1 ) );
         xCtas1:=Copy(xCtas1, Pos('.',xCtas1)+1, 20 );
      end;
      if Length( xCta )>0 then begin
         if Length( xWhere1 )=0 then
            xWhere1:=' ( SUBSTR( CUENTAID,1,'+IntToStr(Length(xCta))+')='''+xCta+''' '
         else
            xWhere1:=xWhere1+'or SUBSTR( CUENTAID,1,'+IntToStr(Length(xCta))+')='''+xCta+''' '
      end;
   end;
   if Length(xWhere1)>0 then
      xWhere1:=xWhere1+' ) ';

   // cuentas de depreciacion
   while Length( xCtas2 )>0 do begin

      if Pos('.',xCtas2)>0 then begin
         xCta:=Trim( Copy(xCtas2, 1, Pos('.',xCtas2)-1 ) );
         xCtas2:=Copy(xCtas2, Pos('.',xCtas2)+1, 20 );
      end
      else begin
         xCta:=Trim( Copy(xCtas2,1,Pos('.',xCtas2)-1 ) );
         xCtas2:=Copy(xCtas2, Pos('.',xCtas2)+1, 20 );
      end;
      if Length( xCta )>0 then begin
         if Length( xWhere2 )=0 then
            xWhere2:=' ( SUBSTR( CUENTAID,1,'+IntToStr(Length(xCta))+')='''+xCta+''' '
         else
            xWhere2:=xWhere2+'or SUBSTR( CUENTAID,1,'+IntToStr(Length(xCta))+')='''+xCta+''' '
      end;
   end;
   if Length(xWhere2)>0 then
      xWhere2:=xWhere2+' ) ';

{   xSQL:='SELECT * FROM TGE202 '
        +'WHERE '+xWhere1+' AND CTA_MOV = ''S'' ';}
   xSQL:='SELECT DISTINCT A.CUENTAID, B.CTADES FROM ACF110 A, TGE202 B WHERE A.CUENTAID=B.CUENTAID ';
   DMAF.cdsCUENTA.Close;
   DMAF.cdsCUENTA.DataRequest( xSQL );
   DMAF.cdsCUENTA.IndexFieldNames:='CUENTAID';
   DMAF.cdsCUENTA.Open;
   pbTablas.Position := pbTablas.Position + 1;

   xSQL:='SELECT * FROM TGE202 '
        +'WHERE '+xWhere2+' AND CTA_MOV = ''S'' ';
   DMAF.cdsCTA.Close;
   DMAF.cdsCTA.DataRequest( xSQL );
   DMAF.cdsCTA.IndexFieldNames:='CUENTAID';
   DMAF.cdsCTA.Open;
   pbTablas.Position := pbTablas.Position + 1;

   xSQL:= 'SELECT * FROM TGE203 WHERE CCOSMOV = ''S'' ';
   DMAF.cdsCCosto.Close;
   DMAF.cdsCCosto.DataRequest( xSQL );
   DMAF.cdsCCosto.Open;

   pbTablas.Position := pbTablas.Position + 1;
end;

procedure TFAccesos.AbrirCDS( xxCds:TwwClientDataSet );
begin
   xxCds.Open;
   pbTablas.Position := pbTablas.Position + 1;
end;

procedure TFAccesos.AbrirTabla( xxTabla:TwwTable );
begin
   xxTabla.Open;
   pbTablas.Position := pbTablas.Position + 1;
end;

procedure TFAccesos.FiltraTabla( xxCds:TwwClientDataSet; xxArchivo,xxCampo:String  );
var
   xFiltro, xxFiltro2 : String;
begin
   DMAF.cdsAcceso.Filtered := False;
   DMAF.cdsAcceso.Filter   := '';
   DMAF.cdsAcceso.Filter   := 'NTabla='+''''+xxArchivo+'''';
   DMAF.cdsAcceso.Filtered := True;

   xFiltro := '';
   DMAF.cdsAcceso.First;
   while not DMAF.cdsAcceso.Eof do begin
      If Length(xFiltro)=0 then
         xFiltro:=xxCampo+'='+''''+DMAF.cdsAcceso.FieldByName('Codigo').AsString+''''
      else
         xFiltro:=xFiltro+' or '+xxCampo+'='+''''+DMAF.cdsAcceso.FieldByName('Codigo').AsString+'''';

      DMAF.cdsAcceso.Next;
   end;

   xSQL2:='';
   xxFiltro2:='';
   if xxCds.Fields.FindField( 'MODULO' )<>Nil then
      xxFiltro2:='MODULO LIKE '+''''+'%'+DMAF.wModulo+'%'+'''';

   if Length(xFiltro)>0 then begin
      xSQL2 := 'Select * from '+ xxArchivo+' Where '+xFiltro;
   end;

   if Length(xxFiltro2)>0 then begin
      if pos('WHERE',xSQL2)>0 Then
         xSQL2:=xSQL2+ ' AND ('  +xxFiltro2+')'
      else
         xSQL2:='Select * from '+ xxArchivo+' WHERE ('+xxFiltro2+')'
   end;

   xxCds.Close;

   if Length(xSQL2)>0 then xxCds.DataRequest( xSQL2 );

   xxCds.Open;

   pbTablas.Position := pbTablas.Position + 1;
end;

procedure TFAccesos.FormCreate(Sender: TObject);
begin
   xVeces := 0;
   dbeUsuario.Text := '';
end;

procedure TFAccesos.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFAccesos.FormActivate(Sender: TObject);
begin
   DMAF.cdsUsuarios.IndexFieldNames := 'UserId;ModuloId';
   DMAF.cdsMGrupo.IndexFieldNames   := 'GrupoId';
   DMAF.cdsGrupos.IndexFieldNames   := 'GrupoId;ModuloId;Tipo;Objeto';
   dbeUsuario.SetFocus;
end;

procedure TFAccesos.dbePasswordExit(Sender: TObject);
begin
   fcbtn1Click(Sender);
end;
                                                                               
                                                                               
function TFAccesos.DesEncripta(wPalabra:String): String;
var
   xLargoPal,i,j : integer;
   xReal,xEncriptado1,xEncriptado2,xEncriptado3,xEncriptado4,
   xEncriptado5,xNuevaPal,xEncriptado : string;
   xTiene : boolean;
begin
   xReal       := 'ABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789abcdefghijklmnñopqrstuvwxyz';
   xEncriptado1:= '|+_)(*&^%$#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM';
   xEncriptado2:= '*&^%$#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(';
   xEncriptado3:= '#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$';
   xEncriptado4:= 'ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$#@!~[';
   xEncriptado5:= ';"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$#@!~[ñ{}]:';
   xLargoPal   := length(wPalabra);
   xNuevaPal   := '';
   i := 1;
   while i<=xLargoPal do begin
      j := 1;
      xTiene := False;
      if (i=1) or (i=11)or (i=21) or (i=31) then xEncriptado:=xEncriptado1;
      if (i=2) or (i=12)or (i=22) or (i=32) then xEncriptado:=xEncriptado2;
      if (i=3) or (i=13)or (i=23) or (i=33) then xEncriptado:=xEncriptado3;
      if (i=4) or (i=14)or (i=24) or (i=34) then xEncriptado:=xEncriptado4;
      if (i=5) or (i=15)or (i=25) or (i=35) then xEncriptado:=xEncriptado5;
      if (i=6) or (i=16)or (i=26) or (i=36) then xEncriptado:=xEncriptado1;
      if (i=7) or (i=17)or (i=27) or (i=37) then xEncriptado:=xEncriptado2;
      if (i=8) or (i=18)or (i=28) or (i=38) then xEncriptado:=xEncriptado3;
      if (i=9) or (i=19)or (i=29) or (i=39) then xEncriptado:=xEncriptado4;
      if (i=10)or (i=20)or (i=30) or (i=40) then xEncriptado:=xEncriptado5;
      while j<=length(xReal) do begin
         if copy(wPalabra,i,1)=copy(xEncriptado,j,1) then begin
            xNuevaPal := xNuevaPal+copy(xReal,j,1);
            xTiene := True;
         end;
         j := j+1;
      end;
      if not xTiene then xNuevaPal:=xNuevaPal+copy(wPalabra,i,1);
      i := i+1;
   end;
   result:=xNuevaPal;
end;

function TFAccesos.Encripta(wPalabra:String): String;
var
   xLargoPal,i,j : integer;
   xReal,xEncriptado1,xEncriptado2,xEncriptado3,xEncriptado4,
   xEncriptado5,xNuevaPal,xEncriptado : string;
   xTiene : boolean;
begin
   xReal       := 'ABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789abcdefghijklmnñopqrstuvwxyz';
   xEncriptado1:= '|+_)(*&^%$#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM';
   xEncriptado2:= '*&^%$#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(';
   xEncriptado3:= '#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$';
   xEncriptado4:= 'ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$#@!~[';
   xEncriptado5:= ';"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$#@!~[ñ{}]:';
   xLargoPal   := length(wPalabra);
   xNuevaPal   := '';
   i := 1;
   while i<=xLargoPal do begin
      j := 1;
      xTiene := False;
      if (i=1) or (i=11)or (i=21) or (i=31) then xEncriptado:=xEncriptado1;
      if (i=2) or (i=12)or (i=22) or (i=32) then xEncriptado:=xEncriptado2;
      if (i=3) or (i=13)or (i=23) or (i=33) then xEncriptado:=xEncriptado3;
      if (i=4) or (i=14)or (i=24) or (i=34) then xEncriptado:=xEncriptado4;
      if (i=5) or (i=15)or (i=25) or (i=35) then xEncriptado:=xEncriptado5;
      if (i=6) or (i=16)or (i=26) or (i=36) then xEncriptado:=xEncriptado1;
      if (i=7) or (i=17)or (i=27) or (i=37) then xEncriptado:=xEncriptado2;
      if (i=8) or (i=18)or (i=28) or (i=38) then xEncriptado:=xEncriptado3;
      if (i=9) or (i=19)or (i=29) or (i=39) then xEncriptado:=xEncriptado4;
      if (i=10)or (i=20)or (i=30) or (i=40) then xEncriptado:=xEncriptado5;
      while j<=length(xReal) do begin
         if copy(wPalabra,i,1)=copy(xReal,j,1) then begin
            xNuevaPal := xNuevaPal+copy(xEncriptado,j,1);
            xTiene := True;
         end;
         j := j+1;
      end;
      if not xTiene then xNuevaPal:=xNuevaPal+copy(wPalabra,i,1);
      i := i+1;
   end;
   result:=xNuevaPal;
end;



end.
