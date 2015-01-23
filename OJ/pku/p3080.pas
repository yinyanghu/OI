program p3080;
const maxn=10;
      maxl=60;
var a:array[1..maxn] of string;
    w,i,n,p:longint;
    k:string;
function check(s:string):boolean;
 var i:longint;
 begin
     for i:=2 to n do
 	if pos(s,a[i])=0 then exit(false);
     check:=true;
 end;
 
function getmax:string;
 var max,i,j:longint;
     temp:string;
 begin
     max:=0; getmax:='';
     for i:=1 to maxl do
     	for j:=3 to maxl-i+1 do begin
             temp:=copy(a[1],i,j);
             if check(temp) and (j>=max) then begin
             	if j>max then begin
                    max:=j; getmax:=temp;
                 end else if temp<getmax then getmax:=temp;
	    end;
         end;
 end;
 
begin
    readln(w);
    for p:=1 to w do begin
        readln(n);
        for i:=1 to n do readln(a[i]);
        k:=getmax;
        if k='' then writeln('no significant commonalities')
        	  else writeln(k);
    end;
end.