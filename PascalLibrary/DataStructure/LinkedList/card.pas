program card;
const n=13;
var a:array[1..n] of integer;
    i,m,p,s,total,sum:integer;
    ok:array[1..n] of boolean;

procedure print(k:integer);
 begin
     inc(sum);
     if k in [2..10] then
        write(k) else
          case k of
              1:write('A');
              11:write('J');
              12:write('Q');
              13:write('K');
          end;
     if sum<>n then write(' ');
 end;

begin
    fillchar(ok,sizeof(ok),true);
    fillchar(a,sizeof(a),0);
    total:=1; ok[total]:=false;
    a[total]:=1; s:=1;
    while total<n do begin
        m:=a[s]+1; p:=1;
        while p<>m do begin
            if ok[s] then inc(p);
            inc(s);
            if s>n then s:=s-n;
        end;
        while ok[s]=false do begin
            inc(s);
            if s>n then s:=s-n;
        end;
        ok[s]:=false; inc(total);
        a[s]:=total;
    end;
    sum:=0;
    assign(output,'card.out'); rewrite(output);
    for i:=1 to n do print(a[i]);
    close(output);
end.