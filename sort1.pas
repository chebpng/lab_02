program sort;
var
  mass: array of integer;
  i, n, a, IsSort: integer;
begin
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

  writeln();
  writeln('------------------------------отсортированный массив---------------------------');
  writeln();
  for i := 0 to n-1 do
  begin
    write(mass[i], ' ');
  end;

  readln();
end.