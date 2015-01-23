program compages;
var i,m,n,total,p:longint;
    a:array[1..5000] of longint;

procedure try(k,sum:longint);
 var i,p:longint;
 begin
     for i:=k to n do begin
	 p:=sum+a[i];
         if (p=m) and (k<=n) then inc(total)
            else if (p<m) and (k+1<=n) then try(i+1,p);
     end;
 end;

begin
    assign(input,'compages.in'); reset(input);
    assign(output,'compages.out'); rewrite(output);
    readln(n,m);
    fillchar(a,sizeof(a),0);
    for i:=1 to n do read(a[i]);
    total:=0;
    try(1,0);
    writeln(total);
    close(input);
    close(output);
end.