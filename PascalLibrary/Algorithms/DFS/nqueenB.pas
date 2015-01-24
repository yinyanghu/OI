program nqueen;
const maxn=50;
var ans:array[1..3,1..maxn] of longint;
    s:array[1..maxn] of longint;
    pre,next:array[0..maxn+1] of longint;
    pie:array[2..maxn*2] of boolean;
    na:array[1-maxn..maxn-1] of boolean;
    n,i,j:longint;
    total:qword;

procedure search(x:longint);
 var y:longint;
 begin
     y:=0;
     repeat
       y:=next[y];
       if y>n then exit;
       if not pie[x+y] and not na[x-y] then begin
           pie[x+y]:=true;
           na[x-y]:=true;
           pre[next[y]]:=pre[y];
           next[pre[y]]:=next[y];
           s[x]:=y;
           if x=n then begin
                inc(total);
                if total<4 then ans[total]:=s;
           end else search(x+1);
           pie[x+y]:=false;
           na[x-y]:=false;
           pre[next[y]]:=y;
           next[pre[y]]:=y;
       end;
     until false;
 end;

procedure start(y:longint);
 begin
     if not pie[1+y] and not na[1-y] then begin
         pie[1+y]:=true;na[1-y]:=true;
         pre[next[y]]:=pre[y];next[pre[y]]:=next[y];
         s[1]:=y;
         search(2);
         pie[1+y]:=false;na[1-y]:=false;
         pre[next[y]]:=y;next[pre[y]]:=y;
     end;
 end;

begin
    readln(n);
    for i:=1 to n do begin
        pre[i]:=i-1;
        next[i]:=i+1;
    end;
    pre[n+1]:=n;
    next[0]:=1;
    if n=6 then for i:=1 to 6 do start(i)
      else begin
          for i:=1 to n shr 1 do start(i);
          total:=total*2;
          if odd(n) then start(n shr 1+1);
      end;
    {for i:=1 to 3 do begin
        for j:=1 to n-1 do write(ans[i,j],' ');
        writeln(ans[i,n]);
    end;}
    writeln(total);
    readln;
end.
