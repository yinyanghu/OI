program p1016;
var n,i,m,total,p,t,k:longint;
    a:array[1..100] of longint;
function check(x:longint):longint;
 var i,k:longint; 
 begin
     k:=0;
     for i:=x-1 downto 1 do begin
	 if a[i]=2 then inc(k);
         if a[i]=0 then begin
	    a[i]:=2;
	    exit(k+1);
	 end;
     end;
 end;

begin
    readln(t);
    for p:=1 to t do begin
        readln(n); total:=0;
        fillchar(a,sizeof(a),false);
        for i:=1 to n do begin
	    read(m);
	    a[m+total+1]:=1;
	    inc(total);
        end;
	k:=0;
        for i:=1 to m+total do if a[i]=1 then begin
	    inc(k);
	    if k<total then write(check(i),' ') else writeln(check(i));
	end;
    end;
end.