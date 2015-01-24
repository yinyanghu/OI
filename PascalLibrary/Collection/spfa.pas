program spfa;
const
	maxn = 500;
	maxqueue = 10000;
	infinity = 1000000000;
var
	a:array[1..maxn,1..maxn] of longint;
	flag:array[1..maxn] of boolean;
	check:array[1..maxn] of longint;
	f:array[1..maxn] of longint;
	queue:array[1..maxqueue] of longint;
	start,finish,n:longint;
	
procedure init;
 var
 	i,m,x,y,k:longint;
 begin
 	assign(input,'spfa.in'); reset(input);
 	readln(n,m);
 	fillchar(a,sizeof(a),0);
 	for i:=1 to m do begin
 		readln(x,y,k);
 		a[x,y]:=k;
 	end;
 	readln(start,finish);
 	close(input);
 end;
 
procedure spfa;
 var
 	i,k,head,tail:longint;
 begin
 	for i:=1 to n do begin
 		f[i]:=infinity;
 		flag[i]:=true;
		check[i]:=0;
 	end;
 	head:=0; tail:=1; check[start]:=1;
 	queue[1]:=start; flag[start]:=false; f[start]:=0;
 	while (head <> tail) do begin
 		inc(head); if (head > maxqueue) then head:=1;
 		k:=queue[head]; flag[k]:=true;
 		for i:=1 to n do
 			if (a[k,i] <> 0) and (f[k] + a[k,i] < f[i]) then begin
 				f[i]:=f[k] + a[k,i];
 				if (flag[i]) then begin
					inc(check[i]);
					if (check[i] > n) then begin
						writeln('minus circle');
						halt;
					end;
 					inc(tail); if (tail > maxqueue) then tail:=1;
 					queue[tail]:=i; flag[i]:=false;
 				end;
 			end;
 	end;
 end;
 
procedure print;
 begin
 	assign(output,'spfa.out'); rewrite(output);
 	writeln(f[finish]);
 	close(output);
 end;
 
begin
	init;
	spfa;
	print;
end.
