program p2458;
const
	n = 5;
	m = n * n;
	all = 7;
var
	a:array[1..m] of boolean;
	flag:array[1..m] of boolean;
	point:array[1..all] of longint;
	queue:array[1..m] of longint;
	i,total:longint;
	ch:char;
	
function min(a,b:longint):longint;
 begin
	if (a < b) then min:=a else min:=b;
 end;

function connect:boolean;
 var
	i,k,head,tail:longint;
 begin
	fillchar(flag,sizeof(flag),false);
	for i:=2 to all do flag[point[i]]:=true;
	head:=0; tail:=1; queue[1]:=point[1];
	while (head < tail) do begin
		inc(head); k:=queue[head];
		if (k - 1 >= 1) and (k mod 5 <> 1) and (flag[k - 1]) then begin
			inc(tail);
			queue[tail]:=k - 1;
			flag[k - 1]:=false;
		end;
		if (k - 5 >= 1) and (flag[k - 5]) then begin
			inc(tail);
			queue[tail]:=k - 5;
			flag[k - 5]:=false;
		end;
		if (k + 1 <= m) and (k mod 5 <> 0) and (flag[k + 1]) then begin
			inc(tail);
			queue[tail]:=k + 1;
			flag[k + 1]:=false;
		end;
		if (k + 5 <= m) and (flag[k + 5]) then begin
			inc(tail);
			queue[tail]:=k + 5;
			flag[k + 5]:=false;
		end;
		if (tail = all) then exit(true);
	end;
	connect:=false;
 end;

function outnumber:boolean;
 var
	i,sum:longint;
 begin
 	sum:=0;
	for i:=1 to all do
		if (a[point[i]]) then inc(sum) else dec(sum);
	outnumber:=sum > 0;
 end;

procedure check(k,last:longint);
 var
	i:longint;
 begin
 	if (k = all + 1) then begin
 		if (connect) and (outnumber) then inc(total);
 		exit;
 	end;
	for i:=last + 1 to m - all + k do begin
		point[k]:=i;
		check(k + 1,i);
	end;
 end;
 
begin
	for i:=1 to m do begin
		read(ch);
		a[i]:=ch = 'J';
		if (i mod 5 = 0) then readln;
	end;
	total:=0;
	check(1,0);
	writeln(total);
end.