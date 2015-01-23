program p406;
const
	maxn = 10;
	maxm = 10;
type
	datanode = record
		key:set of 0..255;
		len:longint;
		seq:array[1..maxm] of longint;
	end;
var
	goggle:array[1..maxn] of datanode;
	flag:array[1..maxn] of boolean;
	n,m,i,j,k,p,ans:longint;
	
procedure check(x:longint);
 var
 	i:longint;
 begin
 	if (x > 0) then begin
 		for i:=1 to n do
 			if (flag[i]) then 
 				if not (x in goggle[i].key) then flag[i]:=false;
 	end else begin
 		for i:=1 to n do
 			if (flag[i]) then
 				if (-x in goggle[i].key) then flag[i]:=false;
 	end;
 end;
 
procedure print(x:longint);
 var
 	i:longint;
 begin
 	write(goggle[x].len);
 	for i:=1 to goggle[x].len do
 		write(' ',goggle[x].seq[i]);
 	writeln;
 end;
 
begin
	readln(n,m);
	for i:=1 to n do begin
		read(goggle[i].len);
		goggle[i].key:=[];
		for j:=1 to goggle[i].len do begin
			read(goggle[i].seq[j]);
			goggle[i].key:=goggle[i].key + [goggle[i].seq[j]];
		end;
	end;
	for i:=1 to m do begin
		fillchar(flag,sizeof(flag),true);
		read(p);
		for j:=1 to p do begin
			read(k);
			check(k);
		end;
		ans:=0;
		for j:=1 to n do
			if (flag[j]) then inc(ans);
		writeln(ans);
		if (ans <> 0) then begin
			for j:=1 to n do
				if (flag[j]) then print(j);
		end;
	end;
end.
