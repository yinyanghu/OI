program frog;
var h,k,i:longint;
    s:qword;
begin
    assign(input,'frog.in'); reset(input);
    assign(output,'frog.out'); rewrite(output);
    readln(h,k);
    s:=k+1;
    for i:=1 to h do s:=s+s;
    writeln(s);
    close(input);
    close(output)
end.