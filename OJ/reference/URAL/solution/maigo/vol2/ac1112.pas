program ural1112;
const
  maxn=99;
var
  a,b:array[0..maxn]of integer;
  len,next:array[0..maxn]of byte;
  n,i,j:byte;
  t:integer;
begin
  readln(n);
  for i:=1 to n do begin
    readln(a[i],b[i]);
    if a[i]>b[i] then begin
      t:=a[i];a[i]:=b[i];b[i]:=t;
    end;
  end;

  for i:=1 to n-1 do
    for j:=i+1 to n do
      if a[i]>a[j] then begin
        t:=a[i];a[i]:=a[j];a[j]:=t;
        t:=b[i];b[i]:=b[j];b[j]:=t;
      end;

  fillchar(len,sizeof(len),1);
  b[0]:=-999;
  for i:=n-1 downto 0 do
    for j:=i+1 to n do
      if b[i]<=a[j] then
        if len[j]+1>len[i] then begin
          len[i]:=len[j]+1;
          next[i]:=j;
        end;

  writeln(len[0]-1);
  j:=0;
  for i:=1 to len[0]-1 do begin
    j:=next[j];
    writeln(a[j],' ',b[j]);
  end;
end.
