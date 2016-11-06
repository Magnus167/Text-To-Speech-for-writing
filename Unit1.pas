unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtDlgs, Vcl.StdCtrls, ShellApi;

type
  TForm1 = class(TForm)
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    StaticText1: TStaticText;
    ComboBox1: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function propfy(s: TStringList): string;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  textx: TStringList;
  speech: String;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  n: Int64;
begin

  if OpenDialog1.Execute = True then
  begin
    // textx.LoadFromFile(OpenDialog1.FileName);

    for n := 0 to OpenDialog1.Files.Count - 1 do
      Memo1.Lines.LoadFromFile(OpenDialog1.Files[n]);
    textx.Add(Memo1.Text);

  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  speech := propfy(textx);

  Memo1.Text := speech;

  // showmessage(speech);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  spk: TStringList;
  loc: String;
  wideChars: Array [0..100000] of  widechar;
begin
  spk := TStringList.Create;
  spk.Add('Set voice = CreateObject("SAPI.SpVoice")');

  if ComboBox1.Text = 'Select Speed...' then
    ComboBox1.Text := 'Normal';

  if ComboBox1.Text = 'Slow' then

    spk.Add('voice.Rate = -5')
  else if ComboBox1.Text = 'Fast' then
    spk.Add('voice.Rate = 2')
  else
    spk.Add('voice.Rate = -1');

  spk.Add('voice.Volume = 90');

  spk.Add('voice.Speak "' + speech + ' "');

  loc := GetCurrentDir + '\txttspchtf.vbs';
  spk.SaveToFile((GetCurrentDir) + '\txttspchtf.vbs');

  ShellExecute(Handle, 'open', StringToWideChar(loc, wideChars,100001) , nil, nil,
    SW_SHOWNORMAL);
end;

procedure TForm1.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  Memo1.Text := '';
  textx := TStringList.Create;
  ComboBox1.AddItem('Fast', nil);
  ComboBox1.AddItem('Normal', nil);

  ComboBox1.AddItem('Slow', nil);
end;

function TForm1.propfy(s: TStringList): string;
var
  i: Integer;
  sx: String;
  sxr: String;
begin

  for i := 0 to s.Count - 1 do
    sx := sx + s.Strings[i];

  for i := 1 to sx.Length do
  begin

    sx := StringReplace(sx, sLineBreak, ' ', [rfReplaceAll]);

    if sx[i] = ' ' then
      sxr := sxr + ' . '
    else if sx[i] = '.' then
      sxr := sxr + ' .  .   Full Stop ,  , '
    else if sx[i] = ',' then
      sxr := sxr + ' ,  Comma  , '
    else if sx[i] = '' then

      sxr := sxr + ' . '
    else

      sxr := sxr + sx[i];

  end;
  result := sxr;
end;

end.
