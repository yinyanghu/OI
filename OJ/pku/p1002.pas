program p1002;
var a:array[1..100001] of longint;
    i,j,n,k:longint;
    s:string;
    ok:boolean;
procedure sort(l,r:longint);
 var i,j,x,y:longint;
 begin
     i:=l; j:=r; x:=a[(l+r) div 2];
     repeat
       while a[i]<x do inc(i);
       while a[j]>x do dec(j);
       if i<=j then begin
           y:=a[i]; a[i]:=a[j]; a[j]:=y;
           inc(i);
           dec(j);
       end;
     until i>j;
     if l<j then sort(l,j);
     if i<r then sort(i,r);
 end;

procedure print(x:longint);
 var i,l:longint;
     s:string;
 begin
     str(x,s); l:=length(s);
     if l<7 then for i:=1 to 7-l do s:='0'+s;
     for i:=1 to 7 do begin
         write(s[i]);
      	 if i=3 then write('-');
     end;
     write(' ');
 end;

begin
    readln(n); ok:=false;
    for i:=1 to n do begin
	readln(s); a[i]:=0;
	for j:=1 to length(s) do
	    if s[j] in ['0'..'9'] then begin
               k:=ord(s[j])-48;
               a[i]:=a[i]*10+k;
            end else if s[j] in ['A'..'Y'] then begin
        	    case s[j] of
        	        'A'..'C':k:=2;
        	        'D'..'F':k:=3;
        	        'G'..'I':k:=4;
        	        'J'..'L':k:=5;
        	        'M'..'O':k:=6;
        	        'P','R','S':k:=7;
        	        'T'..'V':k:=8;
        	        'W'..'Y':k:=9;
        	    end;
                a[i]:=a[i]*10+k;
            end;
    end;
    sort(1,n);
    a[n+1]:=maxlongint;
    k:=1;
    for i:=2 to n+1 do
      if a[i]=a[i-1] then inc(k)
        else if k>1 then begin
       	    print(a[i-1]);
            ok:=true;
            writeln(k);
            k:=1;
        end;
    if ok=false then writeln('No duplicates.');
end.