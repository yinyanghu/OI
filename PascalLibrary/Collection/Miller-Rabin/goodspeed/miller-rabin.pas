program millerrabin;
const maxl=40;
      s=10;
      //a:array[1..s] of longint=(2,3,5,7,11,13,17,19,23,29);
var i:longint;
function modular_exp(a,b,c:longint):int64;
 var x:array[1..maxl] of longint;
     i,len,k:longint;
     ans:int64;
 begin
     k:=b; len:=0;
     while k>0 do begin
         inc(len);
         x[len]:=k mod 2;
         k:=k div 2;
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
     x:array[0..maxl] of int64;
 begin
     k:=n-1; t:=0;
     while (k mod 2=0) do begin
	 inc(t); k:=k div 2;
     end;
     x[0]:=modular_exp(a,k,n);  
     for i:=1 to t do begin
	 x[i]:=(x[i-1]*x[i-1]) mod n;
	 if (x[i]=1) and (x[i-1]<>1) and (x[i-1]<>n-1) then exit(true);
     end;
     if x[i]<>1 then exit(true) else exit(false);
 end;

function check(n,s:longint):boolean;
 var i,a:longint;
 begin
     if (n mod 2=0) then exit(false);
     for i:=1 to s do begin
	 a:=random(n-2)+1;
	 if witness(a,n) then exit(false);
     end;
     check:=true;
 end;

function test(x:longint):boolean;
 var i:longint;
 begin
     if x=1 then exit(false);
     if x=2 then exit(true);
     for i:=2 to trunc(sqrt(x))+1 do
        if x mod i=0 then exit(false);
     test:=true;
 end;

begin
    randomize;
    //assign(output,'miller-rabbin.out'); rewrite(output);
    i:=2;
    while not false do begin 
	inc(i);
        if check(i,s)<>test(i) then begin writeln(i); exit; end;
	if i=maxlongint then begin
	    writeln('Accept!!!'); halt;
	end;
    end;  
    //close(output);
end.
