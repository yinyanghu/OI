program stack1;
var a:array[0..10000] of qword;
    n,i,j:longint;
begin
    assign(input,'stack1.in'); reset(input);
    assign(output,'stack1.out'); rewrite(output);
    readln(n);
    fillchar(a,sizeof(a),0);
    a[0]:=1;
    for i:=1 to n do
      for j:=0 to i-1 do a[i]:=a[i]+a[j]*a[i-j-1];
    writeln(a[n]);
    close(input);
    close(output);
end.