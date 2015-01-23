{
ID:lijianx1
PROG:hamming
LANG:PASCAL
}
program hamming;
var n,b,d,i,s,k,p,m:longint;
    ok:array[0..255] of boolean;
    a:array[1..64] of longint;
    flag:boolean;
procedure print;
 var i,total:longint;
 begin
     total:=0;
     for i:=1 to n-1 do begin
         write(a[i]);
         inc(total);
         if total=10 then begin
             total:=0;
             writeln;
         end else write(' ');
     end;
     writeln(a[n]);
     close(output);
     halt;
 end;

procedure dfs(k:longint);
 var i,j:longint;
 begin
     for i:=a[k-1]+1 to m do begin
         flag:=false;
         for j:=1 to k-1 do
            if not ok[a[j] xor i] then begin
                flag:=true; break;
            end;
         if flag then continue;
         a[k]:=i;
         if k=n then print else dfs(k+1);
     end;
 end;

begin
    assign(input,'hamming.in'); reset(input);
    readln(n,b,d);
    close(input);
    m:=1 shl b-1;
//    fillchar(ok,sizeof(ok),false);
    for i:=0 to m do begin
        s:=i; k:=0;
        while s<>0 do begin
            p:=s mod 2;
            s:=s div 2;
            if p=1 then inc(k);
        end;
        if k>=d then ok[i]:=true;
    end;
    a[1]:=0;
    assign(output,'hamming.out'); rewrite(output);
    dfs(2);
    close(output);
end.