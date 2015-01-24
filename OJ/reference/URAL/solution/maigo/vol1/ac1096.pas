program ural1096;
const
  maxk=1000;
  inf=65535;
var
  plate:array[1..maxk,1..2]of word;
  dist,path:array[1..maxk]of word;
  k,r,a,b,i,t:word;
  fail:boolean;
procedure succeed;
  begin
    a:=plate[i,1];
    writeln(dist[a]);
    repeat
      writeln(path[a]);
      a:=plate[path[a],2];
    until a=r;
    halt;
  end;
begin
  fillchar(dist,sizeof(dist),255);
  readln(k);
  for i:=1 to k do
    readln(plate[i,1],plate[i,2]);
  readln(r,a,b);

  dist[r]:=0;
  repeat
    fail:=true;
    for i:=1 to k do
      if (dist[plate[i,2]]<inf) and (dist[plate[i,1]]=inf) then begin
        dist[plate[i,1]]:=dist[plate[i,2]]+1;
        path[plate[i,1]]:=i;
        if (plate[i,1]=a) or (plate[i,1]=b) then succeed;
        fail:=false;
      end;
  until fail;
  writeln('IMPOSSIBLE');
end.
