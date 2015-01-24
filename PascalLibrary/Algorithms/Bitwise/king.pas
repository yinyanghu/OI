program king;
const maxn=20;
var f:array[0..maxn,0..1 shl maxn-1] of longint;
    ans,n,m,x,y,z,i,s:longint;
function lowbit(x:longint):longint;
 begin
     lowbit:=x and (-x);
 end;    
 
begin
    readln(n);
    m:=1 shl n;
    f[0,0]:=1; ans:=0;
    for i:=1 to n do begin
        x:=0;
        while x<m do begin
            s:=(not x) and (not (x shr 1)) and (not (x shl 1)) and (m-1);
            y:=s+1;
            while y>0 do begin
                y:=(y-1) and s;
                f[i,x]:=f[i,x]+f[i-1,y];
            end;
            z:=lowbit((x xor (x shr 1))+1);
            if (i=n) then ans:=ans+f[i,x];
            x:=(x and (not (z-1))) or z;
        end;
    end;
    writeln(ans);
end.
