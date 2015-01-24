program ural1339;
const
  maxk=1000000;
var
  a,b:array[0..maxk]of longint;
  k,i,girl,t:longint;
begin
  read(k);
  for i:=1 to k do read(a[i]);
  for i:=1 to k do read(b[i]);
  for i:=1 to k do b[a[i]]:=-b[a[i]];

  for i:=1 to k do
    if b[i]>0 then begin
      girl:=i;b[i]:=-b[i];
      repeat
        t:=a[-b[girl]];
        a[-b[girl]]:=girl;
        girl:=t;
      until b[girl]=0;
    end;

  for i:=1 to k do
    b[a[i]]:=maxlongint;
  girl:=0;
  for i:=1 to k do begin
    if a[i]>0 then
      write(a[i])
    else begin
      repeat inc(girl);until b[girl]<maxlongint;
      write(girl);
    end;
    if i<k then write(' ') else writeln;
  end;
end.
