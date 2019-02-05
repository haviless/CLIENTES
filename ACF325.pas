unit ACF325;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, FileCtrl;

type
  TFTxtPC = class(TForm)
    DriveComboBox1: TDriveComboBox;
    DirectoryListBox1: TDirectoryListBox;
    FileListBox1: TFileListBox;
    Z2bbtnOk: TBitBtn;
    procedure Z2bbtnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTxtPC: TFTxtPC;

implementation

uses ACF779;
{$R *.dfm}

procedure TFTxtPC.Z2bbtnOkClick(Sender: TObject);
begin
   wDirTxt:=FileListBox1.Directory+'\';
   Close;
end;

procedure TFTxtPC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFTxtPC.FormShow(Sender: TObject);
begin
   DriveComboBox1.SetFocus;
end;

end.
