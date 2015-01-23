program p3193;
const
	limitsize = 1000;
	left = ord(',');
	right = ord('z');
type
	node = record
		size:longint;
		list:array[1..limitsize] of string;
	end;
var
	a:array[left..right] of node;
	s:string;
	n,m,i,j,tot,k:longint;

begin
	readln(n,m);
	for i:=1 to n do begin
		readln(s);
		k:=ord(s[1]);
		inc(a[k].size);
		a[k].list[a[k].size]:=s;
	end;
	tot:=0;
	for i:=1 to m do begin
		readln(s);
		k:=ord(s[1]);
		for j:=1 to a[k].size do
			if (pos(s,a[k].list[j]) <> 0) then begin
				inc(tot);
				break;
			end;
	end;
	writeln(tot);
end.