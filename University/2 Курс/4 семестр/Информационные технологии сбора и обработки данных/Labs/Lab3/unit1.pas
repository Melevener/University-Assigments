unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, Menus,
  StdCtrls, Grids, ExtCtrls, unit2, math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button2: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    SaveDialog1: TSaveDialog;
    StringGrid1: TStringGrid;
    StringGrid10: TStringGrid;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    StringGrid4: TStringGrid;
    StringGrid5: TStringGrid;
    StringGrid6: TStringGrid;
    StringGrid7: TStringGrid;
    StringGrid8: TStringGrid;
    StringGrid9: TStringGrid;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    Timer1: TTimer;
    TimerZP: TTimer;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TimerZPTimer(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormResize(Sender: TObject);
begin
  PageControl1.Width:=Form1.Width;
  PageControl1.Height:=Form1.Height;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  x: integer;
begin
   if Memo1.Lines.Count > 0 then
  if Memo1.Lines.Count <= 5 then
    begin
      x:= 6 - Memo1.Lines.Count;
      showMessage('Количество введенных строк меньше необходимого количества!'+#13+'Вам осталось ввести '+IntToStr(x)+' строк!')
    end
    else
      showMessage(Memo1.Text);
end;

procedure TForm1.Button20Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    try
      memo3.Lines.LoadFromFile(OpenDialog1.FileName);
      if pos(',',memo3.Lines[0])>0 then
        begin
             StringGrid8.LoadFromCSVFile(OpenDialog1.FileName);
        end
      else
           MessageDlg('Невозможно получить данные', mtWarning, [mbOk], 0);
    except
      MessageDlg('Невозможно получить данные', mtWarning, [mbOk], 0)
    end;
end;

procedure TForm1.Button21Click(Sender: TObject);
begin
  StringGrid8.RowCount:= StringGrid9.RowCount+ 1;
  StringGrid9.RowCount:= StringGrid8.RowCount+ 1;
end;

procedure TForm1.Button22Click(Sender: TObject);
var
  vvod, num: integer;
begin
  if StringGrid8.RowCount> 1 then
    begin
      num:= StringGrid8.Row;
      vvod:= MessageDlg('Вы действительно хотите удалить строку, содержащую Ф.И.О.'+ StringGrid8.Cells[0, num], mtWarning, [mbOk, mbCancel], 0);
      if vvod= mrOk then
        begin
          StringGrid8.DeleteRow(num);
          StringGrid9.DeleteRow(num);
      end;
    end;
end;

procedure TForm1.Button23Click(Sender: TObject);
var i, j: integer;
begin
   for i:= 1 to 3 do
    for j:= 1 to 3 do
      StringGrid8.Cells[i, j]:= IntToStr(random(100));
      StringGrid8.Cells[0,1]:= 'Иванов';
      StringGrid8.Cells[0,2]:= 'Петров';
      StringGrid8.Cells[0,3]:= 'Сидоров';
      for j:= 1 to 3 do
       begin
        StringGrid8.Cells[4, j]:=  '1,20';
        StringGrid8.Cells[5, j]:=  '13';
       end;
end;

procedure TForm1.Button24Click(Sender: TObject);
var
  columns: TStringList;
  i, j: integer;
begin
  columns := TStringList.Create;
  try
    for j := 0 to StringGrid10.ColCount - 1 do
    begin
      for i := 0 to StringGrid10.RowCount - 1 do
      begin
        try

          if (Trim(StringGrid10.Cells[j, i]) <> '') and
             (StrToFloat(Trim(StringGrid10.Cells[j, i])) > 0) and
             (StrToFloat(Trim(StringGrid10.Cells[j, i])) mod 3 = 0) then
          begin
            columns.Add(IntToStr(j + 1));
            Break;
          end;
        except
        end;
      end;
    end;

    if columns.Count > 0 then
      Label7.Caption := 'Столбцы с положительными кратными трём числами: ' + columns.CommaText
    else
      Label7.Caption := 'Нет столбцов с положительными кратными трём числами';
  finally
    columns.Free;
  end;
end;

procedure TForm1.Button25Click(Sender: TObject);
var i, j: integer;
begin
   for i:= 0 to 6 do
    for j:= 0 to 2 do
      StringGrid10.Cells[i, j]:= '';
   label7.Caption:= '';
end;

procedure TForm1.Button10Click(Sender: TObject);
var i, j: integer;
begin
   for i:= 0 to 2 do
    for j:= 0 to 8 do
      StringGrid4.Cells[i, j]:='';
end;

procedure TForm1.Button11Click(Sender: TObject);
var i, j: integer;
begin
   for i:= 1 to 4 do
    for j:= 1 to 6 do
      StringGrid5.Cells[i, j]:='';

    for j:= 1 to 6 do
      StringGrid6.Cells[0, j]:='';
end;

procedure TForm1.Button12Click(Sender: TObject);
var
  i, j: integer;
  err: boolean;
  summa: real;
begin
  summa:= 0;
  err:= false;
  for j:= 1 to 6 do
  begin
   for i:= 1 to 4 do
   if trim(StringGrid5.Cells[i, j])<>'' then
     try
        if StrToInt(trim(StringGrid5.Cells[i,j]))<> 0 then summa:= summa + StrToFloat(trim(StringGrid5.Cells[i,j]));
     except
       if CheckBox5.Checked then StringGrid5.Cells[i,j]:=''
       else
         begin
         MessageDlg('Обнаружены ошибки в данных в строке'+ IntToStr(j), mtWarning, [mbOk, mbCancel], 0);
         summa:= 0;
         StringGrid6.Cells[0,j]:= '';
         err:= true;
         break;
         end;
     end;
    if err then break;
    if summa<> 0 then
      StringGrid6.Cells[0,j]:= FloatToStr(summa);
      summa:= 0;
   end;
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    try
      StringGrid5.SaveToCSVFile(SaveDialog1.FileName);
    except
      MessageDlg('Невозможно сохранить данные', mtWarning, [mbOk, mbCancel], 0)
    end;
end;

procedure TForm1.Button14Click(Sender: TObject);
var
  kol, i, j: integer;
begin
  Label6.Caption:= '';
  Label6.Visible:= true;
  if Trim(Edit1.Text)<> '' then
    begin
      kol:= 0;
  for i:= 0 to 4 do
   for j:= 0 to 2 do
   if trim(StringGrid7.Cells[i, j])<>'' then
        if trim(StringGrid7.Cells[i,j])= Trim(Edit1.Text) then
             inc(kol);


  if kol<> 0 then
      Label6.Caption:= 'Количество совпадающих с шаблоном элементов:'+ IntToStr(kol)
  else
      ShowMessage('Нет совпадаюших с шаблоном элементов');
    end;
end;

procedure TForm1.Button15Click(Sender: TObject);
var i, j: integer;
begin
  Edit1.Text:='';
   for i:= 0 to 4 do
    for j:= 0 to 2 do
      StringGrid7.Cells[i, j]:='';
   label6.Caption:= '';
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    try
      memo2.Lines.LoadFromFile(OpenDialog1.FileName);
      if pos(',',memo2.Lines[0])>0 then
        begin
             StringGrid5.LoadFromCSVFile(OpenDialog1.FileName);
        end
      else
           MessageDlg('Невозможно получить данные', mtWarning, [mbOk], 0);
    except
      MessageDlg('Невозможно получить данные', mtWarning, [mbOk], 0)
    end;
end;

procedure TForm1.Button17Click(Sender: TObject);
var i, j: integer;
begin
   for i:= 1 to 4 do
    for j:= 1 to 6 do
      StringGrid5.Cells[i, j]:= IntToStr(random(500));
end;

Function ProvFam(str: string): boolean;
var
  i: integer;
  simv: string;
begin
  simv:= 'abcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_-+-=;:",./<>? '+chr(39);
  ProvFam:= true;
  if Length(str)< 3 then ProvFam:= false
  else
  for i:= 1 to Length(str) do
  if (pos(AnsiLowerCase(str[i]), simv)> 0) then
    begin
      ProvFam:= false;
      break;
    end;
end;

procedure TForm1.Button18Click(Sender: TObject);
var
  j,KolSmen: integer;
  err: boolean;
  summa,stsm,procpr,urkoef,Nalog: real;
  strerr: string;
begin
  strerr:= '';
  for j:= 1 to StringGrid8.RowCount-1 do //Количество людей
  begin
     err:= true;
     if trim(StringGrid8.Cells[0,j])<> '' then
      begin
     summa:= 1; //Сумма денежного довольствия для j-ого человека
     //Фамилия
     if not(ProvFam(StringGrid8.Cells[0, j])) then
       begin
         err:= false;
         if CheckBox6.Checked then StringGrid8.Cells[0,j]:= '';
       end;
     //Количество смен
       try
         KolSmen:=StrToInt(trim(StringGrid8.Cells[1,j]));
         if (KolSmen< 0) or (KolSmen> 900) then
           if CheckBox6.Checked then StringGrid8.Cells[1,j]:= '0'
           else err:= false;
       except
         err:= false;
         if CheckBox6.Checked then StringGrid8.Cells[1,j]:= '0';
       end;
     //Стоимость смены
       try
         stsm:=StrToFloat(trim(StringGrid8.Cells[2,j]));
         if (stsm< 0) or (stsm> 1e6) then
           if CheckBox6.Checked then StringGrid8.Cells[2,j]:= '0'
           else err:= false;
       except
         err:= false;
         if CheckBox6.Checked then StringGrid8.Cells[2,j]:= '0';
       end;
       //Процент премии
       try
         if trim(StringGrid8.Cells[3,j])<> '' then
           begin
            procpr:=StrToFloat(trim(StringGrid8.Cells[3,j]));
            //100 2
            procpr:= procpr/ 100 + 1;
            if (procpr< 0) or (procpr> 100) then
              begin
              if CheckBox6.Checked then StringGrid8.Cells[3,j]:= ''
              else err:= false;
              procpr:= 1;
              end;
           end
           else
               procpr:= 1;
       except
         err:= false;
         procpr:= 1;
         if CheckBox6.Checked then StringGrid8.Cells[3,j]:= '0';
       end;
       //Уральский коэффициент
       try
         urkoef:=StrToFloat(trim(StringGrid8.Cells[4,j]));
         if (urkoef< 1.15) or (urkoef> 1.20) then
           if CheckBox6.Checked then StringGrid8.Cells[4,j]:= '1,20'
           else err:= false;
       except
         err:= false;
         if CheckBox6.Checked then StringGrid8.Cells[4,j]:= '1,20';
       end;
       //Налог
       try
         Nalog:=StrToInt(trim(StringGrid8.Cells[5,j]));
         Nalog:= (100- Nalog)/ 100;
         if (Nalog< 0) or (Nalog> 100) then
           if CheckBox6.Checked then StringGrid8.Cells[5,j]:= '13'
           else err:= false;
       except
         err:= false;
         if CheckBox6.Checked then StringGrid8.Cells[5,j]:= '13';
       end;
       //Рассчет денежного довольствия
       StringGrid9.Cells[0,j]:= '';
       if err then
         begin
          summa:= KolSmen*stsm*urkoef*procpr*Nalog;
          StringGrid9.Cells[0,j]:=FloatToStr(summa);
         end
       else
       strerr:=strerr+ IntToStr(j)+ #13;
     end;
  end;
  if Length(strerr)> 0 then
    showMessage('Обнаружены ошибки в следующих строках таблицы:'+#13+ strerr);
end;

procedure TForm1.Button19Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    try
      StringGrid8.SaveToCSVFile(SaveDialog1.FileName);
    except
      MessageDlg('Невозможно сохранить данные', mtWarning, [mbOk, mbCancel], 0)
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Memo1.Clear;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  summa: real;
  kol,i: integer;
begin
  summa:= 0;
  kol:= 0;
  Label3.Caption:= '';
  for i:= 0 to 4 do
   if trim(StringGrid1.Cells[i, 0])<>'' then
     try
        summa:= summa + StrToFloat(Trim(StringGrid1.Cells[i, 0]));
        inc(kol);
     except
       if CheckBox1.Checked then StringGrid1.Cells[i,0]:= ''
       else
         begin
         MessageDlg('Обнаружены ошибки в данных!', mtWarning, [mbOk, mbCancel], 0);
         kol:= 0;
         break;
         end;
     end;
  if kol<> 0 then Label3.Caption:= 'Среднее арифметическое:'+FloatToStr(summa/kol);
end;

procedure TForm1.Button4Click(Sender: TObject);
var i: integer;
begin
  Label3.Caption:= '';
  for i:= 0 to 4 do
     StringGrid1.Cells[i, 0]:='';
end;

procedure TForm1.Button5Click(Sender: TObject);
  var
  maximum: real;
  kol, i: integer;
  massiv: array [0..6] of real;
begin
  Label4.Caption:= '';
  kol:= 0;
  Label4.Caption:= '';
  for i:= 0 to 6 do
   if trim(StringGrid2.Cells[i, 0])<>'' then
     try
        massiv[kol]:= StrToFloat(Trim(StringGrid2.Cells[i, 0]));
        inc(kol);
     except
       if CheckBox2.Checked then StringGrid2.Cells[i,0]:=''
       else
         begin
         MessageDlg('Обнаружены ошибки в данных!', mtWarning, [mbOk, mbCancel], 0);
         kol:= 0;
         break;
         end;
     end;
  if kol<> 0 then
    begin
      maximum:=massiv[0];
      for i:= 0 to 6 do
       if massiv[i] > maximum then
         maximum:= massiv[i];
      Label4.Caption:= 'Максимальное значение:'+FloatToStr(maximum)+#13+'Индекс(ы) максмального(ых) элемента(ов):'+#13;
      for i:= 0 to 6 do
       if trim(StringGrid2.Cells[i, 0])<>'' then
         if StrToFloat(trim(StringGrid2.Cells[i,0]))= maximum then
           Label4.Caption:=Label4.Caption+IntToStr(i)+' ';

    end;
end;

procedure TForm1.Button6Click(Sender: TObject);
var
   i:integer;
begin
  Label4.Caption:= '';
  for i:= 0 to 6 do
    StringGrid2.Cells[i,0]:='';
end;

procedure TForm1.Button7Click(Sender: TObject);
var
  kol, i, j: integer;
  otrel: string;
begin
  kol:= 0;
  otrel:= '';
  for i:= 0 to 5 do
   for j:= 0 to 2 do
   if trim(StringGrid3.Cells[i, j])<>'' then
     try
        if StrToFloat(trim(StringGrid3.Cells[i,j]))< 0 then
          begin
             otrel:= otrel + Trim(StringGrid3.Cells[i, j])+', ';
             inc(kol);
          end;
     except
       if CheckBox3.Checked then StringGrid3.Cells[i,j]:=''
       else
         begin
         MessageDlg('Обнаружены ошибки в данных!', mtWarning, [mbOk, mbCancel], 0);
         kol:= 0;
         break;
         end;
     end;
  if kol<> 0 then
    begin
    delete(otrel, length(trim(otrel)), 1);
    otrel:= trim(otrel)+'.';
    ShowMessage('Список отрицательных элементов: '+otrel);
    end;
end;

procedure TForm1.Button8Click(Sender: TObject);
var i, j: integer;
begin
   for i:= 0 to 5 do
    for j:= 0 to 2 do
      StringGrid3.Cells[i, j]:='';
end;

procedure TForm1.Button9Click(Sender: TObject);
var
  kol, i, j: integer;
  otrel: string;
  err: boolean;
begin
  kol:= 0;
  otrel:= '';
  err:= false;
  for j:= 0 to 8 do
  begin
   for i:= 0 to 2 do
   if trim(StringGrid4.Cells[i, j])<>'' then
     try
        if StrToFloat(trim(StringGrid4.Cells[i,j]))<> 0 then inc(kol);
     except
       if CheckBox4.Checked then StringGrid4.Cells[i,j]:=''
       else
         begin
         MessageDlg('Обнаружены ошибки в данных в строке'+ IntToStr(j), mtWarning, [mbOk, mbCancel], 0);
         kol:= 0;
         err:= true;
         break;
         end;
     end;
    if err then break;
    if kol<> 0 then
     otrel:= otrel + 'Количество ненулевых элементов строки' + IntToStr(j) + ':' + IntToStr(kol) + #13;
     kol:= 0;
   end;
    if length(otrel)> 0 then
       ShowMessage('Список: '+ #13+ otrel)
    else
       ShowMessage('Отсутствуют ненулевые элементы в матрице');
end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin
   Form2.Show;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  i,j,kol: integer;
begin
  kol:= 0;
  for i:= 1 to 4 do
    for j:= 1 to 6 do
      if StringGrid5.Cells[i,j]<> '' then inc(kol);
  if kol= 0 then
    begin
       Button11.Enabled:= false;
       Button12.Enabled:= false;
       Button13.Enabled:= false;
       Button17.Enabled:= true;
       Button16.Enabled:= true;
    end
  else
    begin
       Button11.Enabled:= true;
       Button12.Enabled:= true;
       Button13.Enabled:= true;
       Button17.Enabled:= false;
       Button16.Enabled:= false;
    end;
end;

procedure TForm1.TimerZPTimer(Sender: TObject);
var
  i,j,kol: integer;
begin
  kol:= 0;
      if StringGrid8.Cells[0, 1]<> '' then inc(kol);
  if kol= 0 then
    begin
       Button18.Enabled:= false;
       Button19.Enabled:= false;
       Button20.Enabled:= true;
       Button23.Enabled:= true;
    end
  else
    begin
       Button18.Enabled:= true;
       Button19.Enabled:= true;
       Button20.Enabled:= false;
       Button23.Enabled:= false;
    end;
end;

end.

