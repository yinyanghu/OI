program stone;
type node=record
	 max,min:longint;
     end;
var f:array[0..500,0..500] of node;
    sum,a:array[0..1000] of longint;
    i,j,k,n,p,max,min:longint;
begin
    readln(n);
    for i:=1 to n do begin
        read(a[i]);
        a[i+n]:=a[i];
    end;
    a[0]:=a[n]; sum[0]:=a[n];
    for i:=1 to 2*n do sum[i]:=sum[i-1]+a[i];
    fillchar(f,sizeof(f),0);
    for p:=1 to n do
	for i:=1 to 2*n-p do begin
	    j:=i+p; max:=0; min:=maxlongint;
	    for k:=i to j-1 do begin
		if f[i,k].max+f[k+1,j].max+sum[j]-sum[i-1]>max then max:=f[i,k].max+f[k+1,j].max+sum[j]-sum[i-1];
		if f[i,k].min+f[k+1,j].min+sum[j]-sum[i-1]<min then min:=f[i,k].min+f[k+1,j].min+sum[j]-sum[i-1];
	    end;
	    f[i,j].max:=max; f[i,j].min:=min;
	end;
    max:=0; min:=maxlongint;
    for i:=1 to n do begin
        if f[i,i+n-1].max>max then max:=f[i,i+n-1].max;
	if f[i,i+n-1].min<min then min:=f[i,i+n-1].min;
    end;
    writeln('Max=',max);
    writeln('Min=',min);
end.
