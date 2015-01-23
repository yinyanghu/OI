program water;
var na:array[1..5000] of string;
    a:array[1..5000] of ansistring;
    n,i:longint;

function check(a,b:ansistring):boolean;
 var l1,l2:longint;
 begin
     l1:=length(a); l2:=length(b);
     if l1=l2 then
       if a>b then exit(true)
         else exit(false);
     if l1>l2 then exit(true) else exit(false);
 end;

procedure sort(l,r:longint);
 var i,j:longint;
     s:ansistring;
 begin
     for i:=l to r do
       for j:=i+1 to r do begin
           if check(a[j],a[i]) then begin
               s:=a[i]; a[i]:=a[j]; a[j]:=s;
               s:=na[i]; na[i]:=na[j]; na[j]:=s;
           end;
       end;
 end;

procedure namesort(l,r:longint);
 var i,j:longint;
     s:ansistring;
 begin
     for i:=1 to r do
       for j:=i+1 to r do begin
         if (a[i]=a[j]) and (na[i]>na[j]) then begin
             s:=na[i]; na[i]:=na[j]; na[j]:=s;
         end;
     end;
 end;

begin
    readln(n);
    for i:=1 to n do begin
        readln(na[i]);
        readln(a[i]);
    end;
    sort(1,n);
    namesort(1,n);
    for i:=1 to n do writeln(na[i]);
end.