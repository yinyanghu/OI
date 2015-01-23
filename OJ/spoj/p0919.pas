program p919;
const maxl=31;
      s=2;
      a:array[1..s] of longint=(2,3);
var x:int64;
    total:longint;
function modular_exp(a,b,c:longint):int64;
 var x:array[1..maxl] of longint;
     i,len,k:longint;
     ans:int64;
 begin
     k:=b; len:=0;
     while k>0 do begin
         inc(len);
         x[len]:=k and 1;
         k:=k shr 1;
     end;
     ans:=1;
     for i:=len downto 1 do begin
	 ans:=(ans*ans) mod c;
         if x[i]=1 then ans:=(ans*a) mod c;
     end;
     modular_exp:=ans;
 end;

function witness(a,n:longint):boolean;
 var k,i,t:longint;
     x,y:int64;
 begin
     k:=n-1; t:=0;
     while (k and 1=0) do begin
	 inc(t); k:=k shr 1;
     end;
     x:=modular_exp(a,k,n);  
     for i:=1 to t do begin
	 y:=(x*x) mod n;
	 if (y=1) and (x<>1) and (x<>n-1) then exit(true);
	 x:=y;
     end;
     if y<>1 then exit(true) else exit(false);
 end;

function check(n:longint):boolean;
 var i:longint;
 begin
     if n=1 then exit(false);
     if n=2 then exit(true);
     if (n and 1=0) then exit(false);
     for i:=1 to s do 
	 if witness(a[i],n) then exit(false);
     check:=true;
 end;

begin
    x:=1; total:=0; 
    while not false do begin
	inc(total); 
	if check(x) then write(1) else write(0);
	if total=1800000 then break;
        x:=(x+1234567890) and maxlongint;
    end;
end.
