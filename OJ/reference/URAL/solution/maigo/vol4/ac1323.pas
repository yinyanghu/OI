program ural1323;
const
  maxn=10;
  maxm=45;
  maxstatus=511;
type
  calllist=array[0..maxm]of integer;
var
  name:array[1..maxn]of string[20];
  v1,v2:array[1..maxm]of byte;
  dist:array[0..maxstatus]of byte;
  pre:array[0..maxstatus]of word;
  how:array[1..maxstatus]of calllist;
  call:calllist;
  know:array[0..maxn]of byte;
  n,m,i:byte;
  target,now:word;
  s1,s2:string;
procedure make(s:string;var v:byte);
  var
    i:byte;
  begin
    i:=0;
    repeat
      inc(i);
    until (name[i]=s) or (name[i]='');
    name[i]:=s;
    v:=i;
  end;
procedure exchange;
  var
    p,i:byte;
    s,t:string;
  begin
    readln(s);
    make(s,p);
    t:=name[1];name[1]:=name[p];name[p]:=t;
    for i:=1 to m do begin
      if v1[i]=p then v1[i]:=1 else if v1[i]=1 then v1[i]:=p;
      if v2[i]=p then v2[i]:=1 else if v2[i]=1 then v2[i]:=p;
    end;
  end;
procedure calknow(x:word);
  var
    i:byte;
  begin
    know[1]:=1;
    for i:=n downto 2 do begin
      know[i]:=x mod 2;
      x:=x shr 1;
    end;
  end;
procedure update;
  var
    i,status:word;
  begin
    status:=0;
    for i:=2 to n do
      status:=status shl 1+ord(know[i]>0);
    if dist[now]>=dist[status] then exit;
    dist[status]:=dist[now]+1;
    pre[status]:=now;
    how[status]:=call;
  end;
procedure search(l:byte);
  begin
    if l>m then
      update
    else begin
      search(l+1);
      if know[v1[l]]+know[v2[l]]=1 then begin
        inc(call[0]);
        if know[v1[l]]=1 then call[call[0]]:=l else call[call[0]]:=-l;
        know[v1[l]]:=2;know[v2[l]]:=2;
        search(l+1);
        if call[call[0]]>0 then begin
          know[v1[l]]:=1;know[v2[l]]:=0;
        end
        else begin
          know[v1[l]]:=0;know[v2[l]]:=1;
        end;
        dec(call[0]);
      end;
    end;
  end;
procedure back(x:word);
  var
    i:byte;
  begin
    if x=0 then exit;
    back(pre[x]);
    writeln(how[x][0]);
    for i:=1 to how[x][0] do
      if how[x][i]>0 then
        writeln(name[v1[how[x][i]]],' ',name[v2[how[x][i]]])
      else
        writeln(name[v2[-how[x][i]]],' ',name[v1[-how[x][i]]]);
  end;
begin
  readln(n,m);
  for i:=1 to m do begin
    readln(s2);
    s1:=copy(s2,1,pos(' ',s2)-1);
    delete(s2,1,pos(' ',s2));
    make(s1,v1[i]);
    make(s2,v2[i]);
  end;
  exchange;

  target:=power(2,n-1)-1;
  for now:=1 to target do
    dist[now]:=200;
  for now:=0 to target-1 do begin
    calknow(now);
    search(1);
  end;

  writeln(dist[target]);
  back(target);
end.
