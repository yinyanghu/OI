const maxn=100;
var
   a:array[1..maxn] of boolean;
   b:array[2..maxn*2] of boolean;
   c:array[1-maxn..maxn-1] of boolean;
   x:array[1..maxn] of integer;
   total:longint;
   n:integer;

procedure print;
 var i:integer;
 begin
     inc(total);
     write(total:3,':');
     for i:=1 to n do write(x[i]:3);
     writeln;
 end;

procedure try(i:integer);
 var j:integer;
 begin
     for j:=1 to n do
         if a[j] and b[j+i] and c[j-i] then begin
             x[i]:=j;
             a[j]:=false;
             b[j+i]:=false;
             c[j-i]:=false;
             if i<n then try(i+1)
               else print;
             a[j]:=true;
             b[j+i]:=true;
             c[j-i]:=true;
         end;
 end;

begin
    write('Queens Numbers=');
    readln(n);
    fillchar(a,sizeof(a),true);
    fillchar(b,sizeof(b),true);
    fillchar(c,sizeof(c),true);
    try(1);
    writeln('total=',total);
    readln;
end.
