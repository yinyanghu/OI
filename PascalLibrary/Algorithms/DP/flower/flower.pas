program flower; { b[i,j]=max(b[i-1,k-1]+a[i,k]) }
const maxn=100;
var f,v,i,j,k,cmax,current,maxv:integer;
    table,a:array[1..maxn,1..maxn] of integer;

procedure print(current,maxv:integer);
 var i:integer;
 begin
     if current>0 then begin
         i:=current;
         while a[current,i]<>maxv do i:=i+1;
         print(current-1,maxv-table[current,i]);
         write(i,' ')
     end;
 end;

begin
    assign(input,'flower.in'); reset(input);
    assign(output,'flower.out'); rewrite(output);
    readln(f,v);
    for i:=1 to f do begin
        for j:=1 to v do read(table[i,j]);
        readln;
    end;
    close(input);
    maxv:=-maxint;
    for i:=1 to v do
      if maxv<table[1,i] then begin
         a[1,i]:=table[1,i];
         maxv:=table[1,i]
      end else a[1,i]:=table[1,i];
    for i:=2 to f do
      for j:=i to v-f+i do begin
          maxv:=-maxint;
          for k:=i-1 to j-1 do begin
              cmax:=-maxint;
              for current:=k+1 to j do
                if table[i,current]>cmax then cmax:=table[i,current];
              if cmax+a[i-1,k]>maxv then maxv:=cmax+a[i-1,k]
          end;
          a[i,j]:=maxv
      end;
    maxv:=-maxint;
    for i:=f to v do
    if a[f,i]>maxv then maxv:=a[f,i];
    writeln(maxv);
    print(f,maxv);
    close(output);
end.
