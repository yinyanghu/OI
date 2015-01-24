{
ID:lijianx1
PROG:lamps
LANG:PASCAL
}
program lamps;
const maxn=100;
      maxans=32;
type node=record
	 a:array[1..maxn] of boolean;
	 k:longint;
     end;
var n,c,onnum,offnum,total:longint;
    on,off:array[1..maxn] of longint;
    ans:array[1..maxans] of node;
    s:array[1..maxn] of boolean;
procedure init;
 var k:longint;
 begin
     assign(input,'lamps.in'); reset(input);
     readln(n); readln(c);
     onnum:=0; offnum:=0;
     read(k);
     while k<>-1 do begin
	 inc(onnum); on[onnum]:=k;
	 read(k);
     end;
     read(k);
     while k<>-1 do begin
	 inc(offnum); off[offnum]:=k;
	 read(k);
     end;
     close(input);
 end;

procedure change(x,d:longint);
 var k:longint;
 begin
     k:=x;
     while k<=n do begin
	 s[k]:=not s[k];
	 inc(k,d);
     end;
 end;

function exchange:longint;
 var i,m,k:longint;
 begin
     if n>6 then m:=6 else m:=n;
     k:=0;
     for i:=1 to m do
	 if s[i] then k:=k*2+1 else k:=k*2;
     exchange:=k;
 end;

procedure check;
 var i:longint;
 begin
     for i:=1 to onnum do
	if not s[on[i]] then exit;
     for i:=1 to offnum do
	if s[off[i]] then exit;
     inc(total);
     ans[total].a:=s;
     ans[total].k:=exchange;
 end;

procedure sort;
 var i,j:longint;
     k:node;
 begin
     for i:=1 to total-1 do
	for j:=i+1 to total do
	    if ans[i].k>ans[j].k then begin
		k:=ans[i]; ans[i]:=ans[j]; ans[j]:=k;
	    end;
 end;

procedure main;
 var i,j,k,i1,i2,i3,i4:longint;
 begin
     total:=0;
     for i1:=0 to 1 do
	for i2:=0 to 1 do
	    for i3:=0 to 1 do
		for i4:=0 to 1 do
		    if (i1+i2+i3+i4<=c) then begin
			fillchar(s,sizeof(s),true);
			if i1=1 then change(1,1);
			if i2=1 then change(1,2);
			if i3=1 then change(2,2);
			if i4=1 then change(1,3);
			check;
		    end;
     sort;
     assign(output,'lamps.out'); rewrite(output);
     if total=0 then writeln('IMPOSSIBLE')
	else begin
	    for i:=1 to total do begin
		if (i<>1) and (ans[i].k=ans[i-1].k) then continue;
		k:=n;
		while k>=6 do begin
		    for j:=1 to 6 do
			if ans[i].a[j] then write(1) else write(0);
		    k:=k-6;
		end;
		for j:=1 to k do
		   if ans[i].a[j] then write(1) else write(0);
		writeln;
	    end;
	end;
     close(output);
 end;

begin
    init;
    main;
end.
