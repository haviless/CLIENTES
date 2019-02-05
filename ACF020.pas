Unit ACF020;

// Actualizaciones
// HPC_201701_ACF 26/10/2017 Entrega a Control de Calidad
// HPC_201801_ACF 22/08/2018 Se corrige la rutina del evento enter

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   SConnect,
   Dialogs, StdCtrls, fcButton, fcImgBtn, fcShapeBtn, Buttons, Mask,
   wwdbedit;

Type
   TFCtrlAcceso = Class(TForm)
      BLogin_Entrada: TfcShapeBtn;
      BLogin_Salir: TfcShapeBtn;
      lblmodulo: TLabel;
      gbControlAcceso: TGroupBox;
      lblUsuario: TLabel;
      lblContrasena: TLabel;
      dbePassword: TwwDBEdit;
      dbeUsuario: TwwDBEdit;
      bbtnOkIngreso: TBitBtn;
      bbtnCancelaIngreso: TBitBtn;
      Label2: TLabel;
      Label1: TLabel;
      Procedure BLogin_EntradaClick(Sender: TObject);
      Procedure BLogin_SalirClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
   Private
      xSQL: String;
      xVez: integer;
   Public
      { Public declarations }
      xdiasduracpass: Integer;
      wDCOM1: TSocketConnection;
      wModulo, wSRV, wAdmin, wClose: String;
      nCont: Integer;
      cAccesoSistema: String;
   End;

Var
   FCtrlAcceso: TFCtrlAcceso;

Implementation

Uses ACFDM;
{$R *.dfm}

Procedure TFCtrlAcceso.BLogin_EntradaClick(Sender: TObject);
Var
   xfecfin: TDate;
   xdiasexppass: Integer;
   xdiasfaltantes: Integer;
   xpassact, xctrl_ip, xingresa: String;
Begin
// Usuario se conecta a la base de datos
   inc(nCont);
   cAccesoSistema := 'N';
   Try
      wDCOM1.AppServer.Conectate('xxxxxx', dbeUsuario.Text, dbePassword.Text, cAccesoSistema);
      If cAccesoSistema = 'N' Then
      Begin
         Showmessage('Usuario y/o contraseña no reconocido por la Base de Datos');
         If nCont >= 3 Then
         Begin
            ShowMessage('Tres intentos fallidos de conexión, se bloqueara su Usuario. Avice a Sistemas para volver a intentar');
            Application.Terminate;
         End;
         Exit;
      End;
   Except
      Showmessage('Usuario y/o contraseña no reconocido por la Base de Datos');
      If nCont > 3 Then
      Begin
         ShowMessage('Tres intentos fallidos de conexión, se bloqueara su Usuario. Avice a Sistemas para volver a intentar');
         Application.Terminate;
      End;
      Exit;
   End;
   Close;
End;

Procedure TFCtrlAcceso.BLogin_SalirClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFCtrlAcceso.FormShow(Sender: TObject);
Begin
   xVez := 0;
   dbeUsuario.SetFocus;
End;

Procedure TFCtrlAcceso.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key = #13 Then
   Begin
// Inicio HPC_201801_ACF
// Se corrige la rutina del evento enter
   //   BLogin_EntradaClick(Self);
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
// Fin HPC_201801_ACF
   End;
End;

End.

