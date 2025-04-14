unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  ExtCtrls, Math, Types;

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
    Button2: TButton;
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
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    ListBox3: TListBox;
    ListBox4: TListBox;
    ListBox5: TListBox;
    ListBox6: TListBox;
    PageControl1: TPageControl;
    Panel1: TPanel;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure Edit2Change(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: char);
    procedure Edit3KeyPress(Sender: TObject; var Key: char);
    procedure Edit4Change(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: char);
    procedure Label8Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure TabSheet3ContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure TabSheet3Enter(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.PageControl1Change(Sender: TObject);
begin

end;

procedure TForm1.TabSheet3ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;

procedure TForm1.TabSheet3Enter(Sender: TObject);
begin

end;

procedure TForm1.TabSheet3Show(Sender: TObject);
begin
     ListBox3.Selected[0]:=false;
     ListBox4.Selected[0]:=false;
     ListBox5.Selected[0]:=false;
     ListBox6.Selected[0]:=false;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  funt: real; { вес в фунтах }
  kg: real; { вес в килограммах }
  k: real; { коэффициент пересчета }

begin
  Label4.Caption := '';
  Edit1.Text := Trim(Edit1.Text);
  if ListBox1.ItemIndex < 0 then
    MessageDlg('Страна не выбрана!!!', mtWarning, [mbOk, mbCancel], 0)
  else
  begin
    case ListBox1.ItemIndex of
      0: k := 0.4059; { Россия }
      1: k := 0.453592; { Англия }
      2: k := 0.56001; { Австрия }
      3..5, 7: k := 0.5; { Германия, Дания, Исландия, Нидерланды }
      6: k := 0.31762; { Италия }
    end;
    try
      funt := StrToFloat(Edit1.Text);
      if funt < 0 then
        MessageDlg('Данные некорректны!!!', mtWarning, [mbOk, mbCancel], 0)
      else
      begin
        kg := k * funt;
        if IsInfinite(kg) then
          MessageDlg('Введено слишком большое число!!!', mtWarning, [mbOk, mbCancel], 0)
        else
        begin
          Label4.Caption := Edit1.Text + ' фунт. - ' + FloatToStr(kg) + ' кг.';
        end;
      end;
    except
      MessageDlg('Вы не ввели фунты!!!', mtWarning, [mbOk, mbCancel], 0)
    end;
  end;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  Label16.Caption:='';
  Label18.Caption:='';
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  CheckBox2.Checked:=true;
  CheckBox3.Checked:=false;
end;

procedure TForm1.Button11Click(Sender: TObject);
var i: integer;
begin
  for i:=0 to 3 do // Кол-во эл-ов меню в каждом из ListBox
  ListBox4.Selected[i]:=true;
end;

procedure TForm1.Button12Click(Sender: TObject);
var i: integer;
begin
  for i:=0 to 3 do // Кол-во эл-ов меню в каждом из ListBox
  ListBox6.Selected[i]:=false;
end;

procedure TForm1.Button13Click(Sender: TObject);
var i: integer;
begin
  for i:=0 to 3 do // Кол-во эл-ов меню в каждом из ListBox
  ListBox3.Selected[i]:=true;
end;

procedure TForm1.Button14Click(Sender: TObject);
var i: integer;
begin
  for i:=0 to 3 do // Кол-во эл-ов меню в каждом из ListBox
  ListBox3.Selected[i]:=false;
end;

procedure TForm1.Button15Click(Sender: TObject);
var i: integer;
begin
  for i:=0 to 3 do // Кол-во эл-ов меню в каждом из ListBox
  ListBox5.Selected[i]:=true;
end;

procedure TForm1.Button16Click(Sender: TObject);
var i: integer;
begin
  for i:=0 to 3 do // Кол-во эл-ов меню в каждом из ListBox
  ListBox5.Selected[i]:=false;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ListBox2.Clear;
end;

procedure TForm1.Button3Click(Sender: TObject);
var sum: real;
begin
  sum:=0;
  label9.Caption:='';
  Button4.SetFocus;
  //Выбор холодных закусок
  if ListBox3.Selected[0] then sum:=sum+30;//Салат крабовый 30 руб
  if ListBox3.Selected[1] then sum:=sum+40;
  if ListBox3.Selected[2] then sum:=sum+50;
  if ListBox3.Selected[3] then sum:=sum+30;

  //Выбор горячих блюд
  if ListBox4.Selected[0] then sum:=sum+65;//Суп грибной
  if ListBox4.Selected[1] then sum:=sum+120;
  if ListBox4.Selected[2] then sum:=sum+70;
  if ListBox4.Selected[3] then sum:=sum+40; //Винегрет

  //Выбор напитков
  if ListBox5.Selected[0] then sum:=sum+20;//Чай
  if ListBox5.Selected[1] then sum:=sum+70;
  if ListBox5.Selected[2] then sum:=sum+30;
  if ListBox5.Selected[3] then sum:=sum+25;

  //Выбор десертов
  if ListBox6.Selected[0] then sum:=sum+90;//Мороженое
  if ListBox6.Selected[1] then sum:=sum+70;
  if ListBox6.Selected[2] then sum:=sum+120;
  if ListBox6.Selected[3] then sum:=sum+60;

  if sum<>0 then label9.Caption:='Общая стоимость заказа '+FloatToStr(sum)+'руб.';
end;

procedure TForm1.Button4Click(Sender: TObject);
var i: integer;
begin
   label9.Caption:='';
   for i:=0 to 3 do // Кол-во эл-ов меню в каждом из ListBox
   begin
     ListBox3.Selected[i]:=false;
     ListBox4.Selected[i]:=false;
     ListBox5.Selected[i]:=false;
     ListBox6.Selected[i]:=false;
   end;
end;

procedure TForm1.Button5Click(Sender: TObject);
var i: integer;
begin
  for i:=0 to 3 do // Кол-во эл-ов меню в каждом из ListBox
  ListBox6.Selected[i]:=true;
end;

procedure TForm1.Button6Click(Sender: TObject);
var i: integer;
begin
  for i:=0 to 3 do // Кол-во эл-ов меню в каждом из ListBox
  ListBox4.Selected[i]:=false;
end;

procedure TForm1.Button7Click(Sender: TObject);
var Summa: real;
begin
  Label12.Caption:='';
  if ComboBox1.ItemIndex<>ComboBox2.ItemIndex then
     begin
       Summa:=abs(ComboBox1.ItemIndex-ComboBox2.ItemIndex)*12.5;//12.50 стоимость 1 остановки
       if CheckBox1.Checked then Summa:=Summa*2;
       Label12.Caption:=FloatTostr(Summa)+'руб.';
     end
  else
  MessageDlg('Необходимо выбрать разные остановки!!!', mtWarning, [mbOk, mbCancel], 0)
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  ComboBox1.ItemIndex:=0;
  ComboBox2.ItemIndex:=0;
  Label12.Caption:='';
  CheckBox1.Checked:=false;
end;

procedure TForm1.Button9Click(Sender: TObject);
var SumV,SrokM,Proc,ItogSum: real;
begin
  Label16.Caption:='';
  Label18.Caption:='';
  if (trim(Edit2.Text)<>'') and (trim(Edit3.Text)<>'') and (trim(Edit4.Text)<>'') then
  try
    SumV:=StrToFloat(trim(Edit2.Text));
    SrokM:=StrToFloat(trim(Edit3.Text));
    Proc:=StrToFloat(trim(Edit4.Text));
    if (SumV<0) or (SrokM<0) or (Proc<0) then
      MessageDlg('Значения должны быть больше 0!!!', mtWarning, [mbOk, mbCancel], 0)
      else
      begin
        if CheckBox2.Checked then //Выбраны простые проценты
         begin
           ItogSum:=SumV*Proc*SrokM*30/365;
           if  not (IsInfinite(ItogSum)) then
           Label16.Caption:=FloatToStr(ItogSum)
           else
             MessageDlg('Введены слишком большие значения!!!', mtWarning, [mbOk, mbCancel], 0)
         end;
         if CheckBox3.Checked then //Выбраны сложные проценты
         begin
           ItogSum:=SumV*power((1+Proc/100),SrokM);
           if  not (IsInfinite(ItogSum)) then
           Label18.Caption:=FloatToStr(ItogSum)
           else
             MessageDlg('Введены слишком большие значения!!!', mtWarning, [mbOk, mbCancel], 0)
         end;
         if not (CheckBox2.Checked) and  not (CheckBox3.Checked) then
            MessageDlg('Необходимо выбрать вид процентов по вкладу!!!', mtWarning, [mbOk, mbCancel], 0)
      end;
  except
     MessageDlg('Данные введены не корректно!!!', mtWarning, [mbOk, mbCancel], 0)
  end
     else
     MessageDlg('Поля не заполнены!!!', mtWarning, [mbOk, mbCancel], 0)
end;

procedure TForm1.CheckBox1Change(Sender: TObject);
begin

end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin

end;


procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: char);
begin
  case Key of
