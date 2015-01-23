program p405;
const
	maxn = 100;
	maxm = 100;
var
	n,m,first,second,i,j,x,y:longint;
	score:array[1..maxn] of longint;
	
function check(a,b:longint):longint;
 var
 	k:longint;
 begin
 	k:=0;
 	if ((a > b) and (first > second)) or ((a < b) and (first < second)) or ((a = b) and (first = second)) then k:=k + 2;
 	if (first - second = a - b) then k:=k + 3; 	
 	if (a = first) then k:=k + 1;
 	if (b = second) then k:=k + 1;
 	check:=k;
 end;
 
begin
	readln(n,m);
	fillchar(score,sizeof(score),0);
	for i:=1 to m do begin
		readln(first,second);
		for j:=1 to n do begin
			readln(x,y);
			score[j]:=score[j] + check(x,y);
		end;
	end;
	for i:=1 to n - 1 do write(score[i],' ');
	writeln(score[n]);
end. 
