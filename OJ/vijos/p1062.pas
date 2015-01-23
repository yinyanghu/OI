program p1062;
var n,i,m,total:longint;
    a:array[1..30000] of longint;
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
    readln(n); total:=0;
    fillchar(a,sizeof(a),false);
    for i:=1 to n do begin
	read(m);
	a[m+total+1]:=1;
	inc(total);
    end;
    for i:=1 to m+total do
        if a[i]=1 then write(check(i),' ');
end.