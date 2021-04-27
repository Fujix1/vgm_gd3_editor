unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, ShellAPI, ActnList, System.IOUtils;

type
  TForm1 = class(TForm)
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    edtFilePath: TEdit;
    lbl: TLabel;
    lblFileSize: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lblClkYM2151: TLabel;
    lblClkYM2203: TLabel;
    lblClkYM2612: TLabel;
    lblClkAY8910: TLabel;
    lblClkYM3812: TLabel;
    lblClkYM3526: TLabel;
    lblClkYM2608: TLabel;
    Label9: TLabel;
    lblClkSN76489: TLabel;
    Label10: TLabel;
    edtEofOffset: TEdit;
    Label11: TLabel;
    edtVersion: TEdit;
    Label12: TLabel;
    edtTotalSamples: TEdit;
    Label13: TLabel;
    edtGD3offset: TEdit;
    Label14: TLabel;
    edtLoopOffset: TEdit;
    Label15: TLabel;
    edtLoopSamples: TEdit;
    Label16: TLabel;
    edtVGMDataOffset: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Memo1: TMemo;
    Button2: TButton;
    SaveDialog1: TSaveDialog;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private 宣言 }
  procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
    procedure OpenFileHandler( FilePath: String);

  public
    { Public 宣言 }
  end;

var
  Form1:        TForm1;

  FS:           TFileStream;
  Buffer:       TBytes;
  gd3offset:    Uint32;
  vgmPointer:   Uint32;
  gd3:          array [0..10] of String;
  gd3Length:    Uint32;
  dataOffset:   Uint32;
  vgmVersion:   Uint32;
  isChanged:    boolean;

function get_vgm_ui8(): Uint8;
function get_vgm_ui16(): Uint16;
function get_vgm_ui32_at(pos: Integer): Uint32;


implementation

{$R *.dfm}

//----------------------------------------------------------------------
// 1バイト返す
function get_vgm_ui8(): Uint8;
var vgmPointerTemp: integer;
begin
  vgmPointerTemp := vgmPointer;
  Inc(vgmPointer);
  Result := Buffer[vgmPointerTemp];
end;

//----------------------------------------------------------------------
// 2バイト返す
function get_vgm_ui16(): Uint16;
var vgmPointerTemp: integer;
begin
  vgmPointerTemp := vgmPointer;
  Inc(vgmPointer,2);
  Result := UInt16(Buffer[vgmPointerTemp]) + UInt16(Buffer[vgmPointerTemp+1] shl 8);
end;

//----------------------------------------------------------------------
// 指定場所の 32 bit 返す
function get_vgm_ui32_at(pos: Integer): Uint32;
begin
  Result:= UInt32(Buffer[pos]) + UInt32(Buffer[pos+1] shl 8) +
           UInt32(Buffer[pos+2] shl 16) + UInt32(Buffer[pos+3] shl 24);
end;


//-----------------------------------------------------------------------
// ファイルオープン
procedure TForm1.OpenFileHandler(FilePath: String);
var
  i:integer;
  st: string;
  c: char;
begin

  st:=TPath.GetExtension(FilePath);
  if st<>'.vgm' then exit;

  OpenDialog1.FileName:=FilePath;
  OpenDialog1.InitialDir:=ExtractFilePath(FilePath);
  SaveDialog1.InitialDir:=ExtractFilePath(FilePath);
  SaveDialog1.FileName := FilePath;



  edtFilePath.Text:=FilePath;
  FS:=TFileStream.Create(FilePath, fmOpenRead);
  vgmPointer := 0;


  try
    lblFileSize.Caption:=inttostr(FS.Size) + ' bytes';
    SetLength(Buffer, FS.Size+1);
    FS.ReadBuffer(Pointer(Buffer)^, FS.Size);

    gd3offset := get_vgm_ui32_at($14)+$14;

    edtEofOffset.Text := '0x'+InttoHEX(get_vgm_ui32_at($04));
    vgmVersion := get_vgm_ui32_at($08);
    edtVersion.Text := '0x'+InttoHEX(vgmVersion);
    edtLoopOffset.Text := '0x'+InttoHEX(get_vgm_ui32_at($1c));
    edtTotalSamples.Text := InttoStr(get_vgm_ui32_at($18));
    edtGD3Offset.Text := '0x'+InttoHEX(gd3offset);
    edtLoopSamples.Text := InttoStr(get_vgm_ui32_at($20));

    if (vgmVersion>=$150) then
      dataOffset := get_vgm_ui32_at($34)+$34
    else
      dataOffset := $40;

    lblClkYM2151.Caption := Inttostr(get_vgm_ui32_at($30));
    lblClkYM2612.Caption := Inttostr(get_vgm_ui32_at($2C));
    lblClkSN76489.Caption := Inttostr(get_vgm_ui32_at($0c));

    if (dataOffset>=$78) then
    begin
      lblClkYM2203.Caption := Inttostr(get_vgm_ui32_at($44));
      lblClkAY8910.Caption := Inttostr(get_vgm_ui32_at($74));
      lblClkYM3812.Caption := Inttostr(get_vgm_ui32_at($50));
      lblClkYM3526.Caption := Inttostr(get_vgm_ui32_at($54));
      lblClkYM2608.Caption := Inttostr(get_vgm_ui32_at($48));
    end;


    edtVGMDataOffset.Text := '0x'+InttoHEX(get_vgm_ui32_at($34)+$34);

    // Gd3 が有効か
    if (gd3offset <> -1) and (get_vgm_ui32_at(gd3offset) = $20336447) then
    begin

      gd3Length := get_vgm_ui32_at(gd3offset + 8);
      vgmPointer := gd3offset + 12;

      for i := 0 to 10 do
      begin
        st := '';
        c := char(get_vgm_ui16);
        while c<>#0 do
        begin
          if c=#2560 then   // 改行コード 0x00 0x0a
            st := st+#13#10
          else
            st := st+String(c);
          c := char(get_vgm_ui16);
        end;
        gd3[i] := Trim(st);

      end;


      if CheckBox1.Checked = false then
      begin
        Edit1.Text := gd3[0];
        Edit2.Text := gd3[1];
        Edit3.Text := gd3[2];
        Edit4.Text := gd3[3];
        Edit5.Text := gd3[4];
        Edit6.Text := gd3[5];
        Edit7.Text := gd3[6];
        Edit8.Text := gd3[7];
        Edit9.Text := gd3[8];
        Edit10.Text := gd3[9];
        Memo1.Lines.Clear;
        Memo1.Text:= gd3[10];
      end;


    end
    else
    begin
      gd3Length := 0;
    end;


  finally
    FS.Free;
    isChanged := false;
    Button2.Enabled:=false;
  end;


