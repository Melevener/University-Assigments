unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, Menus,
  ExtCtrls, IniPropStorage, StdCtrls, Grids, unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    IniPropStorage1: TIniPropStorage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    Memo2: TMemo;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    PopupMenu1: TPopupMenu;
    SaveDialog1: TSaveDialog;
    StringGrid1: TStringGrid;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Timer1: TTimer;
    TimerVed: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TimerVedTimer(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.MenuItem1Click(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  Edit1.Text:= OpenDialog1.FileName;

end;

Function ProvS(Fam, Str, Vid, Dist: string): boolean;
var
  i: Integer;
begin
  ProvS:= True;
  for i:= 1 to Form1.StringGrid1.RowCount- 1 do
   if (Form1.StringGrid1.Cells[0,i]= Trim(Fam)) and (Form1.StringGrid1.Cells[1,i]= Trim(Str)) and (Form1.StringGrid1.Cells[2,i]= Trim(Vid)) and (Form1.StringGrid1.Cells[3,i]= Trim(Dist)) then
   begin
     ProvS:= False;
     break;
   end;
end;

Function PSave: boolean;
var
  i,j: Integer;
  st: string;
begin
  PSave:= True;
  Form1.Memo2.Clear;
  for i:= 0 to Form1.StringGrid1.RowCount- 1 do
   begin
    st:= '';
    for j:= 0 to 4 do
     st:= st+ Form1.StringGrid1.Cells[j,i]+ '  ';
    Form1.Memo2.Lines.Add(st);
   end;
  try
     Form1.Memo2.Lines.SaveToFile('Medals.txt');
     Form1.StringGrid1.SaveToCSVFile('BDsports.csv');
  except
    PSave:= False;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if ProvS(Edit2.Text, ComboBox1.Text, ComboBox2.Text, ComboBox3.Text) then
  begin
    StringGrid1.RowCount:= StringGrid1.RowCount+ 1;
    StringGrid1.Cells[0,StringGrid1.RowCount- 1]:= Trim(Edit2.Text);
    StringGrid1.Cells[1,StringGrid1.RowCount- 1]:= Trim(ComboBox1.Text);
    StringGrid1.Cells[2,StringGrid1.RowCount- 1]:= Trim(ComboBox2.Text);
    StringGrid1.Cells[3,StringGrid1.RowCount- 1]:= Trim(ComboBox3.Text);
    StringGrid1.Cells[4,StringGrid1.RowCount- 1]:= Trim(ComboBox4.Text);
    if PSave then
    begin
     ShowMessage('Данные о спортсмене '+ Edit2.Text+ ' успешно сохранены!');
     Edit2.Clear;
     Edit2.SetFocus;
    end
    else
     begin
      StringGrid1.RowCount:= StringGrid1.RowCount- 1;
      MessageDlg('Невозможно сохранить данные!!!', mtWarning, [mbOk, mbCancel], 0);
     end;
  end
  else
   MessageDlg('Спортсмен '+ Edit2.Text+ ' уже имеется в ведомости!', mtWarning, [mbOk, mbCancel], 0);
end;

procedure TForm1.Edit1Change(Sender: TObject);
var
  i: integer;
  pr: boolean;
begin
  pr:= True;
  for i:= 1 to Length(Edit1.Text) do
  if pos(Edit1.Text[i], '*/?<>|')> 0 then
  begin
    pr:= False;
    break;
  end;
   if pr then Edit1.Color:= clDefault
   else Edit1.Color:= clRed;
end;

procedure TForm1.Edit2Change(Sender: TObject);
var
  i: integer;
  pr: boolean;
begin
  if Length(Trim(Edit2.Text))<> 0 then
  begin
  if Length(Trim(Edit2.Text))> 3 then
  begin
       pr:= True;
       for i:= 1 to Length(Edit2.Text) do
       if pos(Edit2.Text[i], 'abcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+-=;:",./<>?'+ chr(39))> 0 then
       begin
            pr:= False;
            break;
       end;
       if pr then Edit2.Color:= clDefault
       else Edit2.Color:= clRed;
  end
  else
      Edit2.Color:= clRed;
  end
  else
   Edit2.Color:= clDefault;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  try
    if FileExists(ExtractFilePath(paramStr(0))+('BDsports.csv') then
    Form1.StringGrid1.LoadFromCSVFile('BDsports.csv');
  except
    MessageDlg('Невозможно получить доступ к базе данных спортсменов!', mtWarning, [mbOk, mbCancel], 0);
    application.Terminate;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  try
    Memo1.Lines.SaveToFile(Edit1.Text);
    ShowMessage('Данные успешно сохранены в файле '+ Edit1.Text);
  except
    MessageDlg('Невозможно сохранить файл!', mtWarning, [mbOk, mbCancel], 0);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  try
    Memo2.Lines.LoadFromFile(Edit1.Text);
    Memo2.Text:= Memo2.Text+ Memo1.Text;
    Memo2.Lines.SaveToFile(Edit1.Text);
    ShowMessage('Данные успешно добавлены в файл '+ Edit1.Text);
  except
    MessageDlg('Невозможно сохранить файл!', mtWarning, [mbOk, mbCancel], 0);
  end;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
var
  vibor: Integer;
begin
  vibor:= MessageDlg('Вы действительно хотите удалить спортсмена '+ #13+  StringGrid1.Cells[0, StringGrid1.Row]+ ' ?', mtWarning, [mbOk, mbCancel], 0);
  if vibor= MrOk then
  begin
   StringGrid1.DeleteRow(StringGrid1.Row);
   if PSave then
    begin
     ShowMessage('Данные о спортсмене '+ StringGrid1.Cells[0, StringGrid1.Row]+ ' успешно удалены!');
    end
    else
     begin
      MessageDlg('Невозможно сохранить данные!!!', mtWarning, [mbOk, mbCancel], 0);
     end;
  end;
end;

procedure TForm1.TabSheet2Show(Sender: TObject);
begin
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  PageControl1.Width:= Form1.Width;
  PageControl1.Height:= Form1.Height;
  if (length(Memo1.Text)> 0) and (Edit1.Color= clDefault) and (length(Trim(Edit1.Text))> 0) and (FileExists(Trim(Edit1.Text))) then
   begin
     Button1.Enabled:= True;
     Button2.Enabled:= True;
   end
   else
     Button1.Enabled:= False;
     Button2.Enabled:= False;
end;

procedure TForm1.TimerVedTimer(Sender: TObject);
begin
  if (Edit2.Color= clDefault) then
     Button4.Enabled:= True
  else
     Button4.Enabled:= False;
end;

end.

