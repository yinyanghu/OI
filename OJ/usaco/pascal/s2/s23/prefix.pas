{
ID:lijianx1
PROG:prefix
LANG:PASCAL
}
program prefix;
const maxn=200000;
      prime=9991;
var f:array[1..maxn+1] of longint;
    w:array[1..10] of longint;
    flag:array[0..prime-1] of boolean;
    n,maxl:longint;
    s:array[1..maxn] of char;
procedure init;
 var i,k:longint;
     t:string;
     ch:char;	
 begin
     w[1]:=1; maxl:=-1;
     for i:=2 to 10 do w[i]:=w[i-1]*27 mod prime;
     fillchar(flag,sizeof(flag),false);
     assign(input,'prefix.in'); reset(input);
     t:='';
     while true do begin
	 read(ch);
	 if ch='.' then begin
	     readln; break;
	 end;
	 if (ch=' ') or eoln then begin
	     if eoln then t:=t+ch;
	     k:=0;
	     if length(t)>maxl then maxl:=length(t);
	     for i:=1 to length(t) do
		k:=(k+(ord(t[i])-64)*w[i]) mod prime;
	        flag[k]:=true;
	     t:='';
	     if eoln then readln;
	 end else t:=t+ch;
     end;
     n:=0;
     while true do begin
	 inc(n);
	 read(s[n]);
	 if eoln then readln;
	 if eof then break;
     end;
     close(input);
 end;

procedure main;
 var i,j,k,p:longint;
 begin
     f[n+1]:=n;
     for i:=n downto 1 do begin
	 f[i]:=i-1;
	 if i+maxl-1>n then k:=n else k:=i+maxl-1;
	 p:=0;
	 for j:=i to k do begin
	     p:=(p+(ord(s[j])-64)*w[j-i+1]) mod prime;
	     if flag[p] then
		if f[j+1]>f[i] then f[i]:=f[j+1];
	 end;
     end;
 end;

procedure print;
 begin
     assign(output,'prefix.out'); rewrite(output);
     writeln(f[1]);
     close(output);
 end;

begin
    init;
    main;
    print;
end.
