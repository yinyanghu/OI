program p214;
const
	maxn = 200;
	maxl = 2000;
var
	alphabet:ansistring;
	stra,strb:ansistring;
	n,lena,lenb:longint;
	list:array[char] of longint;
	mina,minb:array[1..maxn] of longint;
	d:array[1..maxn,1..maxn] of longint;
	f:array[0..maxl,0..maxl] of longint;
	path:array[0..maxl,0..maxl] of longint;
	
procedure init;
 var
 	i,j:longint;
 begin
 	readln(alphabet);
 	n:=length(alphabet);
 	readln(stra);
 	readln(strb);
 	lena:=length(stra);
 	lenb:=length(strb);
 	for i:=1 to n do begin
 		list[alphabet[i]]:=i;
 		for j:=1 to n do read(d[i,j]);
 		readln;
 	end;
 end;

procedure main;
 var
 	i,j,x,y:longint;
 	alpha,beta:ansistring;
 begin
 	for i:=1 to n do begin
 		mina[i]:=1;
 		for j:=2 to n do
 			if (d[i,j] < d[i,mina[i]]) then mina[i]:=j;
 	end;
 	for j:=1 to n do begin
 		minb[j]:=1;
 		for i:=2 to n do
 			if (d[i,j] < d[minb[j],j]) then minb[j]:=i;
 	end;
 	f[0,0]:=0;
 	for i:=1 to lena do begin
 		x:=list[stra[i]];
 		path[i,0]:=1;
 		f[i,0]:=f[i - 1,0] + d[x,mina[x]];
 	end;
 	for i:=1 to lenb do begin
 		x:=list[strb[i]];
 		path[0,i]:=-1;
 		f[0,i]:=f[0,i - 1] + d[minb[x],x];
 	end;
	for i:=1 to lena do
		for j:=1 to lenb do begin
			x:=list[stra[i]];
			y:=list[strb[j]];
			f[i,j]:=f[i - 1,j - 1] + d[x,y];
			path[i,j]:=0;
			if (f[i,j] > f[i - 1,j] + d[x,mina[x]]) then begin
				f[i,j]:=f[i - 1,j] + d[x,mina[x]];
				path[i,j]:=1;
			end;
			if (f[i,j] > f[i,j - 1] + d[minb[y],y]) then begin
				f[i,j]:=f[i,j - 1] + d[minb[y],y];
				path[i,j]:=-1;
			end;
		end;
	writeln(f[lena,lenb]);
	i:=lena; j:=lenb;
	alpha:=''; beta:='';
	repeat
		if (path[i,j] = 1) then begin
			alpha:=stra[i] + alpha;
			beta:=alphabet[mina[list[stra[i]]]] + beta;
			dec(i);
		end else if (path[i,j] = -1) then begin
			alpha:=alphabet[minb[list[strb[j]]]] + alpha;
			beta:=strb[j] + beta;
			dec(j);
		end else begin
			alpha:=stra[i] + alpha;
			beta:=strb[j] + beta;
			dec(i); dec(j);
		end;
	until (i = 0) and (j = 0);
	writeln(alpha);
	writeln(beta);
 end;

begin
	init;
	main;
end.
