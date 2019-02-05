unit oaAF4000;

// Actualizaciones
// HPC_201504_ACF 20/11/2014   Entrega al área de Calidad

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mant, db, ExtCtrls, StdCtrls;

type
  TFInformes = class(TForm)
    lblVersion: TLabel;

  private
    { Private declarations }
  public
    { Public declarations }
    procedure PanelCreaMant(Sender: TObject);
  end;

  procedure AFDepreciacionPreliminar; stdcall;
  procedure AFDepreciacionDefinitiva; stdcall;
  procedure AFResumenAjusteDepreciacion; stdcall;
  procedure AFLegalizacionActivosFijos; stdcall;
  Procedure AFVerificaVersion; stdcall;

exports
  AFDepreciacionPreliminar,
  AFDepreciacionDefinitiva,
  AFResumenAjusteDepreciacion,
  AFLegalizacionActivosFijos,
  AFVerificaVersion;

  var
  FInformes: TFInformes;
  GReporte :TMant;
  pl, pg : TPanel;
  wSql : string;
implementation

uses ACFDM, ACF320, ACF774;

{$R *.dfm}

procedure AFDepreciacionPreliminar;
begin
   if DMAF=nil then exit;
  if not DMAF.DCOM1.Connected then Exit;

  try
     try
        GReporte:=TMant.Create(Application);
        GReporte.User         := DMAF.wUsuario;
        GReporte.Admin        := DMAF.wAdmin;
        GReporte.DComC        := DMAF.DCom1;
        GReporte.ClientDataSet:= DMAF.cdsQry;
        GReporte.TableName    := 'ACF204W';
        GReporte.Titulo       := 'Depreciación Preliminar';
        GReporte.User         := DMAF.wUsuario;
        GReporte.Module       := DMAF.wModulo;
        GReporte.OnCierra     := DMAF.DisminuyeForma;
        GReporte.SectionName  := 'AFDeprePreliminar';
        GReporte.FileNameIni  := '\oaAF.INI';
        GReporte.Execute;
     finally
     end;
  finally
  end;
end;

procedure AFDepreciacionDefinitiva;
begin
   if DMAF=nil then exit;
  if not DMAF.DCOM1.Connected then Exit;

  try
     try
        GReporte:=TMant.Create(Application);
        GReporte.User         := DMAF.wUsuario;
        GReporte.Admin        := DMAF.wAdmin;
        GReporte.DComC        := DMAF.DCom1;
        GReporte.ClientDataSet:= DMAF.cdsQry;
        GReporte.TableName    := 'ACF204W';
        GReporte.Titulo       := 'Depreciación Definitiva';
        GReporte.User         := DMAF.wUsuario;
        GReporte.Module       := DMAF.wModulo;
        GReporte.OnCierra     := DMAF.DisminuyeForma;
        GReporte.SectionName  := 'AFDepreDefinitiva';
        GReporte.FileNameIni  := '\oaAF.INI';
        GReporte.Execute;
     finally
     end;
  finally
  end;
end;

procedure AFResumenAjusteDepreciacion;
begin
   if DMAF=nil then exit;
  if not DMAF.DCOM1.Connected then Exit;

  try
     FResumen:=TFResumen.Create( Application );    // ACF320
     FResumen.ActiveMDIChild;

  finally
  end;
end;

procedure AFLegalizacionActivosFijos;
begin
   if DMAF=nil then exit;
  if not DMAF.DCOM1.Connected then Exit;

  try
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
        FRepLegal:=TFRepLegal.Create( Application );
        GReporte:=TMant.Create(Application);
        GReporte.User         := DMAF.wUsuario;
        GReporte.Admin        := DMAF.wAdmin;
        GReporte.DComC        := DMAF.DCom1;
        GReporte.ClientDataSet:= DMAF.cdsQry2;
        GReporte.TableName    := 'VWACFLEGAL';
        GReporte.Titulo       := 'Legalizacion de Activos Fijos';
        GReporte.User         := DMAF.wUsuario;
        GReporte.Module       := DMAF.wModulo;
        GReporte.SectionName  := 'AFLegalizacion';
        GReporte.FileNameIni  := '\oaAF.INI';
        GReporte.OnCierra     := DMAF.DisminuyeForma;
        GReporte.OnCreateMant := FInformes.PanelCreaMant;
        GReporte.UsuarioSQL.Add( xSQL );
        GReporte.Execute;
    finally
    end;
  finally
  end;
end;

procedure TFInformes.PanelCreaMant(Sender: TObject);
begin
  pl := TMant(Sender).FMant.pnlBtns;
  pl.Height:= pg.Height+1;
  pg.Align := alClient;
  pg.Parent:= Tmant(Sender).Fmant.pnlBtns;
  pl.AutoSize:=true;
  Tmant(Sender).Fmant.pnlBtns.Visible:=true;
end;

Procedure AFVerificaVersion;
Begin
   If DMAF = Nil Then exit;
   If Not DMAF.DCOM1.Connected Then Exit;
   FInformes := TFInformes.Create(Application);
   If DMAF.fg_VerificaVersion(FInformes.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.' + #13 + 'Comuníquese con Soporte Técnico');
      Application.Terminate;
      Exit;
   End;
End;

end.
