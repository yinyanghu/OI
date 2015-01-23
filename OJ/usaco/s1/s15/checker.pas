{
ID:lijianx1;
PROG:checker
LANG:PASCAL
}
program checker;
const maxn=13;
var a:array[1..maxn] of boolean;
    b:array[2..maxn*2] of boolean;
    c:array[1-maxn..maxn-1] of boolean;
    x:array[1..maxn] of longint;
    n,upperlim,sum,total:longint;

procedure test(row,ld,rd:longint);
 var pos,p:longint;
 begin
     if row<>upperlim then begin
        pos:=upperlim and not (row or ld or rd);
        while pos<>0 do begin
            p:=pos and -pos;
            pos:=pos-p;
            test(row+p,(ld+p)shl 1,(rd+p)shr 1);
        end;
     end else inc(sum);
 end;


procedure print;
 var i:longint;
 begin
     inc(total);
     for i:=1 to n-1 do write(x[i],' ');
     writeln(x[n]);
     if total=3 then begin
	 writeln(sum);
         close(output);
	 halt;
     end;
 end;

procedure dfs(i:longint);
 var j:longint;
 begin
     for j:=1 to n do
         if a[j] and b[j+i] and c[j-i] then begin
             x[i]:=j;
             a[j]:=false; b[j+i]:=false; c[j-i]:=false;
             if i<n then dfs(i+1) else print;
             a[j]:=true; b[j+i]:=true; c[j-i]:=true;
         end;
 end;

begin
    assign(input,'checker.in'); reset(input);
    assign(output,'checker.out'); rewrite(output);
    readln(n);
    close(input);
    upperlim:=(1 shl n)-1;
    test(0,0,0);
    total:=0;
    fillchar(a,sizeof(a),true);
    fillchar(b,sizeof(b),true);
    fillchar(c,sizeof(c),true);
    dfs(1);
end.