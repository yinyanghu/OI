program shudu;
var a:array[1..9,1..9] of longint;
    b,c,d:array[1..9,1..9] of boolean;
    i,j:longint;
    k:char;

procedure print;
 var i,j:longint;
 begin
     for i:=1 to 9 do begin
         for j:=1 to 9 do write(a[i,j]);
         writeln;
     end;
     halt;
 end;

procedure dfs(x,y:longint);
 var i,j:longint;
 begin
     if (x=9) and (y=9) then begin
         for i:=1 to 9 do if b[x,i] then a[x,y]:=i;
         print;
     end;
     if a[x,y]=0 then begin
        for i:=1 to 9 do
          if (b[x,i]) and (c[y,i]) and (d[((x-1) div 3)*3+(y+2) div 3,i]) then begin
              d[((x-1) div 3)*3+(y+2) div 3,i]:=false;
              b[x,i]:=false;
              c[y,i]:=false;
              a[x,y]:=i;
              if y=9 then dfs(x+1,1)
                else dfs(x,y+1);
              a[x,y]:=0;
              d[((x-1) div 3)*3+(y+2) div 3,i]:=true;
              b[x,i]:=true;
              c[y,i]:=true;
          end;
     end else if y=9 then dfs(x+1,1)
       else dfs(x,y+1);
 end;

begin
    assign(input,'shudu.in'); reset(input);
    fillchar(a,sizeof(a),0);
    fillchar(b,sizeof(b),true);
    fillchar(c,sizeof(c),true);
    fillchar(d,sizeof(d),true);
    for i:=1 to 9 do begin
        for j:=1 to 9 do begin
            read(k);
            if k<>'0' then begin
                a[i,j]:=ord(k)-48;
                b[i,ord(k)-48]:=false;
                c[j,ord(k)-48]:=false;
                d[((i-1) div 3)*3+(j+2) div 3,ord(k)-48]:=false;
            end;
        end;
        readln;
    end;
    close(input);
    dfs(1,1);
end.
