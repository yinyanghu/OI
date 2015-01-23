program p171;
const
	maxm = 100;
	maxn = 1600000;
type
	zonenode = record
		num,q:longint;
	end;
	node = record
		key,p,w:longint;
	end;
var
	zone:array[1..maxm] of zonenode;
	people:array[1..maxn] of node;
	link:array[1..maxn] of longint;
	m,n:longint;
	
procedure init;
 var
 	i:longint;
 begin
 	readln(m);
 	n:=0;
 	for i:=1 to m do begin
 		read(zone[i].num);
 		n:=n + zone[i].num;
 	end;
 	for i:=1 to m do read(zone[i].q);
 	for i:=1 to n do read(people[i].p);
 	for i:=1 to n do read(people[i].w);
 	for i:=1 to n do people[i].key:=i;
 end;
 
procedure sort(l,r:longint);
 var
 	i,j,x:longint;
 	y:node;
 begin
 	i:=l; j:=r; x:=people[(l + r) shr 1].w;
 	repeat
 		while (people[i].w > x) do inc(i);
 		while (people[j].w < x) do dec(j);
 		if (i <= j) then begin
 			y:=people[i]; people[i]:=people[j]; people[j]:=y;
 			inc(i); dec(j);
 		end;
 	until (i > j);
 	if (l < j) then sort(l,j);
 	if (i < r) then sort(i,r);
 end;
 
procedure main;
 var
 	i,j,best:longint;
 begin
 	sort(1,n);
 	for i:=1 to n do begin
 		best:=0;
 		for j:=1 to m do
 			if (people[i].p > zone[j].q) and (zone[j].num > 0) then
 				if (best = 0) or (zone[best].q < zone[j].q) then best:=j;
		if (best = 0) then begin
			for j:=1 to m do
				if (zone[j].num > 0) and ((best = 0) or (zone[j].q > zone[best].q)) then best:=j;
		end;
		dec(zone[best].num);
		link[people[i].key]:=best;
 	end;
 	for i:=1 to n do write(link[i],' ');
	writeln;
 end;

begin
	init;
	main;
end.
