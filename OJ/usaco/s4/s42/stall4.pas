{
ID:lijianx1
PROG:stall4
LANG:PASCAL
}
program stall4;
const maxn=200;
var n,m,i,j,x,k,total:longint;
    a:array[1..maxn,1..maxn] of boolean;
    f:array[1..maxn] of longint;
    flag:array[1..maxn] of boolean;
function extendpath(x:longint):boolean;
 var i:longint;
 begin
     for i:=1 to m do
     	if (a[x,i]) and (not flag[i]) then begin
             flag[i]:=true;
             if (f[i]=0) or (extendpath(f[i])) then begin
                 f[i]:=x;
                 exit(true);
             end;
         end;
     extendpath:=false;
 end;
 
begin
    assign(input,'stall4.in'); reset(input);
    fillchar(a,sizeof(a),false);
    fillchar(f,sizeof(f),0); 
    readln(n,m);
    for i:=1 to n do begin
        read(k);
        for j:=1 to k do begin
            read(x);
            a[i,x]:=true;
        end;
        readln;
    end;
    close(input);
    total:=0;
    for i:=1 to n do begin
        fillchar(flag,sizeof(flag),false);
        if extendpath(i) then inc(total);
    end;
    assign(output,'stall4.out'); rewrite(output);
    writeln(total);
    close(output);
end.