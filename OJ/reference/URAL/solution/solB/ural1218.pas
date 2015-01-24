type
        tnode       =       record
        x           :       array[1..3] of longint;
        name        :       string;
        end;

var
        adj         :       array[1..500,1..500] of boolean;
        pep         :       array[1..500       ] of tnode;
        n,i,j,k,t   :       longint;
        s           :       string;

function pp:longint;
begin
  exit(pos(' ',s));
end;

procedure prepare;
begin
  readln(n);
  for i:=1 to n do
    with pep[i] do
      begin
        readln(s);
        pep[i].name:=copy(s,1,pp-1);
        delete(s,1,pp);
        val(copy(s,1,pp-1),x[1]);
        delete(s,1,pp);
        val(copy(s,1,pp-1),x[2]);
        delete(s,1,pp);
        while s[pp]=' ' do delete(s,pp,1);
        val(s,x[3]);
      end;
  for i:=1 to n do
    for j:=1 to n do
      begin
        t:=0;
        for k:=1 to 3 do
          inc(t,ord(pep[i].x[k]>=pep[j].x[k]));
          if t>1 then adj[i,j]:=true;
      end;
end;

procedure work;
begin
  for k:=1 to n do
    for i:=1 to n do
      for j:=1 to n do
        adj[i,j]:=adj[i,j] or (adj[i,k] and adj[k,j]);
end;

procedure print;
var
        p       :       boolean;
begin
  for i:=1 to n do
    begin
      p:=true;
      for j:=1 to n do
        if not adj[i,j] then
          p:=false;
      if p then writeln(pep[i].name);
    end;
end;

begin
  prepare;
  work;
  print;
end.