'0'..'9': ;// цифра
#13: Button1.SetFocus;
',','.' :// точка или запятая
begin
if Key = '.' then Key := ','; // подменим точку запятой
// проверим, есть ли в поле Edit1 запятая
if Pos(',',Edit1.Text) <> 0 // запятая уже есть
then Key:=Char(0); // вторую запятую не отображать
end;
 #8 :; // <Backspace>
// остальные символы - запрещены
else Key :=Chr(0); // символ не отображать
end;

end;

procedure TForm1.Edit2Change(Sender: TObject);
begin

end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: char);
begin
  case Key of
'0'..'9': ;// цифра
#13: Edit3.SetFocus;
',','.' :// точка или запятая
begin
if Key = '.' then Key := ','; // подменим точку запятой
// проверим, есть ли в поле Edit1 запятая
if Pos(',',Edit1.Text) <> 0 // запятая уже есть
then Key:=Char(0); // вторую запятую не отображать
end;
 #8 :; // <Backspace>
// остальные символы - запрещены
else Key :=Chr(0); // символ не отображать
end;
end;

procedure TForm1.Edit3KeyPress(Sender: TObject; var Key: char);
begin
  case Key of
'0'..'9': ;// цифра
#13: Edit4.SetFocus;
',','.' :// точка или запятая
begin
if Key = '.' then Key := ','; // подменим точку запятой
// проверим, есть ли в поле Edit1 запятая
if Pos(',',Edit1.Text) <> 0 // запятая уже есть
then Key:=Char(0); // вторую запятую не отображать
end;
 #8 :; // <Backspace>
// остальные символы - запрещены
else Key :=Chr(0); // символ не отображать
end;
end;

procedure TForm1.Edit4Change(Sender: TObject);
begin

end;

procedure TForm1.Edit4KeyPress(Sender: TObject; var Key: char);
begin
  case Key of
'0'..'9': ;// цифра
#13: Button9.SetFocus;
',','.' :// точка или запятая
begin
if Key = '.' then Key := ','; // подменим точку запятой
// проверим, есть ли в поле Edit1 запятая
if Pos(',',Edit1.Text) <> 0 // запятая уже есть
then Key:=Char(0); // вторую запятую не отображать
end;
 #8 :; // <Backspace>
// остальные символы - запрещены
else Key :=Chr(0); // символ не отображать
end;
end;

procedure TForm1.Label8Click(Sender: TObject);
begin

end;

procedure TForm1.ListBox2Click(Sender: TObject);
var st: string;
begin
   st:=InputBox('Ввод данных', 'Ведите строку', '');
   if length(Trim(st))> 0 then
      ListBox2.Items.Add(st);
end;

procedure TForm1.ListBox3Click(Sender: TObject);
begin

end;

end.

