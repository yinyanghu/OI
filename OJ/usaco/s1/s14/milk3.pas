{
ID:lijianx1
PROG:milk3
LANG:PASCAL
}
program milk3;
var a,b,c,i:longint;
    s:array[0..20,0..20] of boolean;
    first:boolean;
function min(a,b:longint):longint;
 begin
     if a<b then min:=a else min:=b;
 end;

procedure bfs(ra,rc:longint);
 var rb:longint;
 begin
     if s[ra,rc] then exit;
     s[ra,rc]:=true;
     rb:=c-ra-rc;
     bfs(ra-min(ra,b-rb),rc); {a-->b}
     bfs(ra-min(ra,c-rc),rc+min(ra,c-rc));{a-->c};
     bfs(ra+min(rb,a-ra),rc);{b-->a}
     bfs(ra,rc+min(rb,c-rc));{b-->c}
     bfs(ra+min(rc,a-ra),rc-min(rc,a-ra));{c-->a}
     bfs(ra,rc-min(rc,b-rb));{c-->b}
 end;

begin
    assign(input,'milk3.in'); reset(input);
    assign(output,'milk3.out'); rewrite(output);
    readln(a,b,c);
    fillchar(s,sizeof(s),false);
    bfs(0,c);
    first:=true;
    for i:=0 to c do
       if s[0,i] then begin
           if first then begin
              write(i);
              first:=false;
           end else write(' ',i);
       end;
    writeln;
    close(input);
    close(output);
end.
