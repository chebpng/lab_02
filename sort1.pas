program sort;
var
  mass, massSort: array of integer;
  i, ii, n, a, IsSort, SortType, max, maxI: integer;
begin
  writeln('Выберите тип сортировки');
  writeln('1- Простейший алгоритм сортировки');
  writeln('2- Алгоритм обменной сортировки');  
  readln(SortType);
  if (SortType < 1) or (SortType > 2) then
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
      
      //вывод итога сортировки
  writeln();
  writeln('------------------------------отсортированный массив---------------------------');
  writeln();
  for i := 0 to n-1 do
  begin
    write(mass[i], ' ');
  end;
      
    end;
//первый метод сортировки---------------------------------------   
 
//второй метод сортировки--------------------------------------- 

if SortType = 2 then
  begin
    //I.5. Идея алгоритма упорядочения выбором
//Основа – поиск максимального значения в массиве. Элемент с максимальным значением меняется местами с последним элементом массива. 
//Затем поиск максимума проводится среди первых (n-1) элементов. Найденный элемент меняется местами с предпоследним, и т.д., 
//пока область поиска максимума не сократится до одного элемента.
SetLength(massSort, n);

for ii := 0 to n-1 do
begin
  max := -1000; 
  maxI := 0; 
  for i := 1 to n-1 do
  begin
    if max < mass[i] then
    begin
      max := mass[i];
      maxI := i;
    end;
  end;
  massSort[ii] := max;
  mass[maxI] := mass[ii]; 
  mass[maxI] := -1000; // Удаляем максимальный элемент из mass
end;

//вывод итога сортировки
  writeln();
  writeln('------------------------------отсортированный массив---------------------------');
  writeln();
  for i := 0 to n-1 do
  begin
    write(massSort[i], ' ');
  end;

  end;
//второй метод сортировки--------------------------------------- 
    

end.