{
ID:lijianx1
PROG:sprime
LANG:PASCAL
}
program sprime;
const a:array[1..4] of longint=(1,3,7,9);
var n:longint;
function check(x:longint):boolean;
 var i:longint;
 begin
     for i:=2 to trunc(sqrt(x)) do
	if x mod i=0 then exit(false);
     check:=true;
 end;

procedure dfs(k,p:longint);
 var i,w:longint;
 begin
     for i:=1 to 4 do begin
	 w:=p*10+s[k];
	 if check(w) then
	     if k<n then dfs(k+1,w) else writeln(w);
     end;
 end;

begin
    assign(input,'sprime.in'); reset(input);
    assign(output,'sprime.out'); rewrite(output);
    readln(n);
    dfs(2,2);
    dfs(2,3);
    dfs(2,5);
    dfs(2,7);
    close(input);
    close(output);
end.