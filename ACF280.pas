unit ACF280;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mant, DB, ppCache, ppDB, ppDBPipe, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, ppBands, dbclient, DBTables, Wwquery,
  StrContainer, ComCtrls;

type
  TFToolsLoadTexto = class(TForm)
    pnlAct: TPanel;
    Z2bbtnGrabar: TBitBtn;
    scFile: TStrContainer;
    Z2bbtnLeer: TBitBtn;
    Label1: TLabel;
    pnlBar: TPanel;
    pbData: TProgressBar;
    Label2: TLabel;
    lblTReg: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Z2bbtnGrabarClick(Sender: TObject);
    procedure Z2bbtnLeerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ProcToolsDepura(Sender: TObject);
  end;

var
  FToolsLoadTexto: TFToolsLoadTexto;
  MantCompras : TMant;

implementation

uses ACFDM, oaAF3000, ACF210, ACF212, ACF775;

{$R *.DFM}

procedure TFToolsLoadTexto.ProcToolsDepura(Sender: TObject);
var
 pl, pg : TPanel;
begin
  pg := FToolsDepura.pnlAct;
  pl := TMant(Sender).FMant.pnlBtns;

  pl.AutoSize := True;
  pg.Align    := alClient;
  pg.Parent   := TMant(Sender).FMant.pnlBtns;
  pl.Height   := pg.Height + 0;

  TMant(Sender).FMant.pnlBtns.Visible  := True;
end;


procedure TFToolsLoadTexto.FormActivate(Sender: TObject);
begin
   ShowMessage( 'Activate');
end;

procedure TFToolsLoadTexto.FormShow(Sender: TObject);
begin
   ShowMessage( 'Show');
end;

procedure TFToolsLoadTexto.Z2bbtnGrabarClick(Sender: TObject);
var
   xLinea, xCampo, xBlanco, xUsuario : String;
   xCont : Integer;
begin

   if MessageDlg('Seguro de Eliminar Data', mtconfirmation,[mbYes,MbNo],0)=mrYes then begin

      DMAF.cdsQry.Last;

      lblTReg.Caption:=IntToStr(DMAF.cdsQry.RecordCount);
      pbData.Max     :=DMAF.cdsQry.RecordCount;
      pbData.Position:=0;
      pnlBar.Visible :=True;
      pnlBar.Refresh;

      DMAF.cdsQry.First;
      xCont:=0;
      while not DMAF.cdsQry.Eof do begin
         DMAF.cdsQry.Delete;
         xCont:=xCont+1;
         pbData.Position:=pbData.Position+1;
         pnlBar.Refresh;
         if xCont>=20 then begin
            DMAF.AplicaDatos( DMAF.cdsQry, '' ); // Adiciona Traslado
            xCont:=0;
            pnlBar.Refresh;
         end
      end;

      pnlBar.Refresh;
      DMAF.AplicaDatos( DMAF.cdsQry, '' ); // Adiciona Traslado
      pnlBar.Refresh;

      ShowMessage('Data Eliminada');

      pnlBar.Visible :=False;
   end;
end;

procedure TFToolsLoadTexto.Z2bbtnLeerClick(Sender: TObject);
var
   i, xCont : Integer;
