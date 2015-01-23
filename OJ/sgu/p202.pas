program p202;
const
	maxn = 64;
	maxm = 65;
type
	stacknode = record
		top:longint;
		list:array[1..maxm] of longint;
	end;
	
var
	f:array[0..maxm,0..maxn] of extended; //qword
	p:array[0..maxm,0..maxn] of longint;
	stack:array[1..maxm] of stacknode;
	n,m:longint;
	
procedure init;
 begin
 	readln(n,m);
 end;

procedure push(x,k:longint);
 begin
 	inc(stack[x].top);
 	stack[x].list[stack[x].top]:=k;
 end;

procedure pop(x:longint);
 begin
 	dec(stack[x].top);
 end;
 
function top(x:longint):longint;
 begin
 	top:=stack[x].list[stack[x].top];
 end;

function empty(x:longint):boolean;
 begin
	empty:=stack[x].top = 0;
 end;

procedure print(x,y,s,t,cur:longint);
 var
 	i,k:longint;
 begin
 	if (y = 0) then exit;
 	if (x = 2) then begin
 		write('move ',cur,' from ',s,' to ',t);
 		if (not empty(t)) then write(' atop ',top(t));
 		writeln;
 		pop(s);
 		push(t,cur);
 		exit;
 	end;
 	k:=p[x,y];
 	for i:=1 to m do
 		if (i <> s) and (i <> t) and (empty(i) or (cur + k <= top(i))) then begin
 			print(x,k,s,i,cur);
 			print(x - 1,y - k,s,t,cur + k);
 			print(x,k,i,t,cur);
 			exit;
 		end;
 end;

procedure main;
 var
 	i,j,k:longint;
 begin
 	for i:=3 to m do f[i,0]:=0;
 	for i:=1 to n do begin
 		f[3,i]:=f[3,i - 1] * 2 + 1;
 		p[3,i]:=i - 1;
 	end;
 	for i:=4 to m do
 		for j:=1 to n do begin
 			f[i,j]:=f[i - 1,j];
 			for k:=0 to j - 1 do
 				if (f[i,j] >= f[i - 1,j - k] + f[i,k] * 2) then begin
 					f[i,j]:=f[i - 1,j - k] + f[i,k] * 2;
 					p[i,j]:=k;
 				end;
 		end;
 	writeln(f[m,n]:0:0);
 	fillchar(stack,sizeof(stack),0);
 	for i:=n downto 1 do push(1,i);
 	print(m,n,1,m,1);
 end;
 
begin
	init;
	main;
end.
