program p1504;
var n,i,s1,s2,sum:longint;
procedure change(var x:longint);
 var p,k:longint;
 begin
     p:=0; k:=x;
     while k>0 do begin
	 p:=p*10+k mod 10;
	 k:=k div 10;
     end;
     x:=p;
 end;

begin
    readln(n);
    for i:=1 to n do begin
	readln(s1,s2);
	change(s1); change(s2);
	sum:=s1+s2;
	change(sum);
	writeln(sum);
    end;
end.