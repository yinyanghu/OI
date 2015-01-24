program schoolnet;
const maxn=1000;
var n:integer;
    x,y,dist:array[1..maxn] of double;
    vis:array[1..maxn] of boolean;
    ans:double;

procedure init;
 var i:integer;
 begin
     assign(input,'schoolnet.in'); reset(input);
     readln(n);
     for i:=1 to n do readln(x[i],y[i]);
     close(input);
 end;

function getdist(a,b:integer):double;
 begin
     getdist:=sqrt(sqr(x[a]-x[b])+sqr(y[a]-y[b]));
 end;

procedure main;
 var i,k:integer;
     min,p:double;
 begin
     ans:=0;
     for i:=1 to n do begin
         dist[i]:=1e99;
         vis[i]:=false;
     end;
     dist[1]:=0;
     repeat
        min:=1e100;
        for i:=1 to n do
          if (not vis[i]) and (dist[i]<min) then begin
              min:=dist[i];
              k:=i;
          end;
          if min>1e99 then break;
          ans:=ans+min;
          vis[k]:=true;
          for i:=1 to n do begin
              p:=getdist(k,i);
              if (not vis[i]) and (p<dist[i]) then
                 dist[i]:=p;
          end;
     until false;
 end;
procedure print;
 begin
     assign(output,'schoolnet.out'); rewrite(output);
     writeln(ans:0:2);
     close(output);
 end;

begin
    init;
    main;
    print;
end.
