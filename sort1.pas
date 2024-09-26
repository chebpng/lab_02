program sort;
var
  mass: array of integer;
  i, n, a, IsSort, SortType, STime, ETime: integer;
begin
  writeln('Выберите тип сортировки');
  writeln('1- Простейший алгоритм сортировки');
  readln(SortType);
  if (SortType < 1) or (SortType > 1) then
    begin
      writeln('Укажите верный тип сортировки');
      readln();
      exit;    
    end;
  writeln('Введите длинну массива');
  readln(n);

  if (n < 1) or (n > 1000000) then
  begin
    writeln('Длина массива должна быть в пределах 0 > x > 1000000.');
    readln();
    exit;
  end;

  SetLength(mass, n);

  randomize;
  for i := 0 to n-1 do
  begin
    if random(2) = 0 then
      mass[i] := Random(999)
    else
      mass[i] := -1*(Random(999))
  end;
  

  writeln('------------------------------неотсортированный массив---------------------------');
  writeln();
  for i := 0 to n-1 do
  begin
    write(mass[i], ' ');
  end;

//первый метод сортировки---------------------------------------
if SortType = 1 then
  begin  
    IsSort := 0;
    while IsSort <> 1 do
    begin
      IsSort := 1; // Предполагаем, что массив отсортирован
      for i := 0 to n-2 do
      begin
        if mass[i] > mass[i+1] then
        begin
          a := mass[i];
          mass[i] := mass[i+1];
          mass[i+1] := a;
          IsSort := 0; // Массив не отсортирован, устанавливаем IsSort в 0
          break; // Прерываем цикл, так как нужно сделать еще один проход
        end;
       end;
      end;
    end;
 //первый метод сортировки---------------------------------------   
 

    
//вывод итога сортировки
  writeln();
  writeln('------------------------------отсортированный массив---------------------------');
  writeln();
  for i := 0 to n-1 do
  begin
    write(mass[i], ' ');
  end;
end.