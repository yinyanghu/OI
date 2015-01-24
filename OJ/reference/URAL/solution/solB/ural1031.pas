var
        f,d                      :       array[1..10000] of longint;
        start,goal,n             :       longint;
        l,c                      :       array[1..3] of longint;
procedure prepare;
var
        i       :       longint;
begin
  fillchar(d,sizeof(d),0);
  for i:=1 to 3 do read(l[i]);
  for i:=1 to 3 do read(c[i]);
  readln;
  readln(n);
  readln(start,goal);
  if start>goal then
    begin
      d[1]:=start;
      start:=goal;
      goal:=d[1];
    end;
  for i:=2 to n do readln(d[i]);
  d[1]:=0;
  fillchar(f,sizeof(f),127);
  f[start]:=0;
end;

procedure work;
var
        opt,dist,i,j     :       longint;
begin
  for i:=start to goal-1 do
    for j:=i+1 to goal do
      begin
        dist:=d[j]-d[i];
        if (dist>0) and
           (dist<=l[1])
          then opt:=c[1]
        else
        if dist<=l[2]
          then opt:=c[2]
        else
        if dist<=l[3]
          then opt:=c[3]
        else break;
        if f[i]+opt<f[j] then f[j]:=f[i]+opt;
      end;
  writeln(f[goal]);
end;

begin
  prepare;
  work;
end.