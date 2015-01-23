program p1336;
var x,y,f:array[0..1000]of longint;
    n,m,k:longint;

procedure init;
 var i:longint;
 begin
     readln(n,m);
     readln(k);
     for i:=1 to k do readln(x[i],y[i]);
 end;

procedure qsort(l,r:longint);
 var i,j,mid,t:longint;
 begin
     i:=l; j:=r; mid:=x[(l+r)div 2];
     repeat
        while x[i]<mid do inc(i);
        while x[j]>mid do dec(j);
        if i<=j then begin
          t:=x[i]; x[i]:=x[j]; x[j]:=t;
          t:=y[i]; y[i]:=y[j]; y[j]:=t;
          inc(i); dec(j);
       end;
     until i>j;
     if l<j then qsort(l,j);
     if i<r then qsort(i,r);
 end;

function max(a,b:longint):longint;
 begin
     if a>b then max:=a else max:=b;
 end;

procedure main;
 var i,j,maxf:longint;
     ans:double;
 begin
     for i:=1 to k do
       for j:=0 to i-1 do
         if (x[i]>x[j]) and (y[i]>y[j]) then f[i]:=max(f[i],f[j]+1);
     maxf:=0;
     for i:=1 to k do
       if f[i]>maxf then maxf:=f[i];
     ans:=(n+m)*100-(200-100*sqrt(2))*maxf;
     writeln(round(ans));
 end;

begin
    init;
    qsort(1,k);
    main;
end.