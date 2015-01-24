{
ID:lijianx1
PROG:holstein
LANG:PASCAL
}
program holstein;
var min,n,m,i,j,k,total:longint;
    v:array[1..25] of longint;
    s,best:array[1..15] of longint;
    a:array[1..15,1..25] of longint;
    ok:array[1..15] of boolean;
function check:boolean;
 var i:longint;
 begin
     for i:=1 to n do
        if v[i]>0 then exit(false);
     check:=true;
 end;

procedure dfs(k,p:longint);
 var temp:array[1..25] of longint;
     i:longint;
 begin
     if k>min then exit;
     temp:=v;
     for i:=p to m do if ok[i] then begin
         ok[i]:=false;
         for j:=1 to n do v[j]:=v[j]-a[i,j];
         s[k]:=i;
         if check then begin
             if k<min then begin
                 min:=k;
                 best:=s;
             end;
             ok[i]:=true;
             v:=temp;
             exit;
         end else dfs(k+1,i+1);
         ok[i]:=true;
         v:=temp;
     end;
 end;

begin
    assign(input,'holstein.in'); reset(input);
    readln(n);
    for i:=1 to n do read(v[i]);
    readln(m);
    for i:=1 to m do
        for j:=1 to n do read(a[i,j]);
    close(input);
    min:=m+1;
    fillchar(ok,sizeof(ok),true);
    dfs(1,1);
    assign(output,'holstein.out'); rewrite(output);
    write(min);
    for i:=1 to min do write(' ',best[i]);
    writeln;
    close(output);
end.
