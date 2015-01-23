program p223;
const
	maxn = 10;
	maxk = maxn * maxn;
var
	state:array[1..1 shl maxn] of longint;
	delta:array[1..1 shl maxn] of longint;
	f:array[boolean,1..1 shl maxn,0..maxk] of int64;
	n,king,m:longint;
	
procedure init;
 begin
 	readln(n,king);
 end;

procedure expandstate(depth,curstate,kingnum:longint);
 begin
 	if (depth > n) then begin
 		inc(m);
 		state[m]:=curstate;
 		delta[m]:=kingnum;
 		exit;
 	end;
 	expandstate(depth + 1,curstate shl 1,kingnum);
 	if (curstate and 1 = 0) then expandstate(depth + 1,curstate shl 1 + 1,kingnum + 1);
 end;

procedure main;
 var
 	i,j,k,p:longint;
 	ans:int64;
 	flag:boolean;
 begin
 	fillchar(state,sizeof(state),0);
 	m:=0;
 	expandstate(1,0,0);
 	fillchar(f,sizeof(f),0);
 	flag:=false;
 	f[flag,1,0]:=1;
 	for i:=1 to n do begin
 		for j:=1 to m do
 			for k:=1 to m do
 				if (state[j] and state[k] = 0) and ((state[j] shl 1) and state[k] = 0) and ((state[j] shr 1) and state[k] = 0) then begin
 					for p:=0 to king do
 						if (p + delta[k] <= king) then f[not flag,k,p + delta[k]]:=f[not flag,k,p + delta[k]] + f[flag,j,p];
 				end;
 		fillchar(f[flag],sizeof(f[flag]),0);
 		flag:=not flag;
 	end;
 	ans:=0;
 	for i:=1 to m do ans:=ans + f[flag,i,king];
 	writeln(ans);
 end;

begin
	init;
	main;
end.
