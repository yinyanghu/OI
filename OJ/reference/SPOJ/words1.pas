//Written on 6189 -- Apr 6, 2005
program words1;
var
  deg:array['a'..'z']of longint;
  v:array['a'..'z']of boolean;
  root:array['a'..'z']of char;
  t,u,n,i:longint;
  c,d:char;
procedure pathcomp(x:char);
  var
    r,t:char;
  begin
    r:=x;while root[r]<>r do r:=root[r];
    while x<>r do begin t:=root[x];root[x]:=r;x:=t;end;
  end;
function ok:boolean;
  var
    b1,b2:boolean;
  begin
    ok:=false;
    b1:=false;
    for c:='a' to 'z' do
      if v[c] and (root[c]=c) then
        if b1 then exit else b1:=true;
    b1:=false;b2:=false;
    for c:='a' to 'z' do
      if deg[c]=1 then
        if b1 then exit else b1:=true
      else if deg[c]=-1 then
        if b2 then exit else b2:=true
      else if deg[c]<>0 then
        exit;
    ok:=true;
  end;
begin
  read(t);
  for u:=1 to t do begin
    fillchar(deg,sizeof(deg),0);
    fillchar(v,sizeof(v),0);
    for c:='a' to 'z' do
      root[c]:=c;

    readln(n);
    for i:=1 to n do begin
      read(c);v[c]:=true;
      if not eoln then begin
        inc(deg[c]);
        repeat read(d);until eoln;
        v[d]:=true;dec(deg[d]);
        pathcomp(c);pathcomp(d);root[root[c]]:=root[d];
      end;
      readln;
    end;

    if ok then
      writeln('Ordering is possible.')
    else
      writeln('The door cannot be opened.');
  end;
end.
