program p3614;
const maxn=2500;
type cownode=record
	 min,max:longint;
     end;
     bottlenode=record
         key,tot:longint;
     end;
var cow:array[1..maxn] of cownode;
    bottle:array[1..maxn] of bottlenode;
    flag:array[1..maxn] of boolean;
    n,l,i,j,ans:longint;
procedure cowsort(l,r:longint);
 var i,j,x:longint;
     y:cownode;
 begin
     i:=l; j:=r; x:=cow[(l+r) shr 1].max;
     repeat
	while cow[i].max<x do inc(i);
	while cow[j].max>x do dec(j);
	if i<=j then begin
	    y:=cow[i]; cow[i]:=cow[j]; cow[j]:=y;
	    inc(i); dec(j);
	end;
     until i>j;
     if l<j then cowsort(l,j);
     if i<r then cowsort(i,r);
 end;
 
procedure bottlesort(l,r:longint);
 var i,j,x:longint;
     y:bottlenode;
 begin
     i:=l; j:=r; x:=bottle[(l+r) shr 1].key;
     repeat
	while bottle[i].key<x do inc(i);
	while bottle[j].key>x do dec(j);
	if i<=j then begin
	    y:=bottle[i]; bottle[i]:=bottle[j]; bottle[j]:=y;
	    inc(i); dec(j);
	end;
     until i>j;
     if l<j then bottlesort(l,j);
     if i<r then bottlesort(i,r);
 end;
 
begin
    readln(n,l);
    for i:=1 to n do readln(cow[i].min,cow[i].max);
    for i:=1 to l do readln(bottle[i].key,bottle[i].tot);
    cowsort(1,n);
    bottlesort(1,l);
    ans:=0;
    fillchar(flag,sizeof(flag),true);
    for i:=1 to l do begin
        if bottle[i].tot=0 then continue;
	for j:=1 to n do
	    if (flag[j]) and (cow[j].min<=bottle[i].key) and (bottle[i].key<=cow[j].max) then begin
	        flag[j]:=false; inc(ans);
		dec(bottle[i].tot); if bottle[i].tot=0 then break;
	    end;
    end;
    writeln(ans);
end.
