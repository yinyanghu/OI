var
        anc             :       array[1..1000,0..2] of word;
        son             :       array[1..1000,0..1000] of word;
        ans             :       array[1..1000] of boolean;
        xxx             :       array[0..1000] of longint;
        n               :       longint;

procedure findancester(x:longint);
var
        i       :       longint;
begin
  ans[x]:=false;
  for i:=1 to anc[x,0] do
    findancester(anc[x,i]);
end;

procedure findson(x:longint);
var
        i       :       longint;
begin
  ans[x]:=false;
  for i:=1 to son[x,0] do
    findson(son[x,i]);
end;

var
        i,j,k             :       longint;
        s                 :       string;

begin
  fillchar(ans,sizeof(ans),true);
  readln(n);
  repeat
    readln(s);
    if s='BLOOD' then break;
    val(copy(s,1,pos(' ',s)-1),j);
    delete(s,1,pos(' ',s));
    while s[length(s)]=' ' do delete(s,length(s),1);
    val(s,k);
    inc(anc[j,0]);
    anc[j,anc[j,0]]:=k;
    inc(son[k,0]);
    son[k,son[k,0]]:=j;
  until false;

  repeat
    readln(k);
    findancester(k);
    findson(k);
  until seekeof;

  for i:=1 to n do
    if ans[i] then
      begin
        inc(xxx[0]);
        xxx[xxx[0]]:=i;
      end;
  if xxx[0]=0 then writeln(0) else
    for i:=1 to xxx[0] do
      if i<>xxx[0] then write(xxx[i],' ')
                   else writeln(xxx[i]);
end.
