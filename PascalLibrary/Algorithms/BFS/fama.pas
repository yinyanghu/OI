program fama;
const maxn=100;
      maxm=1000;
var n,m:integer;
    w:array[1..maxn] of integer;
    dist:array[0..maxm] of integer;
    queue:array[1..maxm+1] of integer;
procedure init;
 var i:integer;
 begin
     assign(input,'fama.in'); reset(input);
     readln(n,m);
     for i:=1 to n do read(w[i]);
     close(input);
 end;

procedure try;
 var s,total,k,i:integer;
 begin
     s:=0; total:=1;
     fillchar(dist,sizeof(dist),-1);
     dist[0]:=0; queue[1]:=0;
     while s<total do begin
         inc(s);
         k:=queue[s];
         for i:=1 to n do
           if (k+w[i]<=m) and (dist[k+w[i]]=-1) then begin
               dist[k+w[i]]:=dist[k]+1;
               inc(total);
               queue[total]:=k+w[i];
           end;
     end;
     if (dist[m]=-1) then writeln('Impossible')
       else writeln(dist[m]);
 end;

begin
    init;
    try;
end.