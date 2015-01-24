for k:=1 to n do begin
	for i:=1 to k - 1 do
		for j:=i + 1 to k - 1 do
			ans:=min(ans,f[i,j] + g[i,k] + g[k,j]);
	for i:=1 to n do
		for j:=1 to n do
			f[i,j]:=min(f[i,j],f[i,k] + f[k,j]);
end;
{program floyed;
const maxn=1000;
var a:array[1..maxn,1..maxn] of longint;
    p:array[1..maxn,1..maxn] of integer;
    n,x,y,min:longint;
    c:array[1..3] of longint;
procedure init;
 var i,j:integer;
 begin
     assign(input,'floyd.in'); reset(input);
     readln(n);
     fillchar(p,sizeof(p),0);
     for i:=1 to maxn do
       for j:=1 to maxn do a[i,j]:=maxlongint;
     fillchar(c,sizeof(c),0);
     for i:=1 to n do
       for j:=1 to n do begin
           read(a[i,j]);
           p[i,j]:=i;
       end;
     readln(x,y);
     close(input);
 end;

procedure main;
 var i,j,k:integer;
 begin
     min:=maxlongint;
     for k:=1 to n do begin
         for i:=1 to k-1 do
           for j:=i+1 to k-1 do
               if a[i,j]+a[i,k]+a[k,j]<min then begin
                   min:=a[i,j]+a[i,k]+a[k,j];
                   c[1]:=i; c[2]:=j; c[3]:=k;
               end;
         for i:=1 to n do
           for j:=1 to n do
             if a[i,k]+a[k,j]<a[i,j] then begin
                 a[i,j]:=a[i,k]+a[k,j];
                 p[i,j]:=p[k,j];
             end;
     end;
 end;

procedure print;
 var k,len,i:integer;
     path:array[1..maxn] of integer;
 begin
     assign(output,'floyd.out'); rewrite(output);
     if a[x,y]>=maxlongint then writeln('No solution')
       else begin
           writeln('From ',x,' To ',y,':');
           len:=0;
           k:=y;
           while k<>x do begin
               inc(len);
               path[len]:=k;
               k:=p[x,k];
           end;
           writeln('Length=',a[x,y]);
           write(x);
           for i:=len downto 1 do write('--->',path[i]);
           writeln;
       end;
     writeln('Min Circle=',min);
     write(c[1]);
     for i:=2 to 3 do write('--->',c[i]);
     close(output);
 end;

begin
    init;
    main;
    print;
end.}