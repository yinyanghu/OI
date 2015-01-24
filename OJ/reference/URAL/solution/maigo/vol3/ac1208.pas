program ural1208;
const
  maxk=18;
var
  name:array[1..maxk,1..3]of string[20];
  ok:array[1..maxk,1..maxk]of boolean;
  chosen:array[1..maxk]of byte;
  k,i,j,now,max:byte;
  s:string;
procedure calok(x,y:byte);
  var
    m,n:byte;
  begin
    for m:=1 to 3 do
      for n:=1 to 3 do
        if name[x,m]=name[y,n] then begin
          ok[x,y]:=false;
          exit;
        end;
    ok[x,y]:=true;
  end;
procedure search(l:byte);
  var
    choose:boolean;
    i:byte;
  begin
    if l>k then begin
      if now>max then max:=now;
      exit;
    end;
    if now+k-l+1<=max then exit;
    choose:=true;
    for i:=1 to now do
      if not ok[chosen[i],l] then begin
        choose:=false;
        break;
      end;
    if choose then begin
      inc(now);
      chosen[now]:=l;
      search(l+1);
      dec(now);
    end;
    search(l+1);
  end;
begin
  readln(k);
  for i:=1 to k do begin
    readln(s);
    name[i,1]:=copy(s,1,pos(' ',s)-1);
    delete(s,1,pos(' ',s));
    name[i,2]:=copy(s,1,pos(' ',s)-1);
    delete(s,1,pos(' ',s));
    name[i,3]:=s;
  end;

  fillchar(ok,sizeof(ok),1);
  for i:=1 to k-1 do
    for j:=i+1 to k do
      calok(i,j);

  search(1);

  writeln(max);
end.
