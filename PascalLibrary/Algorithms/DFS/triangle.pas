program triangle;
const maxn=100;
var a:array[1..maxn,1..maxn] of integer;
    max:longint;
    n,i,j:integer;
procedure try(x,y,k:integer; sum:longint);
 begin
     if k=n then begin
         if sum>max then max:=sum;
         exit;
     end;
     try(x+1,y,k+1,sum+a[x+1,y]);
     try(x+1,y+1,k+1,sum+a[x+1,y+1]);
 end;
begin
    assign(input,'triangle.in'); reset(input);
    assign(output,'triangle.out'); rewrite(output);
    readln(n);
    fillchar(a,sizeof(a),0);
    for i:=1 to n do
      for j:=1 to i do read(a[i,j]);
    max:=0;
    try(1,1,1,a[1,1]);
    writeln(max);
    close(input);
    close(output);
end.