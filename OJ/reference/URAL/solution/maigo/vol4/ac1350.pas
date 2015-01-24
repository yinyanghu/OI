program ural1350;
const
  maxn=100;
  maxk=100;
var
  food:array[1..maxn]of string[40];
  possi:array[1..maxn]of boolean;
  danger:array[1..maxk]of byte;
  n,k,i,j,p,c0,c,l,r,m:longint;
  s:string[40];
function id:byte;
  begin
    readln(s);
    l:=1;r:=n;
    repeat
      m:=(l+r) shr 1;
      if food[m]=s then break;
      if food[m]<s then l:=m+1 else r:=m-1;
    until false;
    id:=m;
  end;
begin
  readln(n);
  for i:=1 to n do readln(food[i]);
  fillchar(possi,sizeof(possi),1);
  for i:=1 to n-1 do begin
    p:=i;for j:=i+1 to n do if food[j]<food[p] then p:=j;
    if p>i then begin s:=food[i];food[i]:=food[p];food[p]:=s;end;
  end;

  readln(k,c0);
  for i:=1 to c0 do possi[id]:=false;

  for i:=1 to k do begin
    readln(c);
    for j:=1 to c do if possi[id] then inc(danger[i]);
  end;

  dec(n,c0);readln(c);
  for i:=1 to k do
    if danger[i]=0 then
      writeln('YES')
    else if n-danger[i]<c then
      writeln('NO')
    else
      writeln('MAYBE');
end.
