program loj_0009;
type arr=array[1..100000] of longint;
var a,b,c,d:arr;
    n,i:longint;

function poes(k:longint; c:arr; l,len:longint):longint;
 var i:longint;
 begin
     i:=l;
     while i<=len do
       if k=c[i] then exit(i);
     poes:=0;
 end;

procedure make(a:arr; l,len:longint; var c:arr);
 var i,k:longint;
 begin
     k:=1; i:=l;
     while k<=len do begin
         c[k]:=a[i];
         inc(k);
         inc(i);
     end;
 end;

procedure find(a,b:arr; l1,r1,l2,r2:longint);
 var s,l:longint;
 begin
     l:=r1;
     if l=1 then write(a[l]) else begin
	 s:=poes(a[1],b,l2,r2);
         make(a,2,s-1,c); make(b,1,s-1,d);
	 if (s-1>0) then find(c,d,2,s-1,1,s-1);
         make(a,s+1,l-s,c); make(b,s+1,l-s,d);
	 if (l-s>0) then find(c,d,s+1,l-s,s+1,l-s);
	 write(a[1]);
     end;
 end;

begin
    assign(input,'loj.in'); reset(input);
    readln(n);
    for i:=1 to n do read(a[i]);
    for i:=1 to n do read(b[i]);
    close(input);
    find(a,b,1,n,1,n);
end.
