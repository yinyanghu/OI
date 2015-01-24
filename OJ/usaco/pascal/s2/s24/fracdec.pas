{
ID:lijianx1
PROG:fracdec
LANG:PASCAL
}
program fracdec;
const
	maxn = 100000;
var
	flag:array[0..maxn] of longint;
	a:array[1..maxn] of longint;
	s:string;
	n,d,k,cur,i:longint;
	
procedure print(ch:char);
 begin
 	s:=s + ch;
 	if (length(s) = 76) then begin
 		writeln(s);
 		s:='';
 	end;
 end;
 
begin
	assign(input,'fracdec.in'); reset(input);
	readln(n,d);
	close(input);
	assign(output,'fracdec.out'); rewrite(output);
	fillchar(flag,sizeof(flag),255);
	k:=n div d;
	str(k,s);
	s:=s + '.';
	n:=n mod d;
	flag[n]:=0;
	cur:=0;
	repeat
		inc(cur);
		n:=n * 10;
		a[cur]:=n div d;
		n:=n mod d;
		if (flag[n] <> -1) then break else flag[n]:=cur;
	until (n = 0);
	if (n = 0) then begin
		for i:=1 to cur do print(chr(48 + a[i]));
	end else begin
		for i:=1 to flag[n] do print(chr(48 + a[i]));
		print('(');
		for i:=flag[n] + 1 to cur do print(chr(48 + a[i]));
		print(')');
	end;
	if (s <> '') then writeln(s);
	close(output);
end.