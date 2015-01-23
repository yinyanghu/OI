program p3278;
const maxqueue=100000;
      maxn=100000;
type node=record
	 t,key:longint;
     end;
var n,k,head,tail,m:longint;
    q:array[1..maxqueue] of node;
    flag:array[0..maxn] of boolean;
begin
    readln(n,k);
    head:=0; tail:=1; q[tail].key:=n; q[tail].t:=0;
    fillchar(flag,sizeof(flag),true);
    flag[n]:=false;
    while head<=tail do begin
        inc(head); m:=q[head].key;
	if m=k then break;
	if (m-1>=0) and (flag[m-1]) then begin
	    inc(tail); q[tail].key:=m-1; q[tail].t:=q[head].t+1; flag[m-1]:=false;
	end;
	if (m+1<=maxn) and (flag[m+1]) then begin
	    inc(tail); q[tail].key:=m+1; q[tail].t:=q[head].t+1; flag[m+1]:=false;
	end;
	if (m*2<=maxn) and (flag[m*2]) then begin
	    inc(tail); q[tail].key:=m*2; q[tail].t:=q[head].t+1; flag[m*2]:=false;
	end;
    end;
    writeln(q[head].t);
end.
