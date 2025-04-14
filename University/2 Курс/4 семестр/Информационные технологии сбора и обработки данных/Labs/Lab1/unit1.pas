unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls, math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure Edit2Change(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: char);
    procedure Edit3Change(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: char);
    procedure Edit4KeyPress(Sender: TObject; var Key: char);
    procedure PageControl1Change(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  dist :real; // дистанция, метров
  t: real; // время
  v: real; // скорость
  formatSettings: TFormatSettings;
begin
  formatSettings.DecimalSeparator := ',';
  Label4.Caption := '';
  // получить исходные данные из полей ввода
  try
    dist := StrToFloat(Edit1.Text);
  except
    MessageDlg('Вы ничего не ввели', mtError, [mbOk], 0);
    Exit;
  end;

  if dist <= 0 then
  begin
    MessageDlg('Некорректное значение: Дистанция должна быть положительной', mtError, [mbOk], 0);
    Exit;
  end;

  try
    t := StrToFloat(Edit2.Text, formatSettings);
  except
    MessageDlg('Некорректное значение в поле Время', mtError, [mbOk], 0);
    Exit;
  end;

  if t <= 0 then
  begin
    MessageDlg('Некорректное значение: Время должно быть положительным', mtError, [mbOk], 0);
    Exit;
  end;

  try
    // вычисление  999e-308
    v := dist/t;
  except
    MessageDlg('Слишком большой результат', mtError, [mbOk], 0);
    Exit;
  end;

  // вывод результата
  Label4.Caption := 'Дистанция: '+ Edit1.Text + ' м' + #13 + 'Время: ' +
  FloatToStr(t) + ' сек ' + #13 + 'Скорость: ' + FloatToStrF(v,ffFixed,4,2) + ' м/с';

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.Button3Click(Sender: TObject);
const
  LineBreak = AnsiString(#13#10);
var
  inputString: String;
  inputReal: Real;
  inputInt64: Int64;
  formatSettings: TFormatSettings;
  result: String;
begin
  formatSettings.DecimalSeparator := ',';

  inputString := InputBox('Проверка числа', 'Введите число: ', '');

  if inputString = '' then Exit;

  try
    inputReal := StrToFloat(inputString, formatSettings);
  except
    ShowMessage('Некорректное значение, введите число');
    Exit;
  end;

  result := '';
  if inputReal > 0 then result += 'Положительное' + LineBreak;
  if (Abs(inputReal) <= 4e18) and (Trunc(inputReal) = inputReal) then begin
    inputInt64 := Trunc(inputReal);
    if inputInt64 mod 2 = 0 then result += 'Чётное' + LineBreak;
    if inputInt64 mod 3 = 0 then result += 'Кратно трём' + LineBreak;
  end;
  result := TrimRight(result);
  if result <> '' then ShowMessage(result);
end;

procedure TForm1.Button4Click(Sender: TObject);
const
  pricePerMinute: real = 2;
  discountPercentage: real = 25;
var
  resultMsg: String;
  result: real;
  duration: real;
  dayOfWeek: integer;
  formatSettings: TFormatSettings;
begin
  formatSettings.DecimalSeparator := ',';
  // получить исходные данные из полей ввода
  try
    duration := StrToFloat(Edit3.Text, formatSettings);
  except
    MessageDlg('Некорректное значение в поле Длительность', mtError, [mbOk], 0);
    Exit;
  end;
  // получить исходные данные из полей ввода
  try
    dayOfWeek := StrToInt(Edit4.Text);
  except
    MessageDlg('Некорректное значение в поле День недели', mtError, [mbOk], 0);
    Exit;
  end;
  if duration < 0 then begin
    MessageDlg('Некорректное значение в поле Длительность', mtError, [mbOk], 0);
    Exit;
  end;
  if (dayOfWeek <= 0) or (dayOfWeek > 7) then
  begin
    MessageDlg('Некорректное значение в поле День недели', mtError, [mbOk], 0);
    Exit;
  end;

  result := duration / 60 * pricePerMinute;
  if IsInfinite(result) then
  begin
    MessageDlg('Слишком большое число', mtError, [mbOk], 0);
    Exit;
  end;
  if (dayOfWeek >= 6) and (dayOfWeek <= 7) then
    result := result * (100 - discountPercentage) / 100;
  resultMsg := 'Стоимость телефонного разговора: ' + FloatToStr(result);
  ShowMessage(resultMsg);
end;

// нажатие клавиши в поле Дистанция
procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: char);
begin
 // Key - символ, соответствующий нажатой клавише.
 // Если символ недопустимый, то процедура заменяет его
 // на символ с кодом 0. В результате этого символ в поле
 // редактирования не появляется и у пользователя создается
 // впечатление, что программа не реагирует на нажатие некоторых
// клавиш.
case Key of
 '0'..'9': ;// цифра
 #8 : ; // <Backspace>
 #13 : Edit2.SetFocus ; // <Enter>
 // остальные символы - запрещены
 else Key :=Chr(0); // символ не отображать
 end;
end;

procedure TForm1.Edit2Change(Sender: TObject);
begin

end;

// нажатие клавиши в поле Время
procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
case Key of
'0'..'9': ;// цифра
',','.' :// точка или запятая
begin
if Key = '.' then Key := ','; // подменим точку запятой
// проверим, есть ли в поле Edit2 запятая
if Pos(',',Edit2.Text) <> 0 // запятая уже есть
then Key:=Char(0); // вторую запятую не отображать
end;
 #8 :; // <Backspace>
 #13 : Button1.SetFocus ;
// остальные символы - запрещены
else Key :=Chr(0); // символ не отображать
end;
end;

procedure TForm1.Edit3Change(Sender: TObject);
begin

end;

procedure TForm1.Edit3KeyPress(Sender: TObject; var Key: char);
begin
case Key of
'0'..'9': ;// цифра
',','.' :// точка или запятая
begin
if Key = '.' then Key := ','; // подменим точку запятой
// проверим, есть ли в поле Edit2 запятая
if Pos(',',Edit3.Text) <> 0 // запятая уже есть
then Key:=Char(0); // вторую запятую не отображать
end;
 #8 :; // <Backspace>
 #13 : Edit4.SetFocus;
// остальные символы - запрещены
else Key :=Chr(0); // символ не отображать
end;
end;

procedure TForm1.Edit4KeyPress(Sender: TObject; var Key: char);
begin
// Key - символ, соответствующий нажатой клавише.
// Если символ недопустимый, то процедура заменяет его
// на символ с кодом 0. В результате этого символ в поле
// редактирования не появляется и у пользователя создается
// впечатление, что программа не реагирует на нажатие некоторых
// клавиш.
case Key of
#8 : ; // <Backspace>
#13 : Button4.SetFocus ; // <Enter>
'1'..'7': if Length(Edit4.Text) <> 0 then
begin
  Key:=Char(0);
  Exit;
end;// цифра
// остальные символы - запрещены
else Key :=Chr(0); // символ не отображать
end;
end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin

end;

procedure TForm1.TabControl1Change(Sender: TObject);
begin

end;




end.

