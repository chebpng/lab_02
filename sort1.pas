program sort;
var
	mass: array[1..100] of integer;
	a, i, n: integer;
begin
	readln(n);
	
	if (n < 1) or (n > 100) then
	begin
		writeln('Длина массива должна быть в пределах 0 > x > 100.');
		readln();
		exit;
	end;
	
	randomize;
	for i := 1 to n do
	begin
		mass[i] := Random(2147483646);
	end;
	
	writeln();
	for i := 1 to n do
	begin
		write(mass[i], ' ');
	end;
end.
