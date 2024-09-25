program sort;
var
	mass: array of integer;
	i, n: integer;
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
		mass[i] := Random(2147483646);
	end;
	
	writeln();
	for i := 0 to n-1 do
	begin
		write(mass[i], ' ');
	end;
end.
