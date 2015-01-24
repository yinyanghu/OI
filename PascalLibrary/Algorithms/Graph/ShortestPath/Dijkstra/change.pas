program change;
const n=26;
var g:array[1..n,1..n] of integer;
    dist:array[1..n] of integer;
    vis:array[1..n] of boolean;
    s,t:integer;
procedure init;
 var p,q,i,j:integer;
     a,b,ch:char;
 begin
     for i:=1 to n do
       for j:=1 to n do
         g[i,j]:=100;
     assign(input,'change.in'); reset(input);
     readln(a,ch,b);
     s:=ord(a)-64; t:=ord(b)-64;
     while not eof do begin
         readln(a,ch,b);
         p:=ord(a)-64; q:=ord(b)-64;
         g[p,q]:=1;
     end;
     close(input);
 end;

procedure main;
 var min,i,k:integer;
 begin
     for i:=1 to n do dist[i]:=maxint;
     dist[s]:=0;
     fillchar(vis,sizeof(vis),false);
     repeat
          min:=maxint;
          k:=0;
          for i:=1 to n do
            if not vis[i] and (dist[i]<min) then begin
                min:=dist[i];
                k:=i;
            end;
            if k=0 then break;
            vis[k]:=true;
            for i:=1 to n do
              if (min+g[k,i]<dist[i]) then dist[i]:=min+g[k,i];
     until false;
 end;

procedure print;
 begin
     assign(output,'change.out'); rewrite(output);
     writeln(dist[t]);
     close(output);
 end;

begin
    init;
    main;
    print;
end.