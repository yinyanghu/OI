program edmondskarp;
const maxn=100;
var a:array[1..maxn,1..maxn] of longint;
    pre,aug,q:array[1..maxn] of longint;
    ans,n:longint;
procedure init;
 var i,m,x,y,k:longint;
 begin
     fillchar(a,sizeof(a),0);
     ans:=0;
     assign(input,'ek.in'); reset(input);
     readln(m,n);
     for i:=1 to m do begin
	 readln(x,y,k);
	 inc(a[x,y],k);
     end;
     close(input);
 end;

function min(a,b:longint):longint;
 begin
     if a<b then min:=a else min:=b;
 end;

procedure findaugpath;
 var l,r,p,i:longint;
 begin
     l:=0; r:=1; q[1]:=1;
     while (l<r) and (pre[n]=-1) do begin
	 inc(l); p:=q[l];
 	 for i:=2 to n do
	    if (pre[i]=-1) and (a[p,i]>0) then begin
		inc(r);
		q[r]:=i;
		pre[i]:=p;
		aug[i]:=min(aug[p],a[p,i]);
	    end;
     end;
 end;


procedure augpath;
 var i,k,p:longint;
 begin
     k:=aug[n];
     ans:=ans+k;
     i:=n;
     while i>1 do begin
	 p:=pre[i];
	 inc(a[i,p],k);
	 dec(a[p,i],k);
	 i:=pre[i];
     end;
 end;

procedure main;
 begin
     aug[1]:=maxlongint;
     while true do begin
	 fillchar(pre,sizeof(pre),255);
	 findaugpath;
	 if pre[n]=-1 then exit;
	 augpath;
     end;
 end;

procedure print;
 begin
     assign(output,'ek.out'); rewrite(output);
     writeln(ans);
     close(output);
 end;

begin
    init;
    main;
    print;
end.