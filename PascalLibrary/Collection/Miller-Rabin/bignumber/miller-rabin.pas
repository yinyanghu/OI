program millerrabin;
const maxlen=12;
      s=4;
      a:array[1..s] of int64=(2,3,5,7);
   
function getmulmod(a,b,c:int64):int64;
 var k:int64;
 begin
     if b=0 then exit(0);
     k:=getmulmod(a,b shr 1,c);
     k:=k shl 1 mod c;
     if odd(b) then k:=(k+a) mod c;
     getmulmod:=k;
 end;
	       
function getexpmod(a,b,c:int64):int64;
 var k:int64;
 begin
     if b=0 then exit(1);
     k:=getexpmod(a,b shr 1,c);
     k:=getmulmod(k,k,c);
     if odd(b) then k:=getmulmod(k,a,c);
     getexpmod:=k;
 end;    

function witness(a,n:int64):boolean;
 var i,t:longint;
     k,x,y:int64;
 begin
     k:=n-1; t:=0;
     while (k and 1=0) do begin
	 inc(t); k:=k shr 1;
     end;
     x:=getexpmod(a,k,n);
     for i:=1 to t do begin
	 y:=getmulmod(x,x,n);
	 if (y=1) and (x<>1) and (x<>n-1) then exit(true);
	 x:=y;
     end;
     if y<>1 then exit(true) else exit(false);
 end;

function check(n:int64):boolean;
 var i:longint;
 begin
     if n=2 then exit(true);
     if (n=1) or (n and 1=0) then exit(false);
     for i:=1 to s do
	 if witness(a[i],n) then exit(false);
     check:=true;
 end;


begin
    
end.

