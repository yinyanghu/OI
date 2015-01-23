program p1949;
const maxn=10000;
var a:array[1..maxn] of longint;
    time,i,j,k,x,n,p,temp:longint;
begin
    fillchar(a,sizeof(a),0);
    readln(n);
    time:=0;
    for i:=1 to n do begin
        read(k,p);
	temp:=0;
        for j:=1 to p do begin
            read(x);
            if a[x]>temp then temp:=a[x];
        end;
        readln;
	a[i]:=k+temp;
	if a[i]>time then time:=a[i];
    end;
    writeln(time);
end.