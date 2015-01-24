program ural1067;
const
  maxn=500;
  maxd=40;
var
  path:array[0..maxn,0..maxd]of string[8];
  order:array[0..maxn]of word;
  n,i,d,x:longint;
  c:char;
  flag:boolean;
function bigger(a,b:word):boolean;
  var
    i:byte;
  begin
    i:=0;while path[a,i]=path[b,i] do inc(i);
    bigger:=path[a,i]>path[b,i];
  end;
procedure qsort(s,t:word);
  var
    p,i,j,tmp:word;
  begin
    if s>=t then exit;
    p:=s+random(t-s+1);
    tmp:=order[p];order[p]:=order[s];
    i:=s;j:=t;
    repeat
      while (i<j) and bigger(order[j],tmp) do dec(j);
      if i=j then break;order[i]:=order[j];inc(i);
      while (i<j) and bigger(tmp,order[i]) do inc(i);
      if i=j then break;order[j]:=order[i];dec(j);
    until i=j;
    order[i]:=tmp;
    qsort(s,i-1);
    qsort(i+1,t);
  end;
begin
  readln(n);
  for i:=1 to n do begin
    order[i]:=i;d:=0;
    repeat
      read(c);
      if c='\' then inc(d) else path[i,d]:=path[i,d]+c;
    until eoln;
    readln;
  end;
  qsort(1,n);

  for i:=1 to n do begin
    d:=0;flag:=false;
    repeat
      if path[order[i],d]>path[order[i-1],d] then flag:=true;
      if flag then begin
        for x:=1 to d do write(' ');
        writeln(path[order[i],d]);
      end;
      inc(d);
    until path[order[i],d]='';
  end;
end.
