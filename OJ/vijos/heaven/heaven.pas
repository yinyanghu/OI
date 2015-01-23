program heaven;
const day:array[1..11] of integer=(31,29,31,30,31,30,31,31,30,31,30);
var i,j,k,m,n,d,t,max:longint;
    a:array[1..366] of boolean;
begin
    assign(input,'heaven9.in'); reset(input);
    assign(output,'heaven.out'); rewrite(output);
    readln(n);
    if n=0 then begin
        writeln('86400');
        halt;
    end;
    fillchar(a,sizeof(a),false);
    for i:=1 to n do begin
	readln(m,d);
	t:=0;
	for j:=1 to m-1 do t:=t+day[j];
  	t:=t+d;
	a[t]:=true;
    end;
    max:=0;
    k:=0;
    for i:=1 to 366 do if a[i] then begin
	if (i-k-1>max) then max:=i-k-1;
	k:=i;
    end;
    writeln(round((24*60*60*max)/366));
    close(input);
    close(output);
end.
