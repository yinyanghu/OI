program ural1210;
const
  maxk=30;
var
  min:array[boolean,1..maxk]of longint;
  n,k,i,j,s:byte;
  c:longint;
begin
  read(n);
  for i:=1 to n do begin
    read(k);
    for j:=1 to k do begin
      min[odd(i),j]:=maxlongint;
      repeat
        read(s);
        if s=0 then break;
        read(c);
        if min[not odd(i),s]+c<min[odd(i),j] then min[odd(i),j]:=min[not odd(i),s]+c;
      until false;
      readln;
    end;
    if i<n then readln;
  end;
  c:=maxlongint;
  for i:=1 to k do
    if min[odd(n),i]<c then c:=min[odd(n),i];
  writeln(c);
end.
