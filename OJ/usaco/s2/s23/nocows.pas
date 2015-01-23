{
ID:lijianx1
PROG:nocows
LANG:PASCAL
}
program nocows;
const maxn=200;
      maxk=100;
      prime=9901;
var f:array[1..maxn,1..maxk] of longint;
    n,m:longint;
procedure init;
 begin
     assign(input,'nocows.in'); reset(input);
     readln(n,m);
     close(input);
 end;

procedure main;
 var i,j,k:longint;
 begin
     fillchar(f,sizeof(f),0);
     for i:=1 to m do f[1,i]:=1;
     for i:=2 to n do
	for j:=1 to m do 
	   for k:=1 to i-2 do
		f[i,j]:=(f[i,j]+(f[k,j-1]*f[i-1-k,j-1]) mod prime) mod prime;
 end;

procedure print;
 var ans:longint;
 begin
     ans:=(f[n,m]-f[n,m-1]+prime) mod prime;
     assign(output,'nocows.out'); rewrite(output);
     writeln(ans);
     close(output);
 end;

begin
    init;
    main;
    print;
end.