end;

procedure TForm1.Button1Click(Sender: TObject);
begin

  if OpenDialog1.Execute then
  begin

    OpenFileHandler(OpenDialog1.FileName);

  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
var NewFS:      TFileStream;
    Gd3Header:  TBytes;
    Gd3Buffer:  TBytes;
    Gd3BufferSize: Integer;
    St : String;
    i: integer;
    c: WChar;
    b: uint16;

begin
  SaveDialog1.FileName:=OpenDialog1.FileName;
  if SaveDialog1.Execute then
  begin
    NewFS := TFileStream.Create(SaveDialog1.FileName, fmCreate);
    Gd3BufferSize := 0;
    St:='';

    try
      NewFS.Write(Buffer, gd3offset);

      // Gd3 ヘッダ
      SetLength(Gd3Header, 12);
      Gd3Header[0]:= $47; // G
      Gd3Header[1]:= $64; // d
      Gd3Header[2]:= $33; // 3
      Gd3Header[3]:= $20; // 0
      Gd3Header[4]:= $00; //
      Gd3Header[5]:= $01; //
      Gd3Header[6]:= $00; //
      Gd3Header[7]:= $00; //

      gd3[0] := Trim(Edit1.Text);
      gd3[1] := Trim(Edit2.Text);
      gd3[2] := Trim(Edit3.Text);
      gd3[3] := Trim(Edit4.Text);
      gd3[4] := Trim(Edit5.Text);
      gd3[5] := Trim(Edit6.Text);
      gd3[6] := Trim(Edit7.Text);
      gd3[7] := Trim(Edit8.Text);
      gd3[8] := Trim(Edit9.Text);
      gd3[9] := Trim(Edit10.Text);
      gd3[10] := Trim(Memo1.Text);

      for i := 0 to 10 do
      begin
        St := St+gd3[i]+#00;
      end;
      St:=Trim(StringReplace(St,#13,'',[rfReplaceAll]));

      SetLength(Gd3Buffer, St.Length*2 + 2);
      for i := 1 to St.Length do  // Delphi は一文字目は 1
      begin
        c:=St[i];
        b:=uint16(c);
        if c=#10 then   // 改行文字は 0x00 0x0a 固定
        begin
          Gd3Buffer[(i-1)*2] := b shr 8;
          Gd3Buffer[(i-1)*2 + 1] := $00ff AND b;
        end
        else
        begin
          Gd3Buffer[(i-1)*2 + 1] := b shr 8;
          Gd3Buffer[(i-1)*2] := $00ff AND b;
        end;

      end;

      // Note 最後は 0x00 0x00
      Gd3Buffer[ St.Length*2+1 ] := 0;
      Gd3Buffer[ St.Length*2+2 ] := 0;


      // Gd3 サイズ
      gd3Header[11]:= uint32(St.Length*2+2) shr 24;
      gd3Header[10]:= uint32(St.Length*2+2) shr 16;
      gd3Header[9]:= uint32(St.Length*2+2) shr 8;
      gd3Header[8]:= uint32(St.Length*2+2) AND $000000ff;

      NewFS.WriteBuffer(Gd3Header, 12);

      NewFS.WriteBuffer(Gd3Buffer, St.Length*2+2);

    finally
      NewFS.Free;
    end;
  end;
end;




procedure TForm1.Edit1Change(Sender: TObject);
begin
  isChanged:=true;
  Button2.Enabled := isChanged;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  inherited;
  DragAcceptFiles(Handle, True);

end;


procedure TForm1.WMDropFiles(var msg: TWMDROPFILES);
var
  hDrop: THandle;
  i, DropCount: Integer;
  FileName: PChar;
begin
  hDrop := THandle(Msg.Drop);
  try
   FileName := StrAlloc(MAX_PATH);
   DropCount := DragQueryFile(hDrop, UINT(-1), nil, 0);
    for i := 0 to 0 do
    begin
      DragQueryFile(hDrop, i, FileName, MAX_PATH - 1);    // FileNameの処理
      OpenFileHandler(FileName);
    end;
  finally
    DragFinish(hDrop);
  end;
end;
end.

