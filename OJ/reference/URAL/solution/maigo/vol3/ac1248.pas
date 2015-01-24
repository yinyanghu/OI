program ural1248;
var
  d:array[-119..103]of word;
  n,i,j,k:integer;
  s:string;
begin
  readln(n);
  for i:=1 to n do begin
    readln(s);
    j:=pos('e',s);
    val(copy(s,j+1,length(s)-j),k,j);inc(k);
    s:=copy(s,1,pos('e',s)-1);
    if pos('.',s)>0 then delete(s,pos('.',s),1);
    for j:=1 to length(s) do
      inc(d[k-j],ord(s[j])-48);
  end;

  for i:=-119 to 102 do begin
    inc(d[i+1],d[i] div 10);
    d[i]:=d[i] mod 10;
  end;

  k:=103;while d[k]=0 do dec(k);
  if d[k-19]>4 then begin
    j:=k-18;inc(d[j]);
    while d[j]>9 do begin
      dec(d[j],10);inc(j);inc(d[j]);
    end;
    if j>k then k:=j;
  end;
  write(d[k],'.');
  for i:=1 to 18 do
    write(d[k-i]);
  writeln('e',k);
end.
