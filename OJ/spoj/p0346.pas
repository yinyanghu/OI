program p0346;
var n,i,t:longint;
    s:array[1..1000000] of qword;

function f(a:longint):qword;
 var k:qword;
 begin
     if a=0 then exit(0);
     if a<1000000 then begin
        if (s[a]<>0) then f:=s[a]
          else begin
               k:=f(a div 2)+f(a div 3)+f(a div 4);
               if a>k then f:=a else f:=k;
               s[a]:=f;
           end;
     end else begin
         k:=f(a div 2)+f(a div 3)+f(a div 4);
         if a>k then f:=a else f:=k;
     end;
 end;

begin
    while not eof do begin
        readln(n);
        writeln(f(n));
    end;
end.
