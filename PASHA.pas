uses crt;
var
  t: text;
  s: real;
  i, n, max, d, z: integer;
  a: array [1..20] of integer;

procedure pod;
var b:array[1..20] of integer;
n,i,j,k:integer;
begin
clrscr;
writeln;
for i:=1 to 20 do
b[i]:=-1;
for i:=1 to 20 do
begin
k:=0;
for j:=1 to 20 do
if a[j]<a[i] then k:=k+1;
b[k+1]:=a[i];
end;
for i:=2 to 20 do
if b[i]=-1 then b[i]:=b[i-1];
writeln('Отсортированный методом аглоритма подсчета :');
for i:=1 to 20 do begin
write(b[i],' ');
end;
readkey;
clrscr;
end;

procedure sv;
var
  i: integer;
begin
  n := 20;
  while n > 1 do
  begin
    max := a[1];
    d := 1;
    for i := 2 to n do
      if a[i] > max then 
      begin
        max := a[i];
        d := i
      end;
    a[d] := a[n];
    a[n] := max;
    n := n - 1
  end;
end;

begin
  assign(t, 'E:\Дом раб 5\domrab.txt'); 
  reset(t);
  i := 1;
  while not eoln(t) do 
  begin
    Read(t, a[i]);
    i += 1;
  end;
  close(t);
  rewrite(t);
  repeat
    ClrScr;
    writeln('Выберите метод сортировки');
    writeln('Сортировка алгоритма подсчета - 1');
    writeln('Сортировка быстрого алгоритма - 2');
    writeln('выход - 0');
    Readln(z);
    case z of
      1: pod;
      2: sv;
    end;
  until z = 0;
  for i := 1 to 20 do
  begin
    write(t, a[i]);
    write(t, ' ');
  end;
  close(t);
end.
