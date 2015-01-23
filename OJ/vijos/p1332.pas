program p1332;
const maxn=100;
var a:array[0..maxn] of longint;
    n,i,ans:longint;
procedure search(s,k,tot:longint);
 begin
     if s>n then begin
        if tot>ans then ans:=tot;
        exit;
     end else begin
         if odd(k) then begin
            search(s+1,k-1,tot+a[s]);
            search(s+1,k,tot-a[s]);
         end else begin
	     search(s+1,k,tot+a[s]);
             if k>0 then search(s+1,k-1,tot-a[s]);
         end;
         if a[s]<0 then begin
	    if odd(k) then begin
	       search(s+1,k,tot+a[s]);
	       search(s+1,k+1,tot-a[s]);
            end else begin
                search(s+1,k+1,tot+a[s]);
                if k>0 then search(s+1,k,tot-a[s]);
            end;
         end;
     end;
 end;

begin
    ans:=-maxlongint;
    readln(n);
    for i:=1 to n do readln(a[i]);
    a[0]:=0;
    search(1,0,0);
    writeln(ans);
end.
