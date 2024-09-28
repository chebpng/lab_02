program sort;
var
  mass, massSort: array of integer;
  i, n, a, Sorted, SortType, temp: integer;
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
    Sorted := 0;
    while Sorted <> 1 do
    begin
      Sorted := 1; // Предполагаем, что массив отсортирован
      for i := 0 to n-2 do
      begin
        if mass[i] > mass[i+1] then
        begin
          a := mass[i];
          mass[i] := mass[i+1];
          mass[i+1] := a;
          Sorted := 0; // Массив не отсортирован, устанавливаем IsSort в 0
          break; // Прерываем цикл, так как нужно сделать еще один проход
        end;
       end;
      end;
    end;
//первый метод сортировки---------------------------------------   
 
//второй метод сортировки--------------------------------------- 

if SortType = 2 then
  begin

SetLength(massSort, n);
n := n - 1;

while Sorted <> 1 do
  begin
    Sorted := 1; 

    for i := 0 to n - 2 do 
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
//второй метод сортировки--------------------------------------- 


  //вывод итога сортировки
  writeln();
  writeln('------------------------------отсортированный массив---------------------------');
  writeln();
  for i := 0 to n-1 do
  begin
    write(mass[i], ' ');
  end; 
//1
end.