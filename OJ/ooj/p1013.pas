program p1013;
var f:array[1..50] of qword;
    i,n:longint;
begin
    readln(n);
    f[1]:=2; f[2]:=3;
    for i:=3 to n do f[i]:=f[i-1]+f[i-2];
    writeln(f[n]);
end.
{
var n:longint;
    total:qword;
    a:array[1..50] of qword;
procedure dfs(p:longint);
 var i:longint;
     s:qword;
 begin
     inc(total);
     for i:=p to n do begin
         if a[i+2]<>0 then total:=total+a[i+2]
           else begin
               s:=total;
               dfs(i+2);
               a[i+2]:=total-s;
           end;
     end;
 end;

begin
    readln(n);
    if n=0 then begin
        writeln(0);
        exit;
    end;
    fillchar(a,sizeof(a),0);
    total:=0;
    dfs(1);
    writeln(total);
end.
}
