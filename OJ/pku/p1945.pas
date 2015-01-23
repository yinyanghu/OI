program p1945;
const maxn=2000000;
      k1=1 shl 15;
      k2=trunc(sqrt(k1))+1;      
type node=record
         a,b,k:longint;
     end;
var q:array[1..maxn] of node;
    flag:array[0..k1,0..k2] of boolean;
    a:array[1..4] of longint;
    p,x,y,i,l,r:longint;
procedure swap(var a,b:longint);
 var k:longint;
 begin
     k:=a; a:=b; b:=k;
 end;
 
begin
    readln(p);
    fillchar(flag,sizeof(flag),true);
    q[1].a:=1; q[1].b:=0; q[1].k:=0; flag[1,0]:=false;
    l:=0; r:=2;
    while l<r do begin
        inc(l);
        x:=q[l].a; y:=q[l].b;
        a[1]:=x+y; a[2]:=x-y;
        a[3]:=x*2; a[4]:=y*2;
        for i:=1 to 4 do if a[i]>0 then begin
            q[r].a:=a[i]; q[r].b:=y; q[r].k:=q[l].k+1;
            if q[r].a<q[r].b then swap(q[r].a,q[r].b);
            if q[r].a=p then begin
                writeln(q[r].k);
                exit;
            end;
            if (q[r].a<=k1) and (q[r].b<=k2) and (flag[q[r].a,q[r].b]) then begin
                flag[q[r].a,q[r].b]:=false;
                inc(r);
            end;
            q[r].a:=x; q[r].b:=a[i]; q[r].k:=q[l].k+1;
            if q[r].a<q[r].b then swap(q[r].a,q[r].b);
            if q[r].a=p then begin
                writeln(q[r].k);
                exit;
            end;
            if (q[r].a<=k1) and (q[r].b<=k2) and (flag[q[r].a,q[r].b]) then begin
                flag[q[r].a,q[r].b]:=false;
                inc(r);
            end;
        end;
    end;
end.