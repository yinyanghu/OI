program picture;
const n=6;
      g:array[1..n,1..n] of integer=((0,1,0,0,1,1),
                                     (1,0,1,1,0,1),
                                     (0,1,0,1,0,0),
                                     (0,1,1,0,1,1),
                                     (1,0,0,1,0,1),
                                     (1,1,0,1,1,0));
var a:array[1..n] of integer;
    i,j,r,sum,p,s,k:integer;

procedure find;
 begin
     sum:=0; p:=0; s:=1;
     for i:=1 to n do begin
         a[i]:=0;
         for j:=1 to n do a[i]:=a[i]+g[i,j];
         sum:=sum+a[i];
         if odd(a[i]) then begin
             inc(p);
             s:=i;
         end;
     end;
 end;

begin
    find;
    if p>2 then begin
        writeln('No Solution');
        halt;
    end;
    k:=s;
    write(s);
    repeat
       r:=0;
       repeat
          inc(r);
       until (g[k,r]>0) and ((a[r]>1) or ((a[r]=1) and (sum=2)));
       g[k,r]:=0;
       g[r,k]:=0;
       sum:=sum-2;
       dec(a[k]); dec(a[r]);
       k:=r;
       write('--->',r);
    until sum=0;
    writeln;
end.