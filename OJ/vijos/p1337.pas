program p1337;
type node=record
	 x,y:longint;
	 s:array[1..5,1..5] of boolean;
     end;
var a:array[1..5] of node;
    s:array[1..10,1..10] of longint;
    i,j,k,m,n,total:longint;
    ch:char;
procedure print;
 var i,j:longint;
 begin
     for i:=1 to m do begin
	 for j:=1 to m do write(s[i,j]);
	 writeln;
     end;
     halt;
 end;

function check(x,y,w:longint):boolean;
 var i,j:longint;
 begin
     if a[w].x+x-1>m then exit(false);
     if a[w].y+y-1>m then exit(false);
     for i:=x to a[w].x+x-1 do
	for j:=y to a[w].y+y-1 do
	   if (a[w].s[i-x+1,j-y+1]) and (s[i,j]<>0) then exit(false);
     check:=true;
 end;

procedure fillmap(x,y,w:longint);
 var i,j:longint;
 begin
     for i:=x to (a[w].x+x-1) do
       for j:=1 to (a[w].y+y-1) do
          if a[w].s[i-x+1,j-y+1] then s[i,j]:=w;
 end;

procedure dfs(k:longint);
 var i,j:longint;
     temp:array[1..10,1..10] of longint;
 begin
     for i:=1 to m do
	for j:=1 to m do 
	   if check(i,j,k) then begin
	       temp:=s;
	       fillmap(i,j,k);
	       if (k<n) then dfs(k+1) else print;
	       s:=temp;
	   end;
 end;

begin
    readln(n); total:=0;
    for i:=1 to n do begin
	readln(a[i].x,a[i].y);
	for j:=1 to a[i].x do begin
	    for k:=1 to a[i].y do begin
	        read(ch);
	        if ch='1' then begin
		   a[i].s[j,k]:=true;
		   inc(total);
		end else a[i].s[j,k]:=false;
	    end;
	    readln;
	end;
    end;
    if trunc(sqrt(total))<>sqrt(total) then begin
	writeln('No solution possible');
	halt;
    end;
    if total=1 then begin
	writeln(1);
	halt;
    end;
    fillchar(s,sizeof(s),0);
    m:=trunc(sqrt(total));
    dfs(1);
    writeln('No solution possible');
end.