program check;
var i,j,k,m,n,max,min,p,q:longint;
    a:array[1..10000] of longint;
    ok:array[1..10000] of boolean;
    step:char;
function change(x:longint):longint;
 var p,i:longint;
 begin
     p:=0; i:=0;
     while (p<>x) and (i<=n) do begin
         inc(i);
         if ok[i] then inc(p);
     end;
     change:=i;
 end;

begin
    assign(input,'intree1.in'); reset(input);
    assign(output,'test2.out'); rewrite(output);
    readln(n,m);
    fillchar(a,sizeof(a),0);
    for i:=1 to n do read(a[i]);
    fillchar(ok,sizeof(ok),true);
    readln;
    for i:=1 to m do begin
        read(step);
        case step of
            'D':begin
                    while step<>' ' do read(step);
                    readln(k);
                    k:=change(k);
                    ok[k]:=false;
                end;
            'R':begin
                    while step<>' ' do read(step);
                    readln(p,q);
                    p:=change(p); q:=change(q);
                    max:=-maxlongint; min:=maxlongint;
                    for j:=p to q do
                      if ok[j] then begin
                          if a[j]>max then max:=a[j];
                          if a[j]<min then min:=a[j];
                      end;
                    writeln('max=',max,' min=',min);
                end;
        end;
    end;
    close(input);
    close(output);
end.