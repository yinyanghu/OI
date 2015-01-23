program p2018;
const exp=0.0001;
      maxn=100000;
var a,f:array[0..maxn] of longint;
    n,len,i:longint;
    left,right,mid:double;
    
function check:boolean;
 var l,r,i,k:longint;
 begin
     l:=1; r:=0; fillchar(f,sizeof(f),0);
     for i:=len to n do begin
         inc(r); k:=i-len;
	 while (r>0) and (a[k]+mid*f[r]<=a[f[r]]+mid*k) do dec(r);
	 inc(r); f[r]:=k;
	 if l>r then l:=r;
	 if a[i]-a[f[l]]>=mid*(i-f[l]) then exit(true);
     end;
     check:=false;
 end;
 
begin
    readln(n,len);
    left:=0; right:=1e10;
    fillchar(a,sizeof(a),0);
    for i:=1 to n do begin
        readln(a[i]);
	if a[i]>right then right:=a[i];
	if a[i]<left then left:=a[i];
	a[i]:=a[i]+a[i-1];
    end;
    while right>left+exp do begin
	mid:=(left+right)/2;
	if check then left:=mid else right:=mid;
    end;
    writeln(trunc((mid+exp)*1000));
end.