begin

   if MessageDlg('Seguro de Recuperar Data Texto', mtconfirmation,[mbYes,MbNo],0)=mrYes then begin


      scFile.Lines.LoadFromFile('C:\INVENTARIO\BANCO1\RECIBO\FLINVT.TXT');

      lblTReg.Caption:=IntToStr(scFile.Lines.Count);
      pbData.Max     :=scFile.Lines.Count;
      pbData.Position:=0;
      pnlBar.Visible :=True;
      pnlBar.Refresh;

      xCont:=0;

      for i:=0 to scFile.Lines.Count-1 do begin

          DMAF.cdsQry.Insert;
          DMAF.cdsQry.FieldByName('CODBAR').Value :=Copy( scFile.Lines[ i ], 000, 06 );
          DMAF.cdsQry.FieldByName('LOCID').Value  :=Copy( scFile.Lines[ i ], 007, 03 );
          DMAF.cdsQry.FieldByName('UBICID').Value :=Copy( scFile.Lines[ i ], 010, 08 );
          DMAF.cdsQry.FieldByName('ACFDES').Value :=Copy( scFile.Lines[ i ], 018, 50 );
          DMAF.cdsQry.FieldByName('USUARIO').Value:=Copy( scFile.Lines[ i ], 068, 50 );
          DMAF.cdsQry.FieldByName('MARCA').Value  :=Copy( scFile.Lines[ i ], 118, 20 );
          DMAF.cdsQry.FieldByName('MODELO').Value :=Copy( scFile.Lines[ i ], 138, 20 );
          DMAF.cdsQry.FieldByName('SERIE').Value  :=Copy( scFile.Lines[ i ], 158, 20 );

          DMAF.cdsUbica.SetKey;
          DMAF.cdsUbica.FieldByname('UBICID').Value:=DMAF.cdsQry.FieldByName('UBICID').AsString;
          if DMAF.cdsUbica.GotoKey then
             DMAF.cdsQry.FieldByName('UBICDES').Value:=DMAF.cdsUbica.FieldByname('UBICDES').AsString;

          DMAF.cdsLocalidad.SetKey;
          DMAF.cdsLocalidad.FieldByname('LOCID').Value:=DMAF.cdsQry.FieldByName('LOCID').AsString;
          if DMAF.cdsLocalidad.GotoKey then
             DMAF.cdsQry.FieldByName('LOCDES').Value:=DMAF.cdsLocalidad.FieldByname('LOCDES').AsString;


          DMAF.cdsTipAct.SetKey;
          DMAF.cdsTipAct.FieldByname('TACFID').Value:=DMAF.cdsQry.FieldByName('TACFID').AsString;
          if DMAF.cdsTipAct.GotoKey then
             DMAF.cdsQry.FieldByName('TACFDES').Value:=DMAF.cdsTipAct.FieldByname('TACFDES').AsString;


          if Length( Trim( Copy( scFile.Lines[ i ], 178, 10 ) ) )>=8 then
             DMAF.cdsQry.FieldByName('FECHA').Value:=Strtodate( Copy( scFile.Lines[ i ], 178, 10) );

          if Length( Trim( Copy( scFile.Lines[ i ], 188, 08 ) ) )>=6 then
             DMAF.cdsQry.FieldByName('HORA').Value :=StrToTime( Copy( scFile.Lines[ i ], 188, 08) );

          if Copy( scFile.Lines[ i ], 196, 01 )=' ' then
             DMAF.cdsQry.FieldByName('ESTADO').Value :='NO EXISTE';
          if Copy( scFile.Lines[ i ], 196, 01 )='N' then
             DMAF.cdsQry.FieldByName('ESTADO').Value :='NUEVO';
          if Copy( scFile.Lines[ i ], 196, 01 )='M' then
             DMAF.cdsQry.FieldByName('ESTADO').Value :='MODIFICADO';
          if Copy( scFile.Lines[ i ], 196, 01 )='V' then
             DMAF.cdsQry.FieldByName('ESTADO').Value :='VERIFICADO';

          pbData.Position:=pbData.Position+1;
          pnlBar.Refresh;

          xCont:=xCont+1;
          if xCont>=20 then begin
             DMAF.AplicaDatos( DMAF.cdsQry, '' ); // Adiciona Traslado

             xCont:=0;
             pnlBar.Refresh;
          end

      end;
      pnlBar.Refresh;

      DMAF.AplicaDatos( DMAF.cdsQry, '' ); // Adiciona Traslado
      pnlBar.Refresh;
      ShowMessage( 'Data Transferida');

      pnlBar.Visible :=False;
   end;

end;

end.
