var
        f       :       array[0..10] of qword;

function getcomm(a,b:longint):qword;
var
        i,j     :       longint;
        q       :       qword;
begin
  q:=1;
  for i:=2 to a do q:=q*i;
  for i:=2 to b do q:=q div i;
  for i:=2 to a-b do q:=q div i;
  getcomm:=q;
end;

var
        i,j,k,n   :       longint;
begin
  repeat
    read(n);
    if n=-1 then halt;
    fillchar(f,sizeof(f),0);
    f[0]:=1;
    for i:=1 to n do
      for j:=i downto 1 do
        inc(f[i],f[i-j]*getcomm(i,j));
    writeln(f[n]);
  until false;
end.
