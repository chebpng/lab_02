{$codepage UTF8}
program sort;
uses SysUtils, DateUtils;
var
  StartTime, EndTime: TDateTime;
  mass, massSort: array of integer;
  i, n, a, Sorted, SortType, temp: integer;

function Test(var Mass : array of Integer; n : Integer) : Boolean;
begin
  // проверка упорядоченности по возрастанию
  i := 0;
  while (i < n-1) and (Mass[i] <= Mass[i+1]) do
    i := i+1;
  if i < n-1 then Test := False
  else Test := True;
end;

// Функция для слияния двух частей массива
procedure Merge(var arr: array of integer; left, mid, right: integer);
var
  i, j, k, n1, n2: integer;
  L, R: array of integer;
begin
  n1 := mid - left + 1;
  n2 := right - mid;

  SetLength(L, n1);
  SetLength(R, n2);

  for i := 0 to n1 - 1 do
    L[i] := arr[left + i];
  for j := 0 to n2 - 1 do
    R[j] := arr[mid + 1 + j];

  i := 0;
  j := 0;
  k := left;
  while (i < n1) and (j < n2) do
  begin
    if L[i] <= R[j] then
    begin
      arr[k] := L[i];
      Inc(i);
    end
    else
    begin
      arr[k] := R[j];
      Inc(j);
    end;
    Inc(k);
  end;

  while i < n1 do
  begin
    arr[k] := L[i];
    Inc(i);
    Inc(k);
  end;

  while j < n2 do
  begin
    arr[k] := R[j];
    Inc(j);
    Inc(k);
  end;
end;

// Функция сортировки слиянием
procedure MergeSort(var arr: array of integer; left, right: integer);
var
  mid: integer;
begin
  if left < right then
  begin
    mid := left + (right - left) div 2;

    MergeSort(arr, left, mid);
    MergeSort(arr, mid + 1, right);

    Merge(arr, left, mid, right);
  end;
end;

begin
  writeln('Выберите тип сортировки');
  writeln('1- Простейший алгоритм сортировки');
  writeln('2- Алгоритм обменной сортировки');
  writeln('3- Сортировка слиянием');
  readln(SortType);

  if (SortType < 1) or (SortType > 3) then
    begin
      writeln('Укажите верный тип сортировки');
      readln();
      exit;
    end;

  writeln('Введите длину массива');
  readln(n);

  if (n < 1) or (n > 1000000) then
  begin
    writeln('Длина массива должна быть в пределах 0 > x > 1000000.');
    readln();
    exit;
  end;
  StartTime := Now;
  SetLength(mass, n);
  randomize;

  for i := 0 to n-1 do
  begin
    if random(2) = 0 then
      mass[i] := Random(999)
    else
      mass[i] := -1*(Random(999));
  end;

  writeln('------------------------------ неотсортированный массив ---------------------------');
  for i := 0 to n-1 do
    write(mass[i], ' ');

  // Первый метод сортировки (простейший алгоритм)
  if SortType = 1 then
  begin
    Sorted := 0;
    while Sorted <> 1 do
    begin
      Sorted := 1;
      for i := 0 to n-2 do
      begin
        if mass[i] > mass[i+1] then
        begin
          a := mass[i];
          mass[i] := mass[i+1];
          mass[i+1] := a;
          Sorted := 0;
          break;
        end;
      end;
    end;
  end;

  // Второй метод сортировки (обменная сортировка)
  if SortType = 2 then
  begin
    SetLength(massSort, n);
    n := n - 1;
    while Sorted <> 1 do
    begin
      Sorted := 1;
      for i := 0 to n - 1 do
      begin
        if mass[i] > mass[i+1] then
        begin
          Sorted := 0;
          temp := mass[i];
          mass[i] := mass[i+1];
          mass[i+1] := temp;
        end;
      end;
    end;
  end;

  // Третий метод сортировки (сортировка слиянием)
  if SortType = 3 then
  begin
    MergeSort(mass, 0, High(mass));
  end;

  writeln();
  writeln('------------------------------ отсортированный массив ---------------------------');
  for i := 0 to n-1 do
    write(mass[i], ' ');

  if Test(mass, n) then
  begin
    writeln();
    writeln('Массив отсортирован');
    EndTime := Now;
    WriteLn('Время выполнения: ', FormatDateTime('hh:nn:ss.zzz', EndTime - StartTime));
    readln();
    exit;
  end
  else
  begin
    writeln();
    writeln('Массив не отсортирован');
    EndTime := Now;
    WriteLn('Время выполнения: ', FormatDateTime('hh:nn:ss.zzz', EndTime - StartTime));
    readln();
    exit;
  end;
end.

