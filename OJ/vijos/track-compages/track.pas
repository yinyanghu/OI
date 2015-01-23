program track;
var a:array[0..100] of integer;
    n,r:integer;

procedure print;
 var i:integer;
 begin
     for i:=1 to r do write(a[i],' ');
     writeln;
 end;

procedure try(k:integer);
 var i,j:integer;
 begin
     for i:=(a[k-1]+1) to (n-r+k) do begin
         a[k]:=i;
         if k=r then print else try(k+1);
     end;
 end;

begin
    assign(input,'track.in'); reset(input);
    assign(output,'track.out'); rewrite(output);
    readln(n,r);
    try(1);
    close(input);
    close(output);
end.