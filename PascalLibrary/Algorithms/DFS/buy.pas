program buy;
var b:array[1..200] of -1..2;
    d:array[0..1] of integer;
    total,n,k,x,y,i:integer;
    ok:boolean;
procedure find;
 var i:integer;
 begin
     d[0]:=0; d[1]:=0;
     for i:=1 to 2*n do
       if (b[i]=0) then inc(d[0]) else
         if (b[i]=1) then inc(d[1]);
 end;

procedure print;
 var j:integer;
 begin
     inc(total);
     write('No.',total,':');
     for j:=1 to 2*n do write(b[j]:2);
     writeln;
 end;

begin
    readln(n);
    fillchar(b,sizeof(b),-1);
    d[0]:=0; d[1]:=0; total:=0; k:=1;
    repeat
        repeat
             ok:=false;
             inc(b[k]);
             x:=0; y:=0;
             for i:=1 to n*2 do
               if (b[i]=0) then inc(x) else
                 if (b[i]=1) then inc(y);
             if (x<=n) and (b[k]=0) then ok:=true;
             if (y<=x) and (b[k]=1) then ok:=true;
        until ok or (b[k]=2);
        if ok then find;
        if ok then if (k=2*n) and (d[0]=d[1]) then print else inc(k)
          else begin
              find;
              b[k]:=-1;
              dec(k);
          end;
    until k=0;
    writeln;
    readln;
end.