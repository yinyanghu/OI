program stack;
var n,i,j,k:integer;
    a:array[0..1000] of qword;
begin
    assign(input,'stack.in'); reset(input);
    assign(output,'stack.out'); rewrite(output);
    readln(n);
    fillchar(a,sizeof(a),0);
    a[0]:=1;
    for i:=1 to n do
      for j:=0 to i-1 do a[i]:=a[i]+a[j]*a[i-j-1];
    writeln(a[n]);
    close(input);
    close(output);
end.