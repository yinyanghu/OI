program way;
var a:array[0..100] of integer;
    n,total:integer;
procedure print(l:integer);
 var i:integer;
 begin
     inc(total);
     for i:=0 to l do write(a[i]:4);
     writeln;
 end;

procedure try(k:integer);
 var i,j:integer;
 begin
     for i:=1 to n do
       if (a[k-1]+1=i) or (a[k-1]+2=i) and (a[k]=0) then begin
           a[k]:=i;
           if i<n then try(k+1) else print(k);
           a[k]:=0;
       end;
 end;

begin
    fillchar(a,sizeof(a),0);
    readln(n);
    a[0]:=0; total:=0;
    try(1);
    writeln(total);
    readln;
end.