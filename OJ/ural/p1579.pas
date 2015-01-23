program p1579;
const maxn=100000;
type node=record
	 num,v:longint;
     end;
     data=record
	 next,ok:longint;
     end;
var q:array[1..maxn] of node;
    a,last:array[1..maxn] of longint;
    s:array[1..maxn] of data;
    i,l,r,k,n,limit,total:longint;
begin
    readln(n,limit);
    l:=1; r:=1; total:=1; read(k);
    q[1].v:=k; q[1].num:=1; a[1]:=1;
    s[1].ok:=1; last[1]:=1;
    for i:=2 to n do begin
	read(k);
	if k-q[l].v<=limit then begin
	    inc(r); inc(total);
	    q[r].v:=k; q[r].num:=total;
	    a[total]:=1; s[i].ok:=total;
	    last[total]:=i;
	end else begin
	    inc(r); q[r].num:=q[l].num; q[r].v:=k;
	    inc(a[q[r].num]); s[last[q[r].num]].next:=i;
	    last[q[r].num]:=i;
	    inc(l);
	end;
    end;
    writeln(total);
    for i:=1 to n do begin
	if s[i].ok<>0 then begin
	    write(a[s[i].ok],' ',i);
	    k:=s[i].next;
	    while k<>0 do begin
	        write(' ',k);
		k:=s[k].next;
	    end;
	    writeln;
	end;
    end;
end.
